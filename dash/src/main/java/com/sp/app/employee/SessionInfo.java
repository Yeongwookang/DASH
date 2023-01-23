package com.sp.app.employee;

// 세션에 저장할 정보(아이디, 이름, 권한 등)
public class SessionInfo {
	private String empNo;
	private String name;
	private int posNo;
	private String posName;
	private int depNo;
	private String depName;
	private int rankNo;
	private String rankName;
	private int teamNo;
	private String teamName;
	private String imageFilename;
	
	private int scdcount;
	private int msgcount;
	
	private String adminEmpNo;
	
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPosNo() {
		return posNo;
	}
	public void setPosNo(int posNo) {
		this.posNo = posNo;
	}
	public String getPosName() {
		return posName;
	}
	public void setPosName(String posName) {
		this.posName = posName;
	}
	public int getDepNo() {
		return depNo;
	}
	public void setDepNo(int depNo) {
		this.depNo = depNo;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	public int getRankNo() {
		return rankNo;
	}
	public void setRankNo(int rankNo) {
		this.rankNo = rankNo;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	public int getTeamNo() {
		return teamNo;
	}
	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	public int getScdcount() {
		return scdcount;
	}
	public void setScdcount(int scdcount) {
		this.scdcount = scdcount;
	}
	public int getMsgcount() {
		return msgcount;
	}
	public void setMsgcount(int msgcount) {
		this.msgcount = msgcount;
	}
	public String getAdminEmpNo() {
		return adminEmpNo;
	}
	public void setAdminEmpNo(String adminEmpNo) {
		this.adminEmpNo = adminEmpNo;
	}
	
	
	
}
