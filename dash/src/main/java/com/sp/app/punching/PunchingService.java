package com.sp.app.punching;

import java.util.List;
import java.util.Map;

import com.sp.app.employee.Employee;

public interface PunchingService {
	public List<Employee> empList(Map<String, Object> map);
	public void punchOn(Punching pun) throws Exception;
	public void punchOff(Punching pun) throws Exception;
	public Punching todayPunch(Map<String,Object>map);
	
}
