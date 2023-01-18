package com.sp.app.punching;

public class Punching {
	private long clockNo;
	private String empNo;
	private String clock_time;
	private String punch_kind;
	private String punchOnTime;
	private String punchOffTime;
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
	
	
}
