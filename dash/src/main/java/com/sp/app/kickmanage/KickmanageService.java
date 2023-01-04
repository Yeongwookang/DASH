package com.sp.app.kickmanage;

import java.util.List;
import java.util.Map;





public interface KickmanageService {
	public List<Kickmanage> listkickboard (Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	
	public List<Map<String, Object>> damagedkickboard ();
	public List<Map<String, Object>> repairingkickboard();
	public List<Map<String, Object>> repaircomkickboard();
	
	
	
	
	public void updatedamagekickBoard(Map<String, Object> map) throws Exception;//파손
	public void insertdamage(Map<String, Object> map) throws Exception; //파손
	public void deletedamage(Map<String, Object> map) throws Exception; //파손
	

	public void updatedamagekickBoardwait(Map<String, Object> map) throws Exception; //대기
	public void insertrepairwait(Map<String, Object> map) throws Exception;//대기
	
	
	public void updaterepairing(Map<String, Object> map) throws Exception; //입고

	
	
	public void updaterepaircomkickBoard(Map<String, Object> map) throws Exception;//완료
	public void updaterepaircom(Map<String, Object> map) throws Exception; //완료
	
	
	
}


