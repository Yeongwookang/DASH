package com.sp.app.insa;

import java.util.Map;

public interface InsaService {
	public void insertInsa(Insa dto) throws Exception;
	public void updateInsa(Insa dto) throws Exception;
	
	public Insa readInsa (long empNo);
	
	public void deleteInsa(Map<String, Object> map) throws Exception;
	
	
	
	
	
}
