package com.sp.app.register;

import org.springframework.web.multipart.MultipartFile;

public class Register {
	private String name;
	private String x_pos;
	private String y_pos;
	private int maxQty;
	private String zoonName;
	private String addr;
	
	private String sname;
	private int stNum;
	
	private int LEFTQTY;
	private String state;
	
	private String imageFilename;
	
	private MultipartFile imageFilenameFile;
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getX_pos() {
		return x_pos;
	}
	public void setX_pos(String x_pos) {
		this.x_pos = x_pos;
	}
	public String getY_pos() {
		return y_pos;
	}
	public void setY_pos(String y_pos) {
		this.y_pos = y_pos;
	}
	public int getMaxQty() {
		return maxQty;
	}
	public void setMaxQty(int maxQty) {
		this.maxQty = maxQty;
	}
	public String getZoonName() {
		return zoonName;
	}
	public void setZoonName(String zoonName) {
		this.zoonName = zoonName;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getLEFTQTY() {
		return LEFTQTY;
	}
	public void setLEFTQTY(int lEFTQTY) {
		LEFTQTY = lEFTQTY;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	public MultipartFile getImageFilenameFile() {
		return imageFilenameFile;
	}
	public void setImageFilenameFile(MultipartFile imageFilenameFile) {
		this.imageFilenameFile = imageFilenameFile;
	}
	public int getStNum() {
		return stNum;
	}
	public void setStNum(int stNum) {
		this.stNum = stNum;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	
	
	
}
