package com.sp.app.chargestation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("charge.chargestation")
public class ChargestationServiceImpl implements  ChargeStationService {

	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<ChargeStation> listChargeStation() {
		 List<ChargeStation> list = null;
		
		 try {
				list = dao.selectList("chargestation.chargeStationManage");
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return list;
	}

}
