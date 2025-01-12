from django.contrib.auth.hashers import make_password
from django.core.mail import send_mail
from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models import Model, CASCADE
from enum import IntEnum

class VaiTro(IntEnum):
    QUANTRIVIEN = 1
    GIANGVIEN = 2
    CUUSINHVIEN = 3

    @classmethod
    def choices(cls):
        return [(key.value, key.name) for key in cls]

class User(AbstractUser):
    SDT = models.CharField(max_length=10)
    image = models.ImageField(upload_to='nguoidungs/%Y/%m')
    vaiTro = models.IntegerField(choices=VaiTro.choices(), default=VaiTro.QUANTRIVIEN)
    tuongTac = models.ManyToManyField("self")

    class Meta:
        verbose_name_plural = 'Người dùng'

class CuuSinhVien(models.Model):
    ma_so_sinh_vien = models.CharField(max_length=20, unique=True)
    ho_va_ten = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    dia_chi = models.TextField()
    so_dien_thoai = models.CharField(max_length=15)
    email = models.EmailField(unique=True)
    xac_nhan = models.BooleanField(default=False)

    def save(self, *args, **kwargs):
        # Lưu trạng thái trước khi xác nhận
        was_confirmed = False
        if self.pk:
            was_confirmed = CuuSinhVien.objects.filter(pk=self.pk).first().xac_nhan

        # Mã hóa mật khẩu nếu cần
        if not self.pk or CuuSinhVien.objects.filter(pk=self.pk).first().password != self.password:
            self.password = make_password(self.password)  # Mã hóa mật khẩu

        # Nếu `xac_nhan` là True và tài khoản User chưa tồn tại
        if self.xac_nhan and not User.objects.filter(username=self.ma_so_sinh_vien).exists():
            # Tạo một tài khoản User mới
            user = User.objects.create(
                username=self.ma_so_sinh_vien,
                first_name=self.ho_va_ten.split()[0],  # Lấy tên đầu tiên
                last_name=" ".join(self.ho_va_ten.split()[1:]),  # Các tên còn lại
                email=self.email,
                password=self.password,  # Mật khẩu đã mã hóa
                is_active=True
            )
            # Đặt vai trò là CUUSINHVIEN
            user.vaiTro = 3  # Giả định 3 là giá trị của CUUSINHVIEN trong enum VaiTro
            user.save()

        # Gửi email nếu trạng thái `xac_nhan` thay đổi từ False thành True
        if not was_confirmed and self.xac_nhan:
            self.send_confirmation_email()

        super().save(*args, **kwargs)

    def send_confirmation_email(self):
        """Hàm gửi email thông báo xác nhận tài khoản."""
        subject = "Xác nhận tài khoản Mạng Xã Hội Cựu Sinh Viên"
        message = f"""
        Kính chào {self.ho_va_ten},

        Tài khoản của bạn đã được xác nhận trên hệ thống Mạng Xã Hội Cựu Sinh Viên.

        Thông tin đăng nhập của bạn:
        - Mã số sinh viên: {self.ma_so_sinh_vien}
        - Email: {self.email}
        - Mật khẩu: (bạn đã đặt khi đăng ký)

        Trân trọng,
        Ban Quản Trị
        """
        from_email = "admin@mangxahoi.com"  # Thay bằng email của bạn
        recipient_list = [self.email]

        try:
            send_mail(subject, message, from_email, recipient_list)
        except Exception as e:
            print(f"Lỗi khi gửi email: {e}")

    def __str__(self):
        return f"{self.ma_so_sinh_vien} - {self.ho_va_ten}"

class BaseModel(models.Model):
    active = models.BooleanField(default=True)
    created_date = models.DateTimeField(auto_now_add=True)
    # updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

class BaiDang(BaseModel):
    tieuDe = models.CharField(max_length=255)
    updated_date = models.DateTimeField(auto_now=True)
    thongTin = models.TextField()
    nguoiDangBai = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.tieuDe

    class Meta:
        verbose_name_plural = 'Bài đăng'


class BinhLuan(BaseModel):
    thongTin = models.TextField()
    updated_date = models.DateTimeField(auto_now=True)
    nguoiBinhLuan = models.ForeignKey(User, on_delete=models.CASCADE)
    baiDang = models.ForeignKey(BaiDang,on_delete=models.CASCADE)

    def __str__(self):
        return f"Bình luận từ {self.nguoiBinhLuan.username}"

    class Meta:
        verbose_name_plural = 'Bình luận'

# Mô hình khảo sát
class KhaoSat(BaseModel):
    tieuDe = models.CharField(max_length=255)
    thongTin = models.TextField()
    nguoiTao = models.ForeignKey(User, on_delete=models.CASCADE, related_name='khao_sat')
    tong_ket_qua = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.tieuDe

    class Meta:
        verbose_name_plural = 'Khảo sát'


# Mô hình thông báo
class ThongBao(BaseModel):
    tieuDe = models.CharField(max_length=255)
    thongTin = models.TextField()
    nguoiTao = models.ForeignKey(User, on_delete=models.CASCADE, related_name='thong_bao')

    def __str__(self):
        return self.tieuDe

    class Meta:
        verbose_name_plural = 'Thông báo'

class Chat(BaseModel):
    nguoiGui = models.ForeignKey(User, on_delete=models.PROTECT, related_name='tin_nhan_gui')
    nguoiNhan = models.ForeignKey(User, on_delete=models.PROTECT, related_name='tin_nhan_nhan')
    thoiGianGui = models.DateTimeField(auto_now_add=True)
    daDoc = models.BooleanField(default=False)

    def __str__(self):
        return f"Tin nhắn từ {self.nguoiGui.username} đến {self.nguoiNhan.username}"

    class Meta:
        verbose_name_plural = 'Tin nhắn'

class ChatText(models.Model):  # Không kế thừa Chat
    chat = models.OneToOneField(Chat, on_delete=models.CASCADE, primary_key=True)
    noiDung = models.TextField()

    class Meta:
        verbose_name_plural = 'Tin nhắn văn bản'

    def __str__(self):
        return f"Tin nhắn văn bản: {self.chat.nguoiGui.username}"

class ChatAnh(models.Model):  # Không kế thừa BaseModel
    chat = models.OneToOneField(Chat, on_delete=models.CASCADE, primary_key=True)
    anh = models.ImageField(upload_to='chats/%Y/%m')

    class Meta:
        verbose_name_plural = 'Tin nhắn ảnh'

    def __str__(self):
        return f"Tin nhắn ảnh từ {self.chat.nguoiGui.username} đến {self.chat.nguoiNhan.username}"

