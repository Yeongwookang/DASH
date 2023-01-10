package com.sp.app.employee;

import java.util.Map;

public interface EmployeeService {
	public Employee loginEmployee(String empNo);
	
	public void insertEmployee(Employee dto) throws Exception;
	
	public void updateLastLogin(String empNo) throws Exception;
	public void updateEmployee(Employee dto) throws Exception;
	
	public Employee readEmployee(String empNo);
	
	public void deleteEmployee(Map<String, Object> map) throws Exception;
	
	public void generatePwd(Employee dto) throws Exception;
	
	public Employee readMain(String empNo) throws Exception;
	
	// 패스워드 실패 횟수 제한
	public boolean isPasswordCheck(String empNo, String pwd);
	public void updatePwd(Employee dto) throws Exception;
	public int checkFailureCount(String empNo);
	public void updateFailureCount(String empNo) throws Exception;
	public void updateFailureCountReset(String empNo) throws Exception;
	public void updateEmployeeEnabled(Map<String, Object> map) throws Exception;
	public void insertEmployeeState(Employee dto) throws Exception;
}
