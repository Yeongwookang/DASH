package com.sp.app;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("analysis.analysisService")
public class AnalysisServiceImpl implements AnalysisService {
	@Autowired
	private CommonDAO dao;

	@Override
	public long totalSales(Map<String, Object> map) {
		long result = 0;
		
		try {
			result = dao.selectOne("analysis.totalSales", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int newCustomerCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("analysis.newCustomerCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int repairCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("analysis.repairCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int rentalCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("analysis.rentalCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
