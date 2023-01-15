package com.sp.app.develop;

import java.util.List;
import java.util.Map;

import com.sp.app.approval.Approval;
import com.sp.app.employee.Employee;



public interface DevelopService {

	public Develop readApproval(long signNum);
	public List<Develop> approvalList(Map<String, Object> map);
	
	public List<Develop> fileList(long signNum);
	public Develop readFile(long fileNum);
	public int dataCount(Map<String, Object> map);
	
	public void approve(Map<String, Object> map) throws Exception;
	public void approveUpdate(Map<String, Object> map) throws Exception;
	
}
