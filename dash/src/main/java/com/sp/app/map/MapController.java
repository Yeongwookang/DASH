package com.sp.app.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("map.mapController")
@RequestMapping("/map/*")
public class MapController {
	
	@RequestMapping(value = "main")
	public String main() {
	
		return ".map.filter";
	}
	
	
	
}
