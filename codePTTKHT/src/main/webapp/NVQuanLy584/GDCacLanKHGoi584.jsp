<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model584.*, dao584.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giao diện các lần gọi</title>
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
	String start = (String)session.getAttribute("start");
	String end = (String)session.getAttribute("end");
	int id = Integer.parseInt(request.getParameter("id"));
	ArrayList<HoaDon584> hd = (new HoaDonDAO584()).getHDcuaKH(id, start, end);
	KhachHang584 kh = (new HoaDonDAO584()).getKh(id);
	session.setAttribute("khachHangDangChon", kh);
%>
<h2>Các lần khách hàng gọi</h2>
<h3>Khách hàng: <i><%=(kh.getHo()+" "+kh.getTen()) %></i>, từ <%=start %> đến <%=end %></h3>
<table>
	<tr>
		<th>TT</th>
		<th>Mã hóa đơn</th>
		<th>Thời gian</th>
		<th>Tổng tiền</th>
		<th>Xem</th>
	</tr>
<%for(int i=0;i<hd.size()-1;i++){ %>
	<tr>
		<td><%=(i+1) %></td>
		<td><%=(hd.get(i).getId())%></td>
		<td><%=(hd.get(i).getNgay()) %></td>
		<td><%=(hd.get(i).getTongTien()) %></td>
		<td><a href="GDHoaDon584.jsp?id=<%=(hd.get(i).getId())%>">Chọn</a></td>
	</tr>
<%} %>
	<tr>
		<td></td>
		<td></td>
		<td><%=(hd.getLast().getNgay()) %></td>
		<td><%=(hd.getLast().getTongTien()) %></td>
		<td></td>
	</tr>
</table>
<button type="button" name="back" onClick="history.back()" >Quay Lại</button>
</body>
</html>