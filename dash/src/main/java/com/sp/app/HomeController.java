package com.sp.app;

import java.util.Calendar;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DATE);
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		
		String korDayOfWeek = "";
		switch(dayOfWeek) {
			case 1:
				korDayOfWeek = "일";
				break;
			case 2:
				korDayOfWeek = "월";
				break;
			case 3:
				korDayOfWeek = "화";
				break;
			case 4:
				korDayOfWeek = "수";
				break;
			case 5:
				korDayOfWeek = "목";
				break;
			case 6:
				korDayOfWeek = "금";
				break;
			case 7:
				korDayOfWeek = "토";
				break;
		}
		
		String msg = year + "." + month + "." + day + "(" + korDayOfWeek + ")";
		String s = "즐거운" + korDayOfWeek + "요일입니다.";
		
		model.addAttribute("msg", msg);
		model.addAttribute("dayOfWeek", s);
		
		return ".mainLayout";
	}
	
}
