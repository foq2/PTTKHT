<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model584.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giao diện chính quản lý</title>
<style>
	button{
		margin: 10px 0px;
	}
</style>
</head>
<body>
<%	
	ThanhVien584 tv = (ThanhVien584)session.getAttribute("quanLy");
	if(tv == null){
		response.sendRedirect("../ThanhVien584/gdDangNhap584.jsp?err=timeout");
	}
	%>
	<h2>Trang chủ quản lý</h2>
	<a href="GDChonTK584.jsp"><button>Xem báo cáo</button></a>
	<br/>
	<a href="../ThanhVien584/gdDangNhap584.jsp"><button>Đăng xuất</button></a>
</body>
</html>