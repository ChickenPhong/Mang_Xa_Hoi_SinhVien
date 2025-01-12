from django.shortcuts import render

# Create your views here.
from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import DangKyForm
from .models import CuuSinhVien

def dang_ky(request):
    if request.method == 'POST':
        form = DangKyForm(request.POST)
        if form.is_valid():
            form.save()  # Lưu thông tin vào CSDL với trạng thái xac_nhan=False
            messages.success(request, "Đăng ký thành công! Chờ quản trị viên xác nhận.")
            return redirect('login')
    else:
        form = DangKyForm()
    return render(request, 'dang_ky.html', {'form': form})

def dang_nhap(request):
    if request.method == 'POST':
        ma_so_sinh_vien = request.POST['ma_so_sinh_vien']
        password = request.POST['password']
        try:
            cuu_sinh_vien = CuuSinhVien.objects.get(ma_so_sinh_vien=ma_so_sinh_vien, password=password)
            if cuu_sinh_vien.xac_nhan:
                # Đăng nhập thành công
                request.session['ma_so_sinh_vien'] = ma_so_sinh_vien
                return redirect('trang_chu')
            else:
                messages.error(request, "Tài khoản chưa được xác nhận bởi quản trị viên.")
        except CuuSinhVien.DoesNotExist:
            messages.error(request, "Mã số sinh viên hoặc mật khẩu không đúng.")
    return render(request, 'dang_nhap.html')