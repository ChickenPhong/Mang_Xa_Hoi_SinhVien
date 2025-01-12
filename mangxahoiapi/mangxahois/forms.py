from django import forms
from .models import CuuSinhVien

class DangKyForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput, label="Đặt mật khẩu")

    class Meta:
        model = CuuSinhVien
        fields = ['ma_so_sinh_vien', 'ho_va_ten', 'password', 'dia_chi', 'so_dien_thoai', 'email']

class DangNhapForm(forms.Form):
    ma_so_sinh_vien = forms.CharField(label="Mã số sinh viên")
    password = forms.CharField(widget=forms.PasswordInput, label="Mật khẩu")
