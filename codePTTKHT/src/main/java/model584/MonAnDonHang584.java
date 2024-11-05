package model584;

public class MonAnDonHang584 {
	private int id;
	private int soLuong;
	private float tongTien;
	private MonAn584 monAn;
	public MonAnDonHang584() {
		monAn = new MonAn584();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public float getTongTien() {
		return tongTien;
	}
	public void setTongTien(float tongTien) {
		this.tongTien = tongTien;
	}
	public MonAn584 getMonAn() {
		return monAn;
	}
	public void setMonAn(MonAn584 monAn) {
		this.monAn = monAn;
	}
}
