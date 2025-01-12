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

