package com.sp.app.develop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("develop.developController")
@RequestMapping("/develop/*")
public class developController {
	@RequestMapping(value = "main")
	public String main() {
		return ".develop.main";
	}
}
