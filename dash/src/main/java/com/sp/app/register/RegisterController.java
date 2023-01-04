package com.sp.app.register;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;





@Controller("register.registerController")
@RequestMapping("/register/*")
public class RegisterController {

	
	@Autowired
	private RegisterService service;
	
	@RequestMapping(value = "main")
	public String main() {
		return ".register.main";
	}
	
	
	@PostMapping("write")
	public String writeSubmit(Register dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";

		try {
			service.insertstation(dto, path);
		} catch (Exception e) {
		}

		return "redirect:/stationmanage/main";
	}
	
	@PostMapping("chwrite")
	public String chwriteSubmit(Register dto) throws Exception {
	

		try {
			
			service.insertchargestation(dto);
		} catch (Exception e) {
		}

		return "redirect:/stationmanage/main";
	}
	
	@PostMapping("kwrite")
	public String kwriteSubmit(Register dto) throws Exception {
	

		try {
			
			service.insertkickboard(dto);
		} catch (Exception e) {
		}

		return "redirect:/kickmanage/main";
	}
	
}
