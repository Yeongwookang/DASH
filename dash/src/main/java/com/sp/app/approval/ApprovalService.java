package com.sp.app.approval;

import java.util.List;
import java.util.Map;

public interface ApprovalService {
	public void insertApproval(Approval dto) throws Exception;
	public void updateApproval(Approval dto) throws Exception;
	public void deleteApproval(long signNum) throws Exception;
	
	public Approval readApproval(long signNum);
	public int dataCount(Map<String, Object> map);
	public List<Approval> ListApproval(Map<String, Object> map);
	
	
	
	
}
