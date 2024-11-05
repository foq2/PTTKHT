package model584;
import java.util.*;

public class DonHang584 {
	private int id;
	private String ngay;
	private String mota;
	private	KhachHang584 kh;
	private ArrayList<MonAnDonHang584> monAn;
	
	public DonHang584() {
		monAn = new ArrayList<>();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNgay() {
		return ngay;
	}

	public void setNgay(String ngay) {
		this.ngay = ngay;
	}

	public String getMota() {
		return mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

	public KhachHang584 getKh() {
		return kh;
	}

	public void setKh(KhachHang584 kh) {
		this.kh = kh;
	}

	public ArrayList<MonAnDonHang584> getMonAn() {
		return monAn;
	}

	public void setMonAn(ArrayList<MonAnDonHang584> monAn) {
		this.monAn = monAn;
	}
	public void addMonAn(MonAnDonHang584 ma) {
		monAn.add(ma);
	}
}
