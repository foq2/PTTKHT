package dao584;
import java.sql.*;
import model584.*;

public class ThanhVienDAO584 extends DAO584 {
	public ThanhVienDAO584() {
		super();
	}
	public boolean kiemTraDangNhap(ThanhVien584 tv) {
		boolean kq = false;
		if(tv.getUsername().contains("true") || 
			tv.getUsername().contains("=") ||
			tv.getPassword().contains("true") ||
			tv.getPassword().contains("=")) return false;
		String sql = "{call kiemtraDN(?,?)}";
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setString(1, tv.getUsername());
			cs.setString(2, tv.getPassword());
			ResultSet rs = cs.executeQuery();
			if(rs.next()) {
				tv.setId(rs.getInt("id"));
				tv.setVaiTro(rs.getString("vaitro"));
				tv.setHo(rs.getString("ho"));
				tv.setTen(rs.getString("ten"));
				kq = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			kq = false;
		}
		return kq;
	}
}
