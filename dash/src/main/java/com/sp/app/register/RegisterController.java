package com.sp.app.register;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;






@Controller("register.registerController")
@RequestMapping("/register/*")
public class RegisterController {

	
	@Autowired
	private RegisterService service;
	
	@RequestMapping(value = "main")
	public String main() {
		return ".register.main";
	}
	
	@RequestMapping(value = "main2")
	public String main2() {
		return ".register.main2";
	}
	
	@RequestMapping(value = "main3")
	public String main3(Model model) throws Exception {
		List<Register> list = service.stationlist();
		model.addAttribute("list", list);
		
		return ".register.main3";
	}
	
	
	
	
	

	@PostMapping("write")
	public String writeSubmit(Register dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";

		try {
			service.insertstation(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/stationmanage/main";
	}
	
	@PostMapping("chwrite")
	public String chwriteSubmit(Register dto,HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";

		try {
			
			service.insertchargestation(dto, path);
		} catch (Exception e) {
		}

		return "redirect:/stationmanage/main";
	}
	
	@PostMapping("kwrite")
	public String kwriteSubmit(Register dto, HttpSession session, @RequestParam int stNum) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";

		try {
			Register vo = service.stationInfo(stNum);
			
			dto.setX_pos(vo.getX_pos());
			dto.setY_pos(vo.getY_pos());
			
			service.insertkickboard(dto, path);
		} catch (Exception e) {
		}

		return "redirect:/kickmanage/main";
	}
	
}
