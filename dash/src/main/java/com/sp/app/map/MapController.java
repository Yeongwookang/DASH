package com.sp.app.map;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("map.mapController")
@RequestMapping("/map/*")
public class MapController {
	@Autowired
	private SubwayService subwayService;
	
	@Autowired
	private MeterService meterService;
	
	@Autowired
	private FilterService filterService;
	
	@RequestMapping(value = "main")
	public String main() throws Exception {
	
		return "map/filter";
	}
	
	@RequestMapping(value = "subway")
    @ResponseBody
    public Map<String, Object> subway() throws Exception {
	   
	    List<Subway> list = subwayService.listSubway();
	    Map<String, Object> model =  new HashMap<String, Object>();
	   
	    model.put("list", list);
	   
	    return model;
    }
	
	@RequestMapping(value = "meter")
    @ResponseBody
    public Map<String, Object> meter() throws Exception {
	   
	    List<Meter> list_100 = meterService.listMeter();
	    
	    List<Meter2> list_300 = meterService.listMeter2();	    
	    List<Meter3> list_500 = meterService.listMeter3();
	   
	    Map<String, Object> model =  new HashMap<String, Object>();
	    
	    model.put("list_100", list_100);
	    model.put("list_300", list_300);
	    model.put("list_500", list_500);
	   
	    return model;
    }
	
	@RequestMapping(value = "all_month")
    @ResponseBody
    public Map<String, Object> all_month() throws Exception {
	   
	    List<All_month> all_month = filterService.list_all_month();
	   
	    Map<String, Object> model =  new HashMap<String, Object>();
	    
	    model.put("all_month", all_month);
	   
	    return model;
    }
	
	@RequestMapping(value = "all_quarter")
    @ResponseBody
    public Map<String, Object> all_quarter() throws Exception {
	   
	    List<All_quarter> all_quarter = filterService.list_all_quarter();
	   
	    Map<String, Object> model =  new HashMap<String, Object>();
	    
	    model.put("all_quarter", all_quarter);
	   
	    return model;
    }
	
	@RequestMapping(value = "all_6months")
    @ResponseBody
    public Map<String, Object> all_6months() throws Exception {
	   
	    List<All_6months> all_6months = filterService.list_all_6months();
	   
	    Map<String, Object> model =  new HashMap<String, Object>();
	    
	    model.put("all_6months", all_6months);
	   
	    return model;
    }
	
	
	@RequestMapping(value = "people_month")
    @ResponseBody
    public Map<String, Object> people_month() throws Exception {
	   
	    List<People_month> people_month = filterService.list_people_month();
	   
	    Map<String, Object> model =  new HashMap<String, Object>();
	    
	    model.put("people_month", people_month);
	   
	    return model;
    }
	
	@RequestMapping(value = "people_quarter")
    @ResponseBody
    public Map<String, Object> people_quarter() throws Exception {
	   
	    List<People_quarter> people_quarter = filterService.list_people_quarter();
	   
	    Map<String, Object> model =  new HashMap<String, Object>();
	    
	    model.put("people_quarter", people_quarter);
	   
	    return model;
    }
	
	@RequestMapping(value = "people_6months")
    @ResponseBody
    public Map<String, Object> people_6months() throws Exception {
	   
	    List<People_6months> people_6months = filterService.list_people_6months();
	   
	    Map<String, Object> model =  new HashMap<String, Object>();
	    
	    model.put("people_6months", people_6months);
	   
	    return model;
    }
	
	@RequestMapping(value = "bikeCount_6months")
    @ResponseBody
    public Map<String, Object> bikeCount_6months() throws Exception {
	   
	    List<BikeCount_6months> bikeCount_6months = filterService.list_bikeCount_6months();
	   
	    Map<String, Object> model =  new HashMap<String, Object>();
	    
	    model.put("bikeCount_6months", bikeCount_6months);
	   
	    return model;
    }
	
	@RequestMapping(value = "bikeCount_quarter")
    @ResponseBody
    public Map<String, Object> bikeCount_quarter() throws Exception {
	   
	    List<BikeCount_quarter> bikeCount_quarter = filterService.list_bikeCount_quarter();
	   
	    Map<String, Object> model =  new HashMap<String, Object>();
	    
	    model.put("bikeCount_quarter", bikeCount_quarter);
	   
	    return model;
    }
	
	@RequestMapping(value = "bikeCount_month")
    @ResponseBody
    public Map<String, Object> bikeCount_month() throws Exception {
	   
	    List<BikeCount_month> bikeCount_month = filterService.list_bikeCount_month();
	   
	    Map<String, Object> model =  new HashMap<String, Object>();
	    
	    model.put("bikeCount_month", bikeCount_month);
	   
	    return model;
    }
	
	
}
