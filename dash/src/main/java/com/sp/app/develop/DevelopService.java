package com.sp.app.develop;

import java.util.List;
import java.util.Map;

import com.sp.app.approval.Approval;
import com.sp.app.employee.Employee;



public interface DevelopService {

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
	
	public void approve(Map<String, Object> map) throws Exception;
	public void approveUpdate(Map<String, Object> map) throws Exception;
	
}
