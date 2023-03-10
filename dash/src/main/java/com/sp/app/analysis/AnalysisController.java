package com.sp.app.analysis;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.stationmanage.Stationmanage;

@Controller("analysis.AnalysisController")
@RequestMapping("/analysis/*")
public class AnalysisController {
	@Autowired
	private AnalysisService service;
	
	@RequestMapping(value = "main")
	public String main(Model model) throws Exception {	
		List<Analysis> rankTopCount = service.rankTopCount();
		for(Analysis dto : rankTopCount) {
			String[] s = dto.getName().split("출");
			dto.setName(s[0]);
		}
		
		List<Analysis> rankTopPrice = service.rankTopPrice();
		for(Analysis dto : rankTopPrice) {
			String[] s = dto.getName().split("출"); 
			dto.setName(s[0]);
		}
		
		List<Analysis> rankTopDistance = service.rankTopDistance();
		for(Analysis dto : rankTopDistance) {
			String[] s = dto.getName().split("출");
			dto.setName(s[0]);
		}
		
		List<Analysis> rankTopUseTime = service.rankTopUseTime();
		
		model.addAttribute("rankTopCount", rankTopCount);
		model.addAttribute("rankTopPrice", rankTopPrice);
		model.addAttribute("rankTopDistance", rankTopDistance);
		model.addAttribute("rankTopUseTime", rankTopUseTime);
		
		return ".analysis.main"; 
	}
	
	@RequestMapping(value = "userAgeTime")
	@ResponseBody
	public Map<String, Object> userAgeTime() throws Exception {
	
		List<UserData> userAgeTime = service.userAgeTime();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("userAgeTime", userAgeTime);
		
		return model;
	}
	
	@RequestMapping(value = "sales")
	public String sales() throws Exception {
		
		return ".analysis.sales";
	}
	
	@RequestMapping(value = "monthTotalMoney")
	@ResponseBody
	public Map<String, Object> monthTotalMoney() throws Exception {
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		
		String month = String.format("%4d%02d", y, m);
		
		List<Map<String, Object>> months = service.monthTotalMoney(month);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("months", months);
		
		return model;
	}
	
	@RequestMapping(value = "yearTotalMoney")
	@ResponseBody
	public Map<String, Object> yearTotalMoney() throws Exception {
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);

		String year = String.format("%4d", y);
		
		List<Map<String, Object>> years = service.yearTotalMoney(year);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("years", years);
		
		return model;
	}
	
	@RequestMapping(value = "dayTotalMoney")
	@ResponseBody
	public Map<String, Object> dayTotalMoney() throws Exception {
		String d = service.lastDay();
		int lastDay = Integer.parseInt(d);
		
		List<Map<String, Object>> days = service.dayTotalMoney();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("lastDay", lastDay);
		model.put("days", days);
		
		return model;
	}
	
	@RequestMapping(value = "user")
	public String user() throws Exception {
			
		return ".analysis.user";
	}
	
	@RequestMapping(value = "userAge")
	@ResponseBody
	public Map<String, Object> userAge() throws Exception {
		List<UserData> age = service.userAge();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("age", age);
		
		return model;
	}
	
	@RequestMapping(value = "userGender")
	@ResponseBody
	public Map<String, Object> userGender() throws Exception {
		List<UserData> gender = service.userGender();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("gender", gender); 
		
		return model;
	}
	
	@RequestMapping(value = "userUseTime")
	@ResponseBody
	public Map<String, Object> userUseTime() throws Exception {
		UserData useTime = service.userUseTime();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("useTime", useTime);
		
		return model;
	}
	
	@RequestMapping(value = "station")
	public String station(Model model) throws Exception {	
		List<Stationmanage> list = service.station();
		
		model.addAttribute("list", list);
		
		return ".analysis.station";
	}
	
	@RequestMapping(value = "stationYearTotalMoney")
	@ResponseBody
	public Map<String, Object> stationYearTotalMoney(@RequestParam int stNum) throws Exception {
		List<Map<String, Object>> stationYearTotalMoney = service.stationYearTotalMoney(stNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("stationYearTotalMoney", stationYearTotalMoney);
		
		return model;
	}
	
	@RequestMapping(value = "stationMonthTotalMoney")
	@ResponseBody
	public Map<String, Object> stationMonthTotalMoney(@RequestParam int stNum) throws Exception {
		List<Map<String, Object>> stationMonthTotalMoney = service.stationMonthTotalMoney(stNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("stationMonthTotalMoney", stationMonthTotalMoney);
		
		return model;
	}
	
	@RequestMapping(value = "stationDayTotalMoney")
	@ResponseBody
	public Map<String, Object> stationDayTotalMoney(@RequestParam int stNum) throws Exception {
		List<Map<String, Object>> stationDayTotalMoney = service.stationDayTotalMoney(stNum);
		 
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("stationDayTotalMoney", stationDayTotalMoney);
		
		return model;
	}
	
	
	@RequestMapping(value = "stationAge")
	@ResponseBody
	public Map<String, Object> stationAge(@RequestParam int stNum) throws Exception {
		List<StationData> stationAge = service.stationAge(stNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("stationAge", stationAge);
		
		return model;
	}
	
	@RequestMapping(value = "stationGender")
	@ResponseBody
	public Map<String, Object> stationGender(@RequestParam int stNum) throws Exception {
		List<StationData> stationGender = service.stationGender(stNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("stationGender", stationGender);
		
		return model;
	}
	
	@RequestMapping(value = "stationUseTime")
	@ResponseBody
	public Map<String, Object> stationUseTime(@RequestParam int stNum) throws Exception {
		StationData stationUseTime = service.stationUseTime(stNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("stationUseTime", stationUseTime);
		
		return model;
	}
	

	 @RequestMapping("zoonSalesAnalysis")
	 @ResponseBody
	 public Map<String, Object> salesRankList() throws Exception {
	     Map<String, Object> model = new HashMap<String, Object>();

	     List<Analysis> salesRankList = service.salesRankList();

	     model.put("salesRankList", salesRankList);

	     return model;
	 }
	   
	 @RequestMapping("zoonUsageCountAnalysis")
	 @ResponseBody
	 public Map<String, Object> lastDayUsageCount() throws Exception {
	    Map<String, Object> model = new HashMap<String, Object>();

	    Analysis lastDayUsageCount = service.lastDayUsageCount();

	    model.put("lastDayUsageCount", lastDayUsageCount);

	    return model;
	 }
	
}
