package com.sp.app.analysis;

import java.util.Map;

public interface AnalysisService {
	public long totalSales(Map<String, Object> map);
	public int newCustomerCount(Map<String, Object> map);
	public int repairCount(Map<String, Object> map);
	public int rentalCount(Map<String, Object> map);
}
