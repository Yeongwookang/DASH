package com.sp.app.kickmanage;

import java.util.List;





public interface KickmanageService {
	public List<Kickmanage> listkickboard ();
	public List<Kickmanage> repairOrReturn();
	public void insertrepair(Kickmanage dto) throws Exception;
}
