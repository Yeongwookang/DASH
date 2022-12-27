package com.sp.app.stationmanage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("station.stationManage")
public class StationmanageServiceimpl implements StationmanageService{

	
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Stationmanage> listStation() {
		List<Stationmanage> list = null;
		
		
		try {
			list = dao.selectList("stationmanage.listStation");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

}
