package com.sp.app.mypage;

import org.springframework.web.multipart.MultipartFile;

public class Mypage {
	String pwd;
	String email;
	String addr1;
	String addr2;
	String zip;
	String tel;
	String empNo;
	
	
	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	private String thumbnail;
	
	private MultipartFile imageFilenameFile;

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public MultipartFile getImageFilenameFile() {
		return imageFilenameFile;
	}

	public void setImageFilenameFile(MultipartFile imageFilenameFile) {
		this.imageFilenameFile = imageFilenameFile;
	}

	
	
	
	
}
