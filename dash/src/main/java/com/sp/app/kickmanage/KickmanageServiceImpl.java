package com.sp.app.kickmanage;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;


@Service("kickboard.kickManage")
public class KickmanageServiceImpl implements KickmanageService {

	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public List<Kickmanage> listkickboard() {
		List<Kickmanage> list = null;
		
		try {
			list = dao.selectList("kickboardmanage.listKickboard");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}



	@Override
	public List<Kickmanage> repairOrReturn() {
		List<Kickmanage>  rlist = null;
		
		try {
			rlist = dao.selectList("kickboardmanage.repairOrReturn");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rlist;
	}
	
	
	@Override
	public void insertrepair(Kickmanage dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
