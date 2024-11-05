<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model584.*, dao584.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giao diện hóa đơn</title>
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
	KhachHang584 kh = (KhachHang584)session.getAttribute("khachHangDangChon");
	int id = Integer.parseInt(request.getParameter("id"));
	HoaDon584 hd = (new HoaDonDAO584()).getDonHang(id);
	DonHang584 dh = hd.getDonHang();
%>
<h2>Hóa đơn của khách hàng</h2>
<h3>Khách hàng: <i><%=(kh.getHo()+" "+kh.getTen()) %></i>,	 ngày <%=hd.getNgay() %></h3>
<h3>Mã hóa đơn: <%=id %></h3>
<table>
	<tr>
		<th>TT</th>
		<th>Món ăn</th>
		<th>Số lượng</th>
		<th>Giá</th>
		<th>Thành tiền</th>
	</tr>
<%for(int i=0;i<dh.getMonAn().size();i++){ %>
	<tr>
		<td><%=i+1 %></td>
		<td><%=dh.getMonAn().get(i).getMonAn().getName() %></td>
		<td><%=dh.getMonAn().get(i).getMonAn().getPrice() %></td>
		<td><%=dh.getMonAn().get(i).getSoLuong() %></td>
		<td><%=dh.getMonAn().get(i).getTongTien() %></td>
	</tr>
<%} %>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td>Tổng tiền</td>
		<td><%=hd.getTongTien() %></td>
	</tr>
</table>
<button type="button" name="back" onClick="history.back()" >Quay Lại</button>
</body>
</html>