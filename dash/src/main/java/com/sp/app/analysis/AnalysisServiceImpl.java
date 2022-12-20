package com.sp.app.analysis;

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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int newCustomerCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int repairCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int rentalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
