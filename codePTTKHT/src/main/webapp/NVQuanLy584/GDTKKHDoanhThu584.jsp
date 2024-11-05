<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model584.*, dao584.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giao diện thống kê khách hàng theo doanh thu</title>
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
</style>
</head>
<body>
<%	
	ThanhVien584 tv = (ThanhVien584)session.getAttribute("quanLy");
	if(tv == null){
		response.sendRedirect("../ThanhVien584/gdDangNhap584.jsp?err=timeout");
	}
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	session.setAttribute("start", start);
	session.setAttribute("end", end);
	session.setAttribute("loaiTK", "TKKHtheoDT");
	ArrayList<TKKhachHang584> TKKHtheoDT = (new TKKHDAO584()).getTKKHtheoDT(start, end);
%>
<h2>Thống kê khách hàng theo doanh thu</h2>
<h3>Từ ngày <%=start %> đến <%=end %></h3>
<table>
	<tr>
		<th>TT</th>
		<th>Id khách hàng</th>
		<th>Tên khách hàng</th>
		<th>Doanh Thu</th>
		<th>Xem</th>
	</tr>
<%for(int i=0;i<TKKHtheoDT.size()-1;i++){ %>
	<tr>
		<td><%=(i+1) %></td>
		<td><%=(TKKHtheoDT.get(i).getKHid()) %></td>
		<td><%=(TKKHtheoDT.get(i).getTen()) %></td>
		<td><%=(TKKHtheoDT.get(i).getDoanhThu()) %></td>
		<td><a href="GDCacLanKHGoi584.jsp?id=<%=TKKHtheoDT.get(i).getKHid()%>">
		Chọn</a></td>
	</tr>
<%} %>
	<tr>
		<td></td>
		<td></td>
		<td><%=(TKKHtheoDT.getLast().getTen()) %></td>
		<td><%=(TKKHtheoDT.getLast().getDoanhThu()) %></td>
		<td></td>
	</tr>
</table>
<button type="button" name="back" onClick="history.back()" >Quay Lại</button>
</body>
</html>