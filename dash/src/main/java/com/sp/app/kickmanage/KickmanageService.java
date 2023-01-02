package com.sp.app.kickmanage;

import java.util.List;
import java.util.Map;





public interface KickmanageService {
	public List<Kickmanage> listkickboard ();
	public List<Kickmanage> repairOrReturn();
	
	
	public List<Map<String, Object>> damagedkickboard ();
	public List<Map<String, Object>> repairingkickboard();
	public List<Map<String, Object>> repaircomkickboard();
	
	
	
	
	public void updatedamagekickBoard(Map<String, Object> map) throws Exception;
	public void updaterepairkickBoard(Map<String, Object> map) throws Exception;
	public void updaterepaircomkickBoard(Map<String, Object> map) throws Exception;
	
	public void insertdamage(Map<String, Object> map) throws Exception;
	public void insertrepair(Map<String, Object> map) throws Exception;
	public void insertrepaircom(Map<String, Object> map) throws Exception;

}


