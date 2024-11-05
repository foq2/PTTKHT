<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao584.*, model584.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tim Mon An</title>
<style>
	table{
		border-collapse: collapse;
		width: 50%;
		border: 1px solid;
		margin: 10px 0px;
	}
	th, td {
         border: 1px solid black; 
         padding: 8px; 
         text-align: left; 
     }
     th {
         background-color: #f2f2f2; 
     }
     form {
     	margin: 10px 0px;
     }
</style>
</head>
<body>
<%	ThanhVien584 tv = (ThanhVien584)session.getAttribute("khachHang");
	if(tv == null){
		response.sendRedirect("../ThanhVien584/gdDangNhap584.jsp?err=timeout");
	}
	boolean getTuKhoa = false;
	String tuKhoa = "";
	ArrayList<MonAn584> MonAnTheoTuKhoa = null;
	if(request.getParameter("tuKhoa")!=null){
		tuKhoa = request.getParameter("tuKhoa");
		getTuKhoa = true;
		MonAnTheoTuKhoa = (new MonAnDAO584()).getMonAnTheoTuKhoa(tuKhoa.toLowerCase());
	}
%>
<h2>Tìm Món Ăn</h2>
	<form method="post" action="">
		<label>Tên Món Ăn: <input type="text" name="tuKhoa" id="tuKhoa"
		 value="<%= tuKhoa %>"/></label>
		<input type="submit" value="Tìm"/>
	</form>
<%if(getTuKhoa){ %>	
<p>Món ăn có chứa từ khóa:<b> <%=tuKhoa %></b></p>
<table>
	<tr>
		<th>TT</th>
		<th>ID</th>
		<th>Tên</th>
		<th>Giá</th>
		<th>Xem</th>
	</tr>
<%for(int i=0;i<MonAnTheoTuKhoa.size();i++){ %>
	<tr>
		<td><%=(i+1) %></td>
		<td><%=MonAnTheoTuKhoa.get(i).getId() %></td>
		<td><%=MonAnTheoTuKhoa.get(i).getName() %></td>
		<td><%=MonAnTheoTuKhoa.get(i).getPrice() %></td>
		<td><a href="GDMonAn584.jsp?id=<%=MonAnTheoTuKhoa.get(i).getId() %>">
		Chọn</a></td>
	</tr>
<%} %>
</table>
<%} %>
<button type="button" name="back" onClick="history.back()" >Quay Lại</button>
</body>
</html>