package com.sp.app.chargestation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("charge.chargeStationController")
@RequestMapping("/chargestation/*")
public class ChargeStationController {
	@Autowired
	private ChargeStationService service;
	
	  @RequestMapping(value = "main")
	   public String main() throws Exception {
	      
	      return ".stationmanage.main2";
	   }
	
	
	  @RequestMapping(value = "regions")
	   @ResponseBody
	   public Map<String, Object> regions() throws Exception {
		   
		   List<ChargeStation> list = null;
		   
		   list = service.listChargeStation();
		   
		   Map<String, Object> model =  new HashMap<String, Object>();
		   
		   model.put("list", list);
		   
		   return model;
	   }
	  
	  
	  
}
