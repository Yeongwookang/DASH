package com.sp.app.analysis;

import java.util.List;
import java.util.Map;

public interface AnalysisService {
	public String totalSales();
	public int newCustomerCount(); 
	public int repairCount();
	public int rentalCount();
	public int damageCount();
	public List<Analysis> usageRankList();
	public List<Analysis> salesRankList();
	public Analysis lastDayUsageCount();
	
	public List<Map<String, Object>> yearTotalMoney(String year);
	public List<Map<String, Object>> monthTotalMoney(String month);
	public List<Map<String, Object>> dayTotalMoney();
	public String lastDay();
	
	public List<UserData> userAge();
	public List<UserData> userGender();
	public UserData userUseTime();
	
}
