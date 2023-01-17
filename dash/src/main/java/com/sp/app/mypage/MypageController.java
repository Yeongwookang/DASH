package com.sp.app.mypage;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.employee.SessionInfo;






@Controller("mypage.mypageController")
@RequestMapping("/mypage/*")
public class MypageController {
	
	
	@Autowired
	private MypageService service;
	
	@GetMapping("list")
	@ResponseBody
	public Map<String, Object> list(HttpSession session) throws Exception {

		List<Mypage> list = null;
		Map<String, Object> model = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
	    map.put("empNo",info.getEmpNo());
	    
		try {

		
			list = service.listemployee(map);
			model.put("list", list);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	
	
	@PostMapping("write")
	public String writeSubmit(Mypage dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "mypage";

		try {
			service.updateMypage(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/";
	}
	
	
	
}
