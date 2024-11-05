package dao584;
import model584.*;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.*;

public class MonAnDAO584 extends DAO584 {
	
	public MonAnDAO584() {
		super();
	}
	public ArrayList<MonAn584> getMonAnTheoTuKhoa(String tuKhoa) {
		ArrayList<MonAn584> kq = null;
		String sql = "{call MonAnTheoTuKhoa(?)}";
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setString(1, tuKhoa);
			ResultSet rs = cs.executeQuery();
			while(rs.next()) {
				if(kq==null) kq = new ArrayList<>();
				MonAn584 ma = new MonAn584();
				ma.setId(rs.getInt("id"));
				ma.setName(rs.getString("ten"));
				ma.setPrice(rs.getFloat("gia"));
				kq.add(ma);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			kq=null;
		}
		return kq;
	}
	public MonAn584 getTTMonAn(int id) {
		MonAn584 ma = new MonAn584();
		String sql = "{call TTMonAn(?)}";
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			while(rs.next()) {
				ma.setId(id);
				ma.setName(rs.getString("ten"));
				ma.setPrice(rs.getFloat("gia"));
				ma.setMota(rs.getString("mota"));
			}
		}catch(Exception e) {
			e.printStackTrace();
			ma=null;
		}
		return ma;
	}
}
