package com.sp.app.kickmanage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
