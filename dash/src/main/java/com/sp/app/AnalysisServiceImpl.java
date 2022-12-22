package com.sp.app;

import java.util.List;

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

}
