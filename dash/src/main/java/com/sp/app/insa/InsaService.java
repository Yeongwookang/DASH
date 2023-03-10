package com.sp.app.insa;

import java.util.List;
import java.util.Map;


public interface InsaService {
	public void insertInsa(Insa dto, String pathname) throws Exception;
	
	public void updateAuthority(Map<String, Object> map) throws Exception;
	public void updateInsa(Insa dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);

	public List<Insa> list(Map<String, Object> map);
	public Insa readInsa(String empNo);
	
	public List<Insa> listFile(String empNo);
	
	public List<Insa> list2(Map<String, Object> map);
	
	public boolean isPasswordCheck(String empNo, String pwd)throws Exception;
	
	public void updateEmployeeEnabled(Map<String, Object> map) throws Exception;
	public void insertEmployeeState(Insa dto) throws Exception;
	public List<Insa> listEmployeeState(String empNo);
	public Insa readEmployeeState(String empNo);
	public int authorityDataCount(Map<String, Object> map);
	public List<Insa> listAuthority(Map<String, Object> map);
	public Insa readAuthority(String empNo);
	public void updateFailureCountReset(String empNo) throws Exception;
	
}
