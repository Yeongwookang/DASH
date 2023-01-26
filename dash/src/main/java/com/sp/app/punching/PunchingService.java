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
   public void insertGainDayoff(Punching pun) throws Exception;
   public void updateDayoff(Punching pun)throws Exception;
   public void deleteDayoff(String empNo)throws Exception;
   public void updateWorkDays(String empNo) throws Exception;
   
   public List<Punching> listPunchclock(Map<String, Object> map);
   public int punchClockDataCount(Map<String, Object> map);
   
   public void insertGainVacation(Punching dto)throws Exception;
   public void insertVacation(Punching dto)throws Exception;
   public Punching readVacation(String empNo);
   public void updateVacation(Punching dto) throws Exception;
   public List<Punching> listGainVacation(Map<String, Object> map);
   public int dataCountGainVacation(Map<String, Object> map);
   public Punching readVacation(Map<String, Object> map);
   public int countUsedVacation(Map<String, Object> map);
   public List<Punching> userHistoryVacation(Map<String, Object> map);
   
}