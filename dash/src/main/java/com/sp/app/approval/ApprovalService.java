package com.sp.app.approval;

import java.util.List;
import java.util.Map;

import com.sp.app.employee.Employee;

public interface ApprovalService {
	public void insertApproval(Approval dto, String path) throws Exception;
	public void updateApproval(Approval dto, String path) throws Exception;
	public void deleteApproval(long signNum, String path) throws Exception;
	public void approve(Map<String, Object> map) throws Exception;
	public void approveUpdate(Map<String, Object> map) throws Exception;
	
	public List<Employee> empList(Map<String, Object> map);
	
	public Approval readApproval(long signNum);
	public List<String> refList(long signNum);
	public Approval readEmp(String empNo);
	
	public int dataCount(Map<String, Object> map);
	public int myApprovalCount(Map<String, Object> map);
	public List<Approval> approvalList(Map<String, Object> map);
	public List<Approval> myApprovalList(Map<String, Object> map);
	
	
	public List<Approval> fileList(long signNum);
	public Approval readFile(long fileNum);
	public void deleteFile(long fileNum, String path) throws Exception;
	
	public int dataCount_tl(Map<String, Object> map);
	public void insertTimeline(Map<String, Object> map) throws Exception;
	public void updateTimeline(Map<String, Object> map) throws Exception;
	public void updateTimelineAdmin(Map<String, Object> map) throws Exception;
	public void deleteTimeline(Map<String, Object> map) throws Exception;
	
	public Approval readTimelineRecord(long signNum);
	
	public int countTimeline(Map<String, Object> map);
	public Approval readTimeline(long tlNum);
	public List<Approval> listTimeline(Map<String,Object> map);
	public List<Approval> recordTimeline(Approval dto);
	
	
}
