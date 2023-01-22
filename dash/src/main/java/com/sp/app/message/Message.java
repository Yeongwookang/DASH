package com.sp.app.message;

import java.util.List;

public class Message {
	private long num;
	private String content;
	private String senderEmpNo;
	private String senderName;
	private String receiverEmpNo;
	private String receiverName;
	private String sendDay; 
	private String identifyDay;
	private String sendDelete;
	private String receiveDelete;
	
	private List<String> receivers;
	private String empNo;
	private String name;
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSenderEmpNo() {
		return senderEmpNo;
	}
	public void setSenderEmpNo(String senderEmpNo) {
		this.senderEmpNo = senderEmpNo;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getReceiverEmpNo() {
		return receiverEmpNo;
	}
	public void setReceiverEmpNo(String receiverEmpNo) {
		this.receiverEmpNo = receiverEmpNo;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getSendDay() {
		return sendDay;
	}
	public void setSendDay(String sendDay) {
		this.sendDay = sendDay;
	}
	public String getIdentifyDay() {
		return identifyDay;
	}
	public void setIdentifyDay(String identifyDay) {
		this.identifyDay = identifyDay;
	}
	public String getSendDelete() {
		return sendDelete;
	}
	public void setSendDelete(String sendDelete) {
		this.sendDelete = sendDelete;
	}
	public String getReceiveDelete() {
		return receiveDelete;
	}
	public void setReceiveDelete(String receiveDelete) {
		this.receiveDelete = receiveDelete;
	}
	public List<String> getReceivers() {
		return receivers;
	}
	public void setReceivers(List<String> receivers) {
		this.receivers = receivers;
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
	
	
}
