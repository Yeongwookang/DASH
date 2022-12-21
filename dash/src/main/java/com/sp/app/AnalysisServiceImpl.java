package com.sp.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("analysis.analysisService")
public class AnalysisServiceImpl implements AnalysisService {
	@Autowired
	private CommonDAO dao;

	@Override
	public long totalSales() {
		long result = 0;
		
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

}
