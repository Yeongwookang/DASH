package com.sp.app.analysis;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("analysis.AnalysisController")
@RequestMapping("/analysis/*")
public class AnalysisController {
	
	@Autowired
	private AnalysisService service;
	
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
	public String station() throws Exception {
			
		return ".analysis.station";
	}
}
