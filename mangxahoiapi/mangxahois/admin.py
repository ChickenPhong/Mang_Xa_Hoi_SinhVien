from django.contrib import admin
from django.core.mail import send_mail
from django.utils.html import mark_safe
from django.utils.translation import gettext_lazy as _
from .models import User, CuuSinhVien, BaiDang, BinhLuan, ThongBao, Chat, KhaoSat

class UserAdmin(admin.ModelAdmin):
    list_display = ('username', 'email', 'vaiTro', 'SDT', 'avatar_preview')
    search_fields = ('username', 'email')
    list_filter = ('vaiTro',)
    readonly_fields = ('avatar_preview',)

    def avatar_preview(self, obj):
        if obj.image:
            return mark_safe(f'<img src="{obj.image.url}" width="50" height="50" />')
        return "No Image"
    avatar_preview.short_description = "Avatar"

class CuuSinhVienAdmin(admin.ModelAdmin):
    list_display = ('ma_so_sinh_vien', 'ho_va_ten', 'email', 'xac_nhan')
    actions = ['xac_nhan_tai_khoan']

    def xac_nhan_tai_khoan(self, request, queryset):
        for cuu_sinh_vien in queryset:
            cuu_sinh_vien.xac_nhan = True
            cuu_sinh_vien.save()
            # Gửi email
            send_mail(
                'Xác nhận tài khoản',
                f'Tài khoản của bạn đã được xác nhận.\nMã số sinh viên: {cuu_sinh_vien.ma_so_sinh_vien}\nMật khẩu: {cuu_sinh_vien.password}',
                'no-reply@example.com',
                [cuu_sinh_vien.email],
            )
        self.message_user(request, "Xác nhận tài khoản thành công!")

    xac_nhan_tai_khoan.short_description = "Xác nhận tài khoản"

class BaiDangAdmin(admin.ModelAdmin):
    list_display = ('tieuDe', 'nguoiDangBai', 'created_date')
    search_fields = ('tieuDe', 'nguoiDangBai__username')
    list_filter = ('created_date',)

class BinhLuanAdmin(admin.ModelAdmin):
    list_display = ('baiDang', 'nguoiBinhLuan', 'thongTin', 'created_date')
    search_fields = ('baiDang__tieuDe', 'nguoiBinhLuan__username')

class ThongBaoAdmin(admin.ModelAdmin):
    list_display = ('tieuDe', 'nguoiTao', 'created_date')
    search_fields = ('tieuDe', 'nguoiTao__username')

class KhaoSatAdmin(admin.ModelAdmin):
    list_display = ('tieuDe', 'nguoiTao', 'created_date', 'tong_ket_qua')
    search_fields = ('tieuDe', 'nguoiTao__username')

class ChatAdmin(admin.ModelAdmin):
    list_display = ('nguoiGui', 'nguoiNhan', 'thoiGianGui', 'daDoc')
    search_fields = ('nguoiGui__username', 'nguoiNhan__username')

admin.site.site_header = _("Đăng nhập Mạng xã hội")
admin.site.site_title = _("Quản trị Mạng xã hội")
admin.site.index_title = _("Trang quản trị")
admin.site.register(User, UserAdmin)
admin.site.register(CuuSinhVien, CuuSinhVienAdmin)
admin.site.register(BaiDang, BaiDangAdmin)
admin.site.register(BinhLuan, BinhLuanAdmin)
admin.site.register(ThongBao, ThongBaoAdmin)
admin.site.register(KhaoSat, KhaoSatAdmin)
admin.site.register(Chat, ChatAdmin)
