package com.sp.app.insa;

import java.util.List;
import java.util.Map;

import com.sp.app.employee.Employee;


public interface InsaService {
	public void insertInsa(Insa dto) throws Exception;
	public void updateInsa(Insa dto) throws Exception;
	public void deleteInsa(Map<String, Object> map) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Employee> listEmployee(Map<String, Object> map);
	
	public Employee readEmployee(long empNo);
	public Employee preReadEmployeet(Map<String, Object> map);
	public Employee nextReadEmployee(Map<String, Object> map);
	
	public List<Employee> listProductFile(long empNo);
	
	public List<Employee> listCategory();
	
	
	
	
}
