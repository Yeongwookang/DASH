package com.sp.app.map;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("map.mapController")
@RequestMapping("/map/*")
public class MapController {
	@Autowired
	private SubwayService subwayService;
	
	@RequestMapping(value = "main")
	public String main(
			HttpServletRequest req,
			Model model) throws Exception {
		
		long dataCount = subwayService.dataCount();
		// System.out.println(dataCount);
		
		List<Subway> list = subwayService.listSubway();
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
	
		return ".map.filter";
	}
	
	
	
}
