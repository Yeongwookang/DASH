package com.sp.app.insa;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("insa.insaController")
@RequestMapping("/insa/*")
public class insaController {
	@RequestMapping(value = "main")
	public String main() {
		return ".insa.main";
	}
}
