package com.sp.app.register;

import java.util.List;

public interface RegisterService {
	
	public void insertstation(Register dto, String pathname) throws Exception; 
	public void insertchargestation(Register dto, String pathname) throws Exception;
	public void insertkickboard(Register dto, String pathname) throws Exception; 
	

	public List<Register> stationlist() throws Exception;
	public Register stationInfo(int stNum) throws Exception;
	
}


