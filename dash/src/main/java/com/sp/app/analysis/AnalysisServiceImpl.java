package com.sp.app.analysis;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;
import com.sp.app.stationmanage.Stationmanage;

@Service("analysis.analysisService")
public class AnalysisServiceImpl implements AnalysisService { 
	@Autowired
	private CommonDAO dao;

	@Override
	public String totalSales() {
		String result = "";
		
		try {
			result = dao.selectOne("analysis.totalSales");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int newCustomerCount() {
		int result = 0;
		
		try {
			result = dao.selectOne("analysis.newCustomerCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int repairCount() {
		int result = 0;
		
		try {
			result = dao.selectOne("analysis.repairCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int rentalCount() {
		int result = 0;
		
		try {
			result = dao.selectOne("analysis.rentalCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int damageCount() {
		int result = 0;
		
		try {
			result = dao.selectOne("analysis.damageCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Analysis> usageRankList() {
		List<Analysis> list = null;
		
		try {
			list = dao.selectList("analysis.usageRankList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Analysis> salesRankList() {
		List<Analysis> list = null;
		
		try {
			list = dao.selectList("analysis.salesRankList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Analysis lastDayUsageCount() {
		Analysis dto = null;
		
		try {
			dto = dao.selectOne("analysis.lastDayUsageCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public List<Map<String, Object>> yearTotalMoney(String year) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("analysis.yearTotalMoney", year);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Map<String, Object>> monthTotalMoney(String month) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("analysis.monthTotalMoney", month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Map<String, Object>> dayTotalMoney() {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("analysis.dayTotalMoney");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public String lastDay() {
		String lastDay = "";
		
		try {
			lastDay = dao.selectOne("analysis.lastDay");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lastDay;
	}

	@Override
	public List<UserData> userAge() {
		List<UserData> list = null;
		
		try {
			list = dao.selectList("analysis.userAge");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<UserData> userGender() {
		List<UserData> list = null;
		
		try {
			list = dao.selectList("analysis.userGender");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public UserData userUseTime() {
		UserData dto = null;
		
		try {
			dto = dao.selectOne("analysis.userUseTime");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Stationmanage> station() {
		List<Stationmanage> list = null;
		
		try {
			list = dao.selectList("analysis.station");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<StationData> stationAge(int stNum) {
		List<StationData> list = null;
		
		try {
			list = dao.selectList("analysis.stationAge", stNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<StationData> stationGender(int stNum) {
		List<StationData> list = null;
		
		try {
			list = dao.selectList("analysis.stationGender", stNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public StationData stationUseTime(int stNum) {
		StationData dto = null;
		
		try {
			dto = dao.selectOne("analysis.stationUseTime", stNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Map<String, Object>> stationTotalMoney(int stNum) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("analysis.stationTotalMoney", stNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	

}
