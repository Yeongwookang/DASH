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

	@Override
	public Punching readDayOff(String empNo) {
		Punching dto =null;
		try {
			 dto = dao.selectOne("punching.readDayoff", empNo);
		} catch (Exception e) {
			logger.warn("오류가 발생했습니다: {}, 파라미터: {}", e.getMessage(), empNo);
		}
		return dto;
	}

	@Override
	public void insertDayoff(Punching pun) throws Exception {
		try {
			dao.updateData("punching.insertDayoff", pun);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public void updateDayoff(Punching pun) throws Exception {
		try {
			dao.updateData("punching.updateDayoff", pun);
		} catch (Exception e) {
			throw e;
		}
		
	}
	
	@Override
	public void updateWorkDays(String empNo) throws Exception {
		try {
			dao.updateData("punching.updateWorkDays", empNo);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public void deleteDayoff(String empNo) throws Exception {
		try {
			dao.deleteData("punching.deleteDayoff", empNo);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public List<Punching> listPunchclock(Map<String, Object> map) {
		
		List<Punching> clockList = null;
		
		try {
			clockList = dao.selectList("punching.listPunchclock", map);
		} catch (Exception e) {
			logger.warn("{} 가 발생했습니다.", e.getMessage());
		}
		
		
		return clockList;
	}

	@Override
	public void insertSday(Punching dto) throws Exception {
		try {
			dao.insertData("punching.insertsDay", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateSday(Punching dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSday(int gainNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Punching> sDay(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
