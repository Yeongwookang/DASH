package com.sp.app.punching;

import java.util.List;
import java.util.Map;

import com.sp.app.employee.Employee;

public interface PunchingService {
	public List<Employee> empList(Map<String, Object> map);
	public void punchOn(Punching pun) throws Exception;
	public void punchOff(Punching pun) throws Exception;
	public Punching todayPunch(Map<String,Object>map);
	public Punching readDayOff(String empNo);
	public void insertDayoff(Punching pun)throws Exception;
	public void updateDayoff(Punching pun)throws Exception;
	public void deleteDayoff(String empNo)throws Exception;
	public void updateWorkDays(String empNo) throws Exception;
	
	public List<Punching> listPunchclock(Map<String, Object> map);
	
	
	public void insertSday(Punching dto)throws Exception;
	public void updateSday(Punching dto)throws Exception;
	public void deleteSday(int gainNo)throws Exception;
	
	public List<Punching> sDay(Map<String, Object> map);
	
}
