package com.sp.app.stationmanage;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("station.stationManage")
public class StationmanageServiceimpl implements StationmanageService{
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Stationmanage> listStation() {
		List<Stationmanage> list = null;
		
		
		try {
			list = dao.selectList("stationmanage.listStation");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			e.printStackTrace();
		}
		
		
		return list;
	}

}
