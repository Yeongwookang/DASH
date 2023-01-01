package com.sp.app.kickmanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller("kick.kickmanageController")
@RequestMapping("/kickmanage/*")
public class KickmanageController {

	
	@Autowired
	private KickmanageService sevice;
	
	@RequestMapping(value = "main")
	public String list(Model model) {
		
		List<Kickmanage> list =  null;
		List<Kickmanage> rlist = null;
		
		list = sevice.listkickboard();
		rlist = sevice.repairOrReturn(); 
		
		model.addAttribute("list", list);
		model.addAttribute("rlist", rlist);
		
		
		
		return ".kickmanage.main";
	}
	
	@RequestMapping(value = "filterkickboard")
	@ResponseBody
	public Map<String, Object> filterkickboard(@RequestParam String value) throws Exception {
		
	  List<Map<String, Object>> damage = null;
	  List<Map<String, Object>> repair = null;
	  List<Map<String, Object>> complete = null;
			  
					
		Map<String, Object> model = new HashMap<String, Object>();

		
		if (value == "damage") {
			damage = sevice.damagedkickboard();	
			model.put("damage", damage);
			
		} else if (value == "repair") {
			repair = sevice.repairingkickboard();
			model.put("repair", repair);
		} else if (value == "complete") {
			complete = sevice.repaircomkickboard();
			model.put("complete", complete);
		}
		
		return model;
	}
	
	
}
