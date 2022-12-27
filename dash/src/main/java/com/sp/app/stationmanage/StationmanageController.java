package com.sp.app.stationmanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("station.stationmanageController")
@RequestMapping("/stationmanage/*")
public class StationmanageController {
	@Autowired
	private StationmanageService service;
	

	   
	
	
	   @RequestMapping(value = "main")
	   public String main() throws Exception {
	      
	     
	      
	      return ".stationmanage.main";
	   }
	   
	   
	   
	   @RequestMapping(value = "regions")
	   @ResponseBody
	   public Map<String, Object> regions() throws Exception {
		   
		   List<Stationmanage> list = null;
		   
		   list = service.listStation();
		   
		   Map<String, Object> model =  new HashMap<String, Object>();
		   
		   model.put("list", list);
		   
		   return model;
	   }
	   
	   
	   
	
}
