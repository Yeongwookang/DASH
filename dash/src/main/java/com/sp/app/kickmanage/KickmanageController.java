package com.sp.app.kickmanage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kick.KickmanageController")
@RequestMapping("/kickmanage/*")
public class KickmanageController {

	@RequestMapping(value = "main")
	public String main() {
		return ".kickmanage.main";
	}
	
}
