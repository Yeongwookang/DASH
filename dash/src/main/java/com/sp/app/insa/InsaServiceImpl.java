package com.sp.app.insa;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("insa.insaService")
public class InsaServiceImpl implements InsaService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertInsa(Insa dto) throws Exception {
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@Override
	public void updateInsa(Insa dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Insa readInsa(long empNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteInsa(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
