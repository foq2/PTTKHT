<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model584.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giao diện chọn thống kê</title>
<style>
	form{
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
	boolean ok = false;
	if(session.getAttribute("loaiTK")!=null &&((String)session.getAttribute("loaiTK")).equals("TKKHtheoDT")){
		ok=true;
	}
	String start = (String)session.getAttribute("start");
	String end = (String)session.getAttribute("end");
%>
<h2>Chọn loại thống kê</h2>
<form method="post" action="GDTKKHDoanhThu584.jsp" name="chonTK">
	<select id="loaiTK" name="loaiTK">
		<option value=""></option>
		<option value="TKKHtheoDT" <%if(ok){ %>selected<%} %>>Thống kê khách hàng theo doanh thu</option>
	</select>
	<p>Ngày bắt đầu</p><input type="date" id="start" name="start" value="<%=start %>" required/>
	<p>Ngày kết thúc</p><input type="date" id="end" name="end" value="<%=end %>" required/>
	<input type="submit" value="Xem"/>
</form>
<button type="button" name="back" onClick="history.back()" >Quay Lại</button>
</body>
</html>
