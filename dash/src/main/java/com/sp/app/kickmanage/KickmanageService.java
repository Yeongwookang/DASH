package com.sp.app.kickmanage;

import java.util.List;
import java.util.Map;





public interface KickmanageService {
	public List<Kickmanage> listkickboard ();
	public List<Kickmanage> repairOrReturn();
	
	
	public List<Map<String, Object>> damagedkickboard ();
	public List<Map<String, Object>> repairingkickboard();
	public List<Map<String, Object>> repaircomkickboard();
	
	public void insertrepair(Kickmanage dto) throws Exception;
}
