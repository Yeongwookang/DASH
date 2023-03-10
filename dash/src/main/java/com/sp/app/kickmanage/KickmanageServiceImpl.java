package com.sp.app.kickmanage;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;


@Service("kickboard.kickManage")
public class KickmanageServiceImpl implements KickmanageService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public List<Kickmanage> listkickboard(Map<String, Object> map) {
		List<Kickmanage> list = null;
		
		try {
			list = dao.selectList("kickboardmanage.listKickboard", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		
		return list;
	}



	
	


	@Override
	public List<Map<String, Object>> damagedkickboard() {
		List<Map<String, Object>>  list = null;
		
		try {
			dao.selectList("kickboardmanage.damagedkickboard");
		} catch (Exception e) {
		  logger.warn("{} ", e.getMessage());
		}
		return list;
	}



	@Override
	public List<Map<String, Object>> repairingkickboard() {
	List<Map<String, Object>>  list = null;
		
		try {
			dao.selectList("kickboardmanage.repairedkickboard");
		} catch (Exception e) {
		  logger.warn("{} ", e.getMessage());
		}
		return list;
	}



	@Override
	public List<Map<String, Object>> repaircomkickboard() {
	List<Map<String, Object>>  list = null;
		
		try {
			dao.selectList("kickboardmanage.repaircomkickboard");
		} catch (Exception e) {
		  logger.warn("{} ", e.getMessage());
		}
		return list;
	}







	@Override
	public void updatedamagekickBoard(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("kickboardmanage.updatedamage", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}







	@Override
	public void insertdamage(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("kickboardmanage.updatedamagerepair", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}







	@Override
	public void updatedamagekickBoardwait(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("kickboardmanage.repairwait", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}







	@Override
	public void insertrepairwait(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("kickboardmanage.insertrepairwait", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}







	@Override
	public void updaterepairing(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("kickboardmanage.updateRepairing", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}







	@Override
	public void updaterepaircomkickBoard(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("kickboardmanage.updatekickCom", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}







	@Override
	public void updaterepaircom(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("kickboardmanage.updateRepairCom", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}







	@Override
	public void deletedamage(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("kickboardmanage.deletedamage");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}







	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("kickboardmanage.dataCount", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}

		return result;
		
	}


   
	
	
	
	

}
