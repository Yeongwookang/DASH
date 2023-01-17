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

	
}
