package com.sp.app;

import java.util.List;

public interface AnalysisService {
	public long totalSales();
	public int newCustomerCount();
	public int repairCount();
	public int rentalCount();
	public int damageCount();
	public List<Analysis> usageRankList();
}
