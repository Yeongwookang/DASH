package com.sp.app.punching;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.common.MyUtil;
import com.sp.app.employee.SessionInfo;

@Controller("punching.punchingController")
@RequestMapping(value = "/punching/*")
public class PunchingController {
		@Autowired
		private PunchingService service;
		
		@Autowired
		private MyUtil myUtil;
		
		@GetMapping("punchOn")
		public String punchOn(HttpSession session) {
			SessionInfo info = (SessionInfo)session.getAttribute("employee");
			
			Punching pun =  new Punching();
			
			pun.setEmpNo(info.getEmpNo());
			
			try {
				service.punchOn(pun);
			} catch (Exception e) {
			}
			
			
			
			return "redirect:/";
		}
		
		@GetMapping("punchOff")
		public String punchOff(HttpSession session) {
			SessionInfo info = (SessionInfo)session.getAttribute("employee");
			
			Punching pun =  new Punching();
			
			pun.setEmpNo(info.getEmpNo());
			
			try {
				service.punchOff(pun);
			} catch (Exception e) {
			}
			
			
			
			return "redirect:/";
		}
		
}

