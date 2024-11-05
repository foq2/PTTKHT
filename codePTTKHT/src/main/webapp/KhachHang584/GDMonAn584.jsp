<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao584.*, model584.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin Món Ăn</title>
</head>
<body>
<%	ThanhVien584 tv = (ThanhVien584)session.getAttribute("khachHang");
	if(tv == null){
		response.sendRedirect("../ThanhVien584/gdDangNhap584.jsp?err=timeout");
	}
	int maId = Integer.parseInt(request.getParameter("id"));
	MonAn584 ma = (new MonAnDAO584()).getTTMonAn(maId);
%>
<%if(ma!=null){ %>
<h2><%=(ma.getName()) %></h2>
<p>Mã món ăn: <%=(ma.getId()) %></p>
<p>Giá: <%=(ma.getPrice()) %></p>
<p>Mô tả: <%=(ma.getMota()) %></p>
<%} %>
<button type="button" name="back" onClick="history.back()" >Quay Lại</button>
</body>
</html>