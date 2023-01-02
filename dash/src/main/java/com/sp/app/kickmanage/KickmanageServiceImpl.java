package com.sp.app.kickmanage;

import java.util.List;
import java.util.Map;

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
	public List<Map<String, Object>> damagedkickboard() {
		List<Map<String, Object>>  list = null;
		
		try {
			dao.selectList("kickboardmanage.damagedkickboard");
		} catch (Exception e) {
		  e.printStackTrace();
		}
		return list;
	}



	@Override
	public List<Map<String, Object>> repairingkickboard() {
	List<Map<String, Object>>  list = null;
		
		try {
			dao.selectList("kickboardmanage.repairedkickboard");
		} catch (Exception e) {
		  e.printStackTrace();
		}
		return list;
	}



	@Override
	public List<Map<String, Object>> repaircomkickboard() {
	List<Map<String, Object>>  list = null;
		
		try {
			dao.selectList("kickboardmanage.repaircomkickboard");
		} catch (Exception e) {
		  e.printStackTrace();
		}
		return list;
	}



	@Override
	public void updatedamagekickBoard(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("kickboardmanage.updatedamage", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}



	@Override
	public void updaterepairkickBoard(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("kickboardmanage.updateRepair", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}



	@Override
	public void updaterepaircomkickBoard(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("kickboardmanage.updateRepairCom", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}



	@Override
	public void insertdamage(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("kickboardmanage.insertdamage", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertrepair(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("kickboardmanage.insertRepair", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
	}


	@Override
	public void insertrepaircom(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("kickboardmanage.insertRepairComs", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
	}

}
