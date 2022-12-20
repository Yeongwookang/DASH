package com.sp.app.stationmanage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("station.stationmanageController")
@RequestMapping("/stationmanage/*")
public class stationmanageController {

	
	@RequestMapping(value = "main")
	public String main() {
		return ".stationmanage.main";
	}
	
}
