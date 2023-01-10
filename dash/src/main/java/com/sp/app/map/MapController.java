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
	
	@RequestMapping(value = "main")
	public String main() throws Exception {
	
		return ".map.filter";
	}
	
	@RequestMapping(value = "subway")
    @ResponseBody
    public Map<String, Object> regions() throws Exception {
	   
	    List<Subway> list = subwayService.listSubway();
	    Map<String, Object> model =  new HashMap<String, Object>();
	   
	    model.put("list", list);
	   
	    return model;
    }
	
	
	
}
