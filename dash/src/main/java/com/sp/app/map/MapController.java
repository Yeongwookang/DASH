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
	   
	    List<M100_all_6months> M100_6_dash = meterService.M100_all_6months();
	    List<M100_all_month> M100_1_dash = meterService.M100_all_month();	    
	    List<M100_all_quarter> M100_3_dash = meterService.M100_all_quarter();
	    
	    List<M100_bike_6months> M100_6_bike = meterService.M100_bike_6months();
	    List<M100_bike_month> M100_1_bike = meterService.M100_bike_month();	    
	    List<M100_bike_quarter> M100_3_bike = meterService.M100_bike_quarter();
	    
	    List<M100_people_6months> M100_6_traffic = meterService.M100_people_6months();
	    List<M100_people_month> M100_1_traffic = meterService.M100_people_month();	    
	    List<M100_people_quarter> M100_3_traffic = meterService.M100_people_quarter();
	    


	    List<M300_all_6months> M300_6_dash = meterService.M300_all_6months();
	    List<M300_all_month> M300_1_dash = meterService.M300_all_month();	    
	    List<M300_all_quarter> M300_3_dash = meterService.M300_all_quarter();
	    
	    List<M300_bike_6months> M300_6_bike = meterService.M300_bike_6months();
	    List<M300_bike_month> M300_1_bike = meterService.M300_bike_month();	    
	    List<M300_bike_quarter> M300_3_bike = meterService.M300_bike_quarter();
	    
	    List<M300_people_6months> M300_6_traffic = meterService.M300_people_6months();
	    List<M300_people_month> M300_1_traffic = meterService.M300_people_month();	    
	    List<M300_people_quarter> M300_3_traffic = meterService.M300_people_quarter();
	    
	    
	    
	    List<M500_all_6months> M500_6_dash = meterService.M500_all_6months();
	    List<M500_all_month> M500_1_dash = meterService.M500_all_month();	    
	    List<M500_all_quarter> M500_3_dash = meterService.M500_all_quarter();
	    
	    List<M500_bike_6months> M500_6_bike = meterService.M500_bike_6months();
	    List<M500_bike_month> M500_1_bike = meterService.M500_bike_month();	    
	    List<M500_bike_quarter> M500_3_bike = meterService.M500_bike_quarter();
	    
	    List<M500_people_6months> M500_6_traffic = meterService.M500_people_6months();
	    List<M500_people_month> M500_1_traffic = meterService.M500_people_month();	    
	    List<M500_people_quarter> M500_3_traffic = meterService.M500_people_quarter();
	   
	    Map<String, Object> model =  new HashMap<String, Object>();
	    
	    model.put("100_6_dash", M100_6_dash);
	    model.put("100_1_dash", M100_1_dash);
	    model.put("100_3_dash", M100_3_dash);
	    
	    model.put("100_6_bike", M100_6_bike);
	    model.put("100_1_bike", M100_1_bike);
	    model.put("100_3_bike", M100_3_bike);
	    
	    model.put("100_6_traffic", M100_6_traffic);
	    model.put("100_1_traffic", M100_1_traffic);
	    model.put("100_3_traffic", M100_3_traffic);
	    
	    model.put("300_6_dash", M300_6_dash);
	    model.put("300_1_dash", M300_1_dash);
	    model.put("300_3_dash", M300_3_dash);
	    
	    model.put("300_6_bike", M300_6_bike);
	    model.put("300_1_bike", M300_1_bike);
	    model.put("300_3_bike", M300_3_bike);
	    
	    model.put("300_6_traffic", M300_6_traffic);
	    model.put("300_1_traffic", M300_1_traffic);
	    model.put("300_3_traffic", M300_3_traffic);
	    
	    model.put("500_6_dash", M500_6_dash);
	    model.put("500_1_dash", M500_1_dash);
	    model.put("500_3_dash", M500_3_dash);
	    
	    model.put("500_6_bike", M500_6_bike);
	    model.put("500_1_bike", M500_1_bike);
	    model.put("500_3_bike", M500_3_bike);
	    
	    model.put("500_6_traffic", M500_6_traffic);
	    model.put("500_1_traffic", M500_1_traffic);
	    model.put("500_3_traffic", M500_3_traffic);
	   
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
