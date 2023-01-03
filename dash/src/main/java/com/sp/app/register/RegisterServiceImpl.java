package com.sp.app.register;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("register.registerService")
public class RegisterServiceImpl implements RegisterService {
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertstation(Register dto) throws Exception {
		try {
			dao.insertData("register.stationregister", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertchargestation(Register dto) throws Exception {
		try {
			dao.insertData("register.chrgestationregister", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertkickboard(Register dto) throws Exception {
		try {
			dao.insertData("register.kickboardregister", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
}
