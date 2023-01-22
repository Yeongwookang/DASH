package com.sp.app.approval;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Approval {
	private long signNum;
	private String title;
	private String content;
	
	private String empNo;
	private String reg_date;
	private int state;
	private int max_state;
	
	private long tlNum;
	private String tlName;
	private long recordNum;
	private int tlState;
	private int tlMax_state;
	private String tlEmpNo;
	
	private String posName;
	private String depName;
	private String rankName;
	private String teamName;
	private String name;
	
	private long fileNum;
	private String saveFilename;
	private String originalFilename;
	private long fileSize;
	private List<MultipartFile> addFiles;
	
	private String ref1;
	private String ref2;
	private String ref3;
	private String ref1name;
	private String ref2name;
	private String ref3name;
	private int refcnt;
	
	private int formNum;
	private String formName;
	private String timeLine;
	
	
	
	public long getTlNum() {
		return tlNum;
	}
	public void setTlNum(long tlNum) {
		this.tlNum = tlNum;
	}
	public String getTlName() {
		return tlName;
	}
	public void setTlName(String tlName) {
		this.tlName = tlName;
	}
	public long getRecordNum() {
		return recordNum;
	}
	public void setRecordNum(long recordNum) {
		this.recordNum = recordNum;
	}
	public String getTimeLine() {
		return timeLine;
	}
	public void setTimeLine(String timeLine) {
		this.timeLine = timeLine;
	}
	public long getSignNum() {
		return signNum;
	}
	public void setSignNum(long signNum) {
		this.signNum = signNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getFormNum() {
		return formNum;
	}
	public void setFormNum(int formNum) {
		this.formNum = formNum;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public String getRef1() {
		return ref1;
	}
	public void setRef1(String ref1) {
		this.ref1 = ref1;
	}
	public String getRef2() {
		return ref2;
	}
	public void setRef2(String ref2) {
		this.ref2 = ref2;
	}
	public String getRef3() {
		return ref3;
	}
	public void setRef3(String ref3) {
		this.ref3 = ref3;
	}
	public String getPosName() {
		return posName;
	}
	public void setPosName(String posName) {
		this.posName = posName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getRef1name() {
		return ref1name;
	}
	public void setRef1name(String ref1name) {
		this.ref1name = ref1name;
	}
	public String getRef2name() {
		return ref2name;
	}
	public void setRef2name(String ref2name) {
		this.ref2name = ref2name;
	}
	public String getRef3name() {
		return ref3name;
	}
	public void setRef3name(String ref3name) {
		this.ref3name = ref3name;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getMax_state() {
		return max_state;
	}
	public void setMax_state(int max_state) {
		this.max_state = max_state;
	}
	public long getFileNum() {
		return fileNum;
	}
	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}

	public List<MultipartFile> getAddFiles() {
		return addFiles;
	}
	public void setAddFiles(List<MultipartFile> addFiles) {
		this.addFiles = addFiles;
	}
	public int getRefcnt() {
		return refcnt;
	}
	public void setRefcnt(int refcnt) {
		this.refcnt = refcnt;
	}

	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getTlState() {
		return tlState;
	}
	public void setTlState(int tlState) {
		this.tlState = tlState;
	}
	public int getTlMax_state() {
		return tlMax_state;
	}
	public void setTlMax_state(int tlMax_state) {
		this.tlMax_state = tlMax_state;
	}
	public String getTlEmpNo() {
		return tlEmpNo;
	}
	public void setTlEmpNo(String tlEmpNo) {
		this.tlEmpNo = tlEmpNo;
	}
	
	
	
}
