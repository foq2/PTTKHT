package dao584;
import java.sql.*;
import java.util.*;
import model584.*;
public class TKKHDAO584 extends DAO584 {
	
	public TKKHDAO584() {
		super();
	}
	public ArrayList<TKKhachHang584> getTKKHtheoDT(String dayStart, String dayEnd){
		ArrayList<TKKhachHang584> kq = null;
		String sql = "{call TKKHtheoDT(?,?)}";
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setString(1, dayStart);
			cs.setString(2, dayEnd);
			ResultSet rs = cs.executeQuery();
			while(rs.next()) {
				if(kq==null) kq=new ArrayList<>();
				TKKhachHang584 tk = new TKKhachHang584();
				tk.setKHid(rs.getInt("id"));
				tk.setTen(rs.getString("ten"));
				tk.setDoanhThu(rs.getFloat("doanhthu"));
				kq.add(tk);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			kq=null;
		}
		return kq;
	}
}
