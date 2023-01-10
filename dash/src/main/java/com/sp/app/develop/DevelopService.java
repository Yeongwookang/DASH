package com.sp.app.develop;

import java.util.List;
import java.util.Map;



public interface DevelopService {

	public Develop readDevelop(long signNum);
	public List<Develop> list(long signNum);
	public Develop read(String empNo);
	
	public int dataCount(Map<String, Object> map);
	public int depApprovalCount(Map<String, Object> map);
	public List<Develop> approvalList(Map<String, Object> map);
	public List<Develop> depApprovalList(Map<String, Object> map);

	
	public List<Develop> fileList(long signNum);
	public Develop readFile(long fileNum);
}
