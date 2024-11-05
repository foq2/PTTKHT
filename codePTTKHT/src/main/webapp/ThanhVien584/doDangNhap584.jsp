<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao584.*, model584.*"%>
<%
	String username = (String)request.getParameter("username");
	String password = (String)request.getParameter("password");
	ThanhVien584 tv = new ThanhVien584();
	tv.setUsername(username);
	tv.setPassword(password);
	
	ThanhVienDAO584 dao = new ThanhVienDAO584();
	boolean kq = dao.kiemTraDangNhap(tv);

	if(kq && tv.getVaiTro().equalsIgnoreCase("khachHang")){
		session.setAttribute("khachHang", tv);
		response.sendRedirect("../KhachHang584/GDChinhKH584.jsp");
		
	}else if(kq && tv.getVaiTro().equalsIgnoreCase("quanLy")){
		session.setAttribute("quanLy", tv);
		response.sendRedirect("../NVQuanLy584/GDChinhQL584.jsp");
		
	}else{
		response.sendRedirect("gdDangNhap584.jsp?err=fail");
	}
%>