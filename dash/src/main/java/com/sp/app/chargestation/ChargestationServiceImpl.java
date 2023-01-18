package com.sp.app.chargestation;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("charge.chargestation")
public class ChargestationServiceImpl implements  ChargeStationService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<ChargeStation> listChargeStation() {
		 List<ChargeStation> list = null;
		
		 try {
				list = dao.selectList("chargestation.chargeStationManage");
			} catch (Exception e) {
				logger.warn("{} ", e.getMessage());
			}
		
		return list;
	}

}
