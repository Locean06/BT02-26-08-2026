<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm danh mục mới</title>

    <style>
        /* ================= BỘ KHUNG LAYOUT CHUẨN ================= */
        * { box-sizing: border-box; }
        body { margin: 0; font-family: Arial, Helvetica, sans-serif; background: #f5f5f5; color: #444; }
        
        .header { height: 70px; background: #1597e5; color: white; display: flex; align-items: center; justify-content: space-between; padding: 0 35px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); position: relative; z-index: 10; }
        .header .logo { font-size: 24px; font-weight: bold; letter-spacing: 1px; }
        .header-right { display: flex; align-items: center; gap: 15px; }
        .logout-btn { background: #f45145; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px; font-weight: bold; transition: background 0.3s; }
        .logout-btn:hover { background: #d93c32; }

        .wrapper { display: flex; min-height: calc(100vh - 70px); }

        /* ================= SIDEBAR ================= */
        .sidebar { width: 240px; background: #1e293b; color: white; flex-shrink: 0; box-shadow: 2px 0 5px rgba(0,0,0,0.05); }
        .profile { text-align: center; padding: 30px 10px 20px; border-bottom: 1px solid rgba(255,255,255,0.1); margin-bottom: 10px; }
        
        .avatar { width: 100px; height: 100px; margin: 0 auto 15px; border-radius: 50%; overflow: hidden; background: white; border: 3px solid #1597e5; box-shadow: 0 4px 8px rgba(0,0,0,0.2); }
        .avatar img { width: 100%; height: 100%; object-fit: cover; }
        .profile p { margin: 0; font-size: 15px; font-weight: bold; color: #e2e8f0; }

        .menu { list-style: none; padding: 0; margin: 0; }
        .menu li a { color: #cbd5e1; display: block; padding: 15px 20px; text-decoration: none; font-size: 14.5px; transition: all 0.3s; }
        .menu li a:hover { background: rgba(255,255,255,0.05); color: white; }
        
        /* Menu Danh mục đang Active */
        .menu .category { background: #1597e5; color: white; border-left: 4px solid #f39c12; font-weight: bold; }
        
        .submenu { background: #0f172a; padding-left: 0; }
        .submenu a { padding: 12px 16px 12px 45px !important; font-size: 13.5px !important; color: #94a3b8 !important; }
        .submenu a:hover { color: white !important; }
        
        /* Highlight mục Thêm danh mục */
        .submenu a.active-sub { color: #f39c12 !important; font-weight: bold; }
        
        .icon { margin-right: 12px; font-size: 18px; vertical-align: text-bottom; width: 20px; text-align: center; display: inline-block; }

        /* ================= CONTENT & FORM ================= */
        .content-wrapper { flex: 1; padding: 30px 40px; background: #f8fafc; }
        .content { background: white; min-height: 600px; padding: 35px 40px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.04); }
        
        .page-title { color: #1e293b; font-weight: bold; font-size: 24px; margin: 0 0 5px; }
        .description { font-size: 14px; color: #64748b; margin-top: 0; margin-bottom: 25px; }
        hr { border: none; border-top: 1px solid #e2e8f0; margin-bottom: 30px; }

        .form-group { margin-bottom: 25px; }
        .form-group label { display: block; font-weight: bold; margin-bottom: 10px; color: #334155; font-size: 14px; }
        .form-control { width: 100%; max-width: 600px; padding: 12px 15px; border: 1px solid #cbd5e1; border-radius: 6px; font-size: 14.5px; transition: all 0.3s; outline: none; }
        .form-control:focus { border-color: #1597e5; box-shadow: 0 0 0 3px rgba(21, 151, 229, 0.1); }
        .form-control[type="file"] { padding: 9px 12px; background: #f8fafc; cursor: pointer; }
        
        .btn-group { margin-top: 35px; display: flex; gap: 12px; }
        .btn { padding: 12px 24px; border: none; border-radius: 6px; cursor: pointer; font-size: 14.5px; font-weight: bold; text-decoration: none; display: inline-block; transition: all 0.3s; }
        
        .btn-primary { background: #1597e5; color: white; box-shadow: 0 4px 6px rgba(21, 151, 229, 0.2); }
        .btn-primary:hover { background: #0c82c9; transform: translateY(-1px); }
        
        .btn-secondary { background: #e2e8f0; color: #475569; }
        .btn-secondary:hover { background: #cbd5e1; }

    </style>
</head>
<body>

<div class="header">
    <div class="logo">Hệ Thống Quản Lý</div>
    <div class="header-right">
        <span>Xin chào <b>Admin</b></span>
        <a href="#" class="logout-btn">Đăng xuất</a>
    </div>
</div>

<div class="wrapper">
    <div class="sidebar">
        <div class="profile">
            <div class="avatar">
                <img src="${pageContext.request.contextPath}/images/admin.png" alt="Admin">
            </div>
            <p>Administrator</p>
        </div>

        <ul class="menu">
            <li>
                <a href="${pageContext.request.contextPath}/admin/category/list" class="category">
                    <span class="icon">📁</span> Quản lý Danh mục
                </a>
            </li>

            <li class="submenu">
                <a href="${pageContext.request.contextPath}/admin/category/add" class="active-sub">
                    <span class="icon">＋</span> Thêm danh mục
                </a>
                <a href="${pageContext.request.contextPath}/admin/category/list">
                    <span class="icon">≡</span> Danh sách
                </a>
            </li>

            <li>
                <a href="#">
                    <span class="icon">🖥</span> Quản lý Sản phẩm
                </a>
            </li>

            <li>
                <a href="#">
                    <span class="icon">▦</span> Quản lý Tài khoản
                </a>
            </li>
        </ul>
    </div>

    <div class="content-wrapper">
        <div class="content">
            <h1 class="page-title">Thêm Danh Mục Mới</h1>
            <p class="description">Điền thông tin bên dưới để khởi tạo một danh mục sản phẩm mới vào hệ thống.</p>
            <hr>

            <form action="${pageContext.request.contextPath}/admin/category/add" method="post" enctype="multipart/form-data">
                
                <div class="form-group">
                    <label>Tên danh mục <span style="color: #e74c3c;">*</span></label>
                    <input type="text" name="name" class="form-control" placeholder="Nhập tên danh mục (VD: Thời trang, Điện tử...)" required>
                </div>

                <div class="form-group">
                    <label>Ảnh đại diện (Icon)</label>
                    <input type="file" name="icon" class="form-control" accept="image/*">
                </div>

                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">Lưu danh mục</button>
                    <button type="reset" class="btn btn-secondary">Nhập lại</button>
                    <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-secondary">Quay lại danh sách</a>
                </div>

            </form>

        </div>
    </div>
</div>

</body>
</html>