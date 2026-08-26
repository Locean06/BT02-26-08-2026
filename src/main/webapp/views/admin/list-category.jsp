<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý danh mục</title>

    <style>
        * { box-sizing: border-box; }
        body { margin: 0; font-family: Arial, Helvetica, sans-serif; background: #f5f5f5; color: #444; }
        
        .header { height: 70px; background: #1597e5; color: white; display: flex; align-items: center; justify-content: space-between; padding: 0 35px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); position: relative; z-index: 10; }
        .header .logo { font-size: 24px; font-weight: bold; letter-spacing: 1px; }
        .header-right { display: flex; align-items: center; gap: 15px; }
        .logout-btn { background: #f45145; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px; font-weight: bold; transition: background 0.3s; }
        .logout-btn:hover { background: #d93c32; }

        .wrapper { display: flex; min-height: calc(100vh - 70px); }

        .sidebar { width: 240px; background: #1e293b; color: white; flex-shrink: 0; box-shadow: 2px 0 5px rgba(0,0,0,0.05); }
        .profile { text-align: center; padding: 30px 10px 20px; border-bottom: 1px solid rgba(255,255,255,0.1); margin-bottom: 10px; }
        
        .avatar { width: 100px; height: 100px; margin: 0 auto 15px; border-radius: 50%; overflow: hidden; background: white; border: 3px solid #1597e5; box-shadow: 0 4px 8px rgba(0,0,0,0.2); }
        .avatar img { width: 100%; height: 100%; object-fit: cover; }
        .profile p { margin: 0; font-size: 15px; font-weight: bold; color: #e2e8f0; }

        .menu { list-style: none; padding: 0; margin: 0; }
        .menu li a { color: #cbd5e1; display: block; padding: 15px 20px; text-decoration: none; font-size: 14.5px; transition: all 0.3s; }
        .menu li a:hover { background: rgba(255,255,255,0.05); color: white; }
        
        .menu .category { background: #1597e5; color: white; border-left: 4px solid #f39c12; font-weight: bold; }
        
        .submenu { background: #0f172a; padding-left: 0; }
        .submenu a { padding: 12px 16px 12px 45px !important; font-size: 13.5px !important; color: #94a3b8 !important; }
        .submenu a:hover { color: white !important; }
        .submenu a.active-sub { color: #f39c12 !important; font-weight: bold; }
        
        .icon { margin-right: 12px; font-size: 18px; vertical-align: text-bottom; width: 20px; text-align: center; display: inline-block; }

        .content-wrapper { flex: 1; padding: 30px 40px; background: #f8fafc; }
        .content { background: white; min-height: 600px; padding: 25px 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.04); }
        
        .page-title { color: #1e293b; font-weight: bold; font-size: 24px; margin: 0 0 5px; }
        .description { font-size: 14px; color: #64748b; margin-top: 0; margin-bottom: 25px; }
        hr { border: none; border-top: 1px solid #e2e8f0; margin-bottom: 25px; }

        .toolbar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; background: #f8fafc; padding: 15px; border-radius: 6px; border: 1px solid #e2e8f0; }
        .toolbar-left select, .toolbar-right input { padding: 8px 12px; border: 1px solid #cbd5e1; border-radius: 4px; font-size: 14px; outline: none; transition: border-color 0.3s; }
        .toolbar-right input:focus { border-color: #1597e5; }
        
        table { width: 100%; border-collapse: collapse; }
        th, td { border-bottom: 1px solid #e2e8f0; padding: 15px 12px; vertical-align: middle; }
        th { text-align: left; background: #f1f5f9; color: #475569; font-weight: bold; font-size: 14px; text-transform: uppercase; letter-spacing: 0.5px; }
        tr:hover { background-color: #f8fafc; }

        .stt-column { width: 60px; text-align: center; }
        .image-column { width: 150px; text-align: center; }
        .action-column { width: 180px; text-align: center; }

        .category-img { width: 90px; height: 90px; object-fit: cover; border-radius: 6px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .no-image { width: 90px; height: 90px; background: #f1f5f9; border-radius: 6px; display: flex; align-items: center; justify-content: center; color: #94a3b8; font-size: 12px; margin: 0 auto; border: 1px dashed #cbd5e1; }
        .category-name { font-weight: 500; color: #334155; font-size: 16px; }

        .action-btn { display: inline-block; padding: 6px 12px; border-radius: 4px; text-decoration: none; font-size: 13px; font-weight: bold; color: white; transition: background 0.2s; margin: 0 3px; }
        .btn-edit { background: #f39c12; }
        .btn-edit:hover { background: #d68910; }
        .btn-delete { background: #e74c3c; }
        .btn-delete:hover { background: #c0392b; }
        
        .add-btn { display: inline-block; margin-top: 25px; background: #1597e5; color: white; text-decoration: none; padding: 12px 20px; border-radius: 4px; font-weight: bold; transition: background 0.3s; box-shadow: 0 4px 6px rgba(21, 151, 229, 0.2); }
        .add-btn:hover { background: #0c82c9; transform: translateY(-1px); }

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
                <a href="${pageContext.request.contextPath}/admin/category/add">
                    <span class="icon">＋</span> Thêm danh mục
                </a>
                <a href="${pageContext.request.contextPath}/admin/category/list" class="active-sub">
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
            <h1 class="page-title">Danh sách Danh mục</h1>
            <p class="description">Quản lý và cập nhật thông tin các danh mục hệ thống.</p>
            <hr>

            <div class="toolbar">
                <div class="toolbar-left">
                    <label style="color: #64748b; font-size: 14px; margin-right: 5px;">Hiển thị:</label>
                    <select id="pageSize">
                        <option value="10">10 dòng</option>
                        <option value="25">25 dòng</option>
                        <option value="50">50 dòng</option>
                    </select>
                </div>

                <div class="toolbar-right">
                    <input type="text" id="searchInput" onkeyup="searchCategory()" placeholder="🔍 Nhập tên cần tìm...">
                </div>
            </div>

            <table id="categoryTable">
                <thead>
                    <tr>
                        <th class="stt-column">STT</th>
                        <th class="image-column">Hình ảnh</th>
                        <th>Tên danh mục</th>
                        <th class="action-column">Hành động</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${cateList}" var="cate" varStatus="STT">
                        <tr>
                            <td class="stt-column">${STT.index + 1}</td>

                            <td class="image-column">
                                <c:choose>
                                    <c:when test="${not empty cate.icon}">
                                        <c:url value="/image" var="imgUrl">
                                            <c:param name="fname" value="${cate.icon}"/>
                                        </c:url>
                                        <img src="${imgUrl}" class="category-img" alt="${cate.name}">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="no-image">No Image</div>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td class="category-name">${cate.name}</td>

                            <td class="action-column">
                                <a class="action-btn btn-edit" href="<c:url value='/admin/category/edit?id=${cate.id}'/>">Sửa</a>
                                <a class="action-btn btn-delete" href="<c:url value='/admin/category/delete?id=${cate.id}'/>" onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục [${cate.name}] không?')">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <a class="add-btn" href="${pageContext.request.contextPath}/admin/category/add">
                ＋ Thêm danh mục mới
            </a>
        </div>
    </div>
</div>

<script>
    function searchCategory() {
        const keyword = document.getElementById("searchInput").value.toLowerCase();
        const table = document.getElementById("categoryTable");
        const rows = table.getElementsByTagName("tbody")[0].getElementsByTagName("tr");

        for (let i = 0; i < rows.length; i++) {
            const nameCell = rows[i].querySelector(".category-name");
            if (nameCell) {
                const categoryName = nameCell.textContent.toLowerCase();
                if (categoryName.includes(keyword)) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            }
        }
    }
</script>

</body>
</html>