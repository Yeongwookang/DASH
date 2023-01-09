package com.sp.app.develop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("develop.developController")
@RequestMapping("/develop/*")
public class DevelopController {
	
	@Autowired
	private DevelopService service;

	
	@RequestMapping(value = "main")
	public String main(String depName, Model model) {
		
		List<Develop> list = service.list();
		
		
		model.addAttribute("list", list);
		
		return ".develop.main";
	}
	
	
	
	
}
