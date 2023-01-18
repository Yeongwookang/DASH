package com.sp.app.punching;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;
import com.sp.app.employee.Employee;

@Service("punching.punchingService")
public class PunchingServiceImpl implements PunchingService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Employee> empList(Map<String, Object> map) {
		
		List<Employee> empList = null;
		
		try {
			empList = dao.selectList("approval.empList", map);
			
		} catch (Exception e) {
			logger.warn("{} 가 발생했습니다.", e.getMessage());
		}
		return empList;
	}

	@Override
	public void punchOn(Punching pun) throws Exception{
		try {
			dao.deleteData("punching.deleteClockOn", pun);
			dao.deleteData("punching.deleteClockOff", pun);
			dao.insertData("punching.insertClockOn", pun);
			
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public void punchOff(Punching pun) throws Exception {
		try {
			dao.deleteData("punching.deleteClockOff", pun);
			dao.insertData("punching.insertClockOff", pun);
			
		} catch (Exception e) {
			throw e;
		}
		
		
	}

	@Override
	public Punching todayPunch(Map<String,Object> map) {
		Punching punching = null;
		try {
			punching = new Punching();
			 if(dao.selectOne("punching.clockOffTime", map) == null) {
				 punching.setPunchOffTime("-");
			} else{
				Punching pun = dao.selectOne("punching.clockOffTime", map);
				punching.setPunchOffTime(pun.getPunchOffTime());
			};
			
			 if(dao.selectOne("punching.clockOnTime", map) == null) {
				 punching.setPunchOnTime("-");
			} else{
				Punching pun = dao.selectOne("punching.clockOnTime", map);
				punching.setPunchOnTime(pun.getPunchOnTime());
			};
			
		} catch (Exception e) {
			logger.warn("{} 가 발생했습니다.", e.getMessage());
		}
		
		return punching;
	}
	
}
