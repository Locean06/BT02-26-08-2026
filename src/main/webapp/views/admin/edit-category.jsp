<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa danh mục</title>
    <style>

        * { box-sizing: border-box; }
        body { margin: 0; font-family: Arial, Helvetica, sans-serif; background: #f5f5f5; color: #444; }
        .header { height: 70px; background: #1597e5; color: white; display: flex; align-items: center; justify-content: space-between; padding: 0 35px; }
        .header .logo { font-size: 27px; font-weight: bold; }
        .header-right { display: flex; align-items: center; gap: 15px; }
        .logout-btn { background: #f45145; color: white; padding: 10px 14px; text-decoration: none; border-radius: 2px; }
        .logout-btn:hover { background: #d93c32; }
        .wrapper { display: flex; min-height: calc(100vh - 70px); }
        .sidebar { width: 220px; background: #1597e5; color: white; flex-shrink: 0; }
        .profile { text-align: center; padding: 30px 10px 25px; }
        .avatar { width: 145px; height: 145px; margin: 0 auto 20px; border-radius: 50%; overflow: hidden; background: white; border: 4px solid white; }
        .avatar img { width: 100%; height: 100%; object-fit: cover; object-position: center 20%; transform: scale(1.00); }
        .profile p { margin: 0; font-size: 14px; }
        .menu { list-style: none; padding: 0; margin: 0; }
        .menu li a { color: white; display: block; padding: 18px 18px; text-decoration: none; border-bottom: 1px solid rgba(255, 255, 255, 0.15); font-size: 14px; }
        .menu li a:hover { background: #087cc0; }
        .submenu { background: #1597e5; padding-left: 15px; }
        .submenu a { padding: 12px 16px !important; font-size: 13px !important; border-left: 1px solid white; }
        .icon { margin-right: 10px; font-size: 22px; vertical-align: middle; }
        .content-wrapper { flex: 1; padding: 30px 28px; }
        .content { background: white; min-height: 650px; padding: 30px; border-radius: 4px; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
        .page-title { color: #f45145; font-weight: bold; font-size: 24px; margin: 0 0 20px 0; border-bottom: 2px solid #eee; padding-bottom: 15px; }
        
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; font-weight: bold; margin-bottom: 8px; color: #333; }
        .form-control { width: 100%; max-width: 500px; padding: 10px 12px; border: 1px solid #ccc; border-radius: 4px; font-size: 14px; }
        .form-control:focus { border-color: #1597e5; outline: none; }
        .btn-group { margin-top: 25px; display: flex; gap: 10px; }
        .btn { padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; text-decoration: none; display: inline-block; }
        .btn-primary { background: #1597e5; color: white; }
        .btn-primary:hover { background: #087cc0; }
        .btn-warning { background: #f39c12; color: white; }
        .btn-warning:hover { background: #e67e22; }
        .btn-secondary { background: #e0e0e0; color: #333; }
        .btn-secondary:hover { background: #ccc; }
        
        .current-image-wrapper { margin: 15px 0; padding: 15px; border: 1px dashed #ccc; display: inline-block; border-radius: 4px; background: #fafafa; }
        .current-image-wrapper img { max-width: 150px; border-radius: 4px; display: block; margin-top: 10px; }
    </style>
</head>
<body>

<div class="header">
    <div class="logo">Dashboard</div>
    <div class="header-right">
        <span>Xin chào <b>Admin</b></span>
        <a href="#" class="logout-btn">Đăng xuất</a>
    </div>
</div>

<div class="wrapper">
    <div class="sidebar">
        <div class="profile">
            <div class="avatar"><img src="${pageContext.request.contextPath}/images/admin.png" alt="Admin"></div>
            <p>Admin</p>
        </div>
        <ul class="menu">
            <li><a href="#"><span class="icon">◉</span> Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/category/list"><span class="icon">📁</span> Quản lý Danh mục</a></li>
            <li class="submenu">
                <a href="${pageContext.request.contextPath}/admin/category/add">Thêm danh mục mới</a>
                <a href="${pageContext.request.contextPath}/admin/category/list" style="background: #087cc0;">Danh sách danh mục</a>
            </li>
            <li><a href="#"><span class="icon">🖥</span> Quản lý sản phẩm</a></li>
        </ul>
    </div>

    <div class="content-wrapper">
        <div class="content">
            <h1 class="page-title">Chỉnh sửa danh mục</h1>
            
            <form action="${pageContext.request.contextPath}/admin/category/edit" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${category.id}">

                <div class="form-group">
                    <label>Tên danh mục:</label>
                    <input type="text" name="name" value="${category.name}" class="form-control" required>
                </div>

                <c:if test="${not empty category.icon}">
                    <div class="current-image-wrapper">
                        <label>Ảnh đại diện hiện tại:</label>
                        <c:url value="/image" var="imgUrl">
                            <c:param name="fname" value="${category.icon}"/>
                        </c:url>
                        <img src="${imgUrl}" alt="category">
                    </div>
                </c:if>

                <div class="form-group">
                    <label>Cập nhật ảnh mới (Bỏ trống nếu giữ nguyên):</label>
                    <input type="file" name="icon" class="form-control" style="padding: 7px 12px;">
                </div>

                <div class="btn-group">
                    <button type="submit" class="btn btn-warning">Lưu thay đổi</button>
                    <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-secondary">Hủy bỏ / Quay lại</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>