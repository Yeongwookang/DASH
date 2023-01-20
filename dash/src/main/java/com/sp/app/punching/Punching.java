package com.sp.app.punching;

public class Punching {
	private long clockNo;
	private String empNo;
	private String clock_time;
	private String punch_kind;
	private String punchOnTime;
	private String punchOffTime;
	private int totalQty;
	private int leftQty;
	private int reqDays;
	private int workDays;
	private int qty;
	private String date; 
	
	public long getClockNo() {
		return clockNo;
	}
	public void setClockNo(long clockNo) {
		this.clockNo = clockNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getClock_time() {
		return clock_time;
	}
	public void setClock_time(String clock_time) {
		this.clock_time = clock_time;
	}
	public String getPunch_kind() {
		return punch_kind;
	}
	public void setPunch_kind(String punch_kind) {
		this.punch_kind = punch_kind;
	}
	public String getPunchOnTime() {
		return punchOnTime;
	}
	public void setPunchOnTime(String punchOnTime) {
		this.punchOnTime = punchOnTime;
	}
	public String getPunchOffTime() {
		return punchOffTime;
	}
	public void setPunchOffTime(String punchOffTime) {
		this.punchOffTime = punchOffTime;
	}
	public int getTotalQty() {
		return totalQty;
	}
	public void setTotalQty(int totalQty) {
		this.totalQty = totalQty;
	}
	public int getLeftQty() {
		return leftQty;
	}
	public void setLeftQty(int leftQty) {
		this.leftQty = leftQty;
	}
	public int getReqDays() {
		return reqDays;
	}
	public void setReqDays(int reqDays) {
		this.reqDays = reqDays;
	}
	public int getWorkDays() {
		return workDays;
	}
	public void setWorkDays(int workDays) {
		this.workDays = workDays;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
