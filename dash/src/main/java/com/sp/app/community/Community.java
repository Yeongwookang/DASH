package com.sp.app.community;

public class Community {
	private long num;
	private String empNo;
	private String name;
	private String subject;
	private String content;
	private String reg_date;
	private int hitCount;
	
	private int replyCount;
	private int bbsLikeCount;
	private int bbsDisLikeCount;
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getBbsLikeCount() {
		return bbsLikeCount;
	}
	public void setBbsLikeCount(int bbsLikeCount) {
		this.bbsLikeCount = bbsLikeCount;
	}
	public int getBbsDisLikeCount() {
		return bbsDisLikeCount;
	}
	public void setBbsDisLikeCount(int bbsDisLikeCount) {
		this.bbsDisLikeCount = bbsDisLikeCount;
	}
	
}
