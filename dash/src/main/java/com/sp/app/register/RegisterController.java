package com.sp.app.register;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("register.registerController")
@RequestMapping("/register/*")
public class RegisterController {

	@RequestMapping(value = "main")
	public String main() {
		return ".register.main";
	}
	
}
