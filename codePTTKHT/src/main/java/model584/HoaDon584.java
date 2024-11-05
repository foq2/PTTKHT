package model584;

public class HoaDon584 {
	private int id;
	private String ngay;
	private float tongTien;
	private String mota;
	private DonHang584 donHang;
	public HoaDon584() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public float getTongTien() {
		return tongTien;
	}
	public void setTongTien(float tongTien) {
		this.tongTien = tongTien;
	}
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
	public DonHang584 getDonHang() {
		return donHang;
	}
	public void setDonHang(DonHang584 donHang) {
		this.donHang = donHang;
	}
	public String getNgay() {
		return ngay;
	}
	public void setNgay(String ngay) {
		this.ngay = ngay;
	}
}
