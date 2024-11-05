package dao584;
import model584.*;
import java.util.*;
import java.sql.*;
public class HoaDonDAO584 extends DAO584 {
	
	public HoaDonDAO584() {
		super();
	}
	public ArrayList<HoaDon584> getHDcuaKH(int id, String dayStart, String dayEnd) {
		ArrayList<HoaDon584> kq = null;
		String sql = "{call HDcuaKH(?,?,?)}";
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, id);
			cs.setString(2, dayStart);
			cs.setString(3,  dayEnd);
			ResultSet rs = cs.executeQuery();
			while(rs.next()) {
				if(kq==null) kq=new ArrayList<>();
				HoaDon584 hd = new HoaDon584();
				hd.setId(rs.getInt("id"));
				hd.setNgay(rs.getString("ngay"));
				hd.setTongTien(rs.getFloat("tongtien"));
				kq.add(hd);
			}
		}catch(Exception e) {
			e.printStackTrace();
			kq=null;
		}
		return kq;
	}
	public HoaDon584 getDonHang(int id) {
		HoaDon584 hd = new HoaDon584();
		hd.setId(id);
		String sql = "{call HD(?)}";
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			if(rs.next()) {
				hd.setNgay(rs.getString("ngay"));
				hd.setTongTien(rs.getFloat("tongTien"));
				int idDh = rs.getInt("tblDonHang584id");
				DonHang584 dh = new DonHang584();
				dh.setMonAn(getMonAnDonHang(idDh));
				hd.setDonHang(dh);
			}
		}catch(Exception e) {
			e.printStackTrace();
			hd = null;
		}
		return hd;
	}
	public KhachHang584 getKh(int id) {
		KhachHang584 kh = new KhachHang584();
		String sql = "{call KH(?)}";
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			if(rs.next()) {
				kh.setTen(rs.getString("ten"));
				kh.setHo(rs.getString("ho"));
			}
		}catch(Exception e) {
			e.printStackTrace();
			kh=null;
		}
		return kh;
	}
	public ArrayList<MonAnDonHang584> getMonAnDonHang(int id){
		ArrayList<MonAnDonHang584> madh = new ArrayList<>();
		String sql = "{call MonAnDonHang(?)}";
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			while(rs.next()) {
				MonAnDonHang584 ma = new MonAnDonHang584();
				ma.getMonAn().setName(rs.getString("ten"));
				ma.getMonAn().setPrice(rs.getFloat("gia"));
				ma.setSoLuong(rs.getInt("soLuong"));
				ma.setTongTien(rs.getFloat("tongTien"));
				madh.add(ma);
			}
		}catch(Exception e) {
			e.printStackTrace();
			madh = null;
		}
		return madh;
	}
}
