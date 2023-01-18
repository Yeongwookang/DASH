package com.sp.app.punching;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.common.MyUtil;
import com.sp.app.employee.SessionInfo;

@Controller("punching.punchingController")
@RequestMapping(value = "/punching/*")
public class PunchingController {
		private Logger logger = LoggerFactory.getLogger(this.getClass());
		@Autowired
		private PunchingService service;
		
		@Autowired
		private MyUtil myUtil;
		
		@GetMapping("punchOn")
		public String punchOn(HttpServletRequest req ) {
			HttpSession session = req.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("employee");
			if(info == null) {
				return "redirect:/employee/login";
			}
			Punching pun =  new Punching();
			pun.setEmpNo(info.getEmpNo());
			
			try {
				service.punchOn(pun);
				
			} catch (Exception e) {
				logger.warn("{}가 발생했습니다. empNo: {}", e.getMessage(), pun.getEmpNo());
			}
			
			return "redirect:/";
			
			
		}
		
		@GetMapping("punchOff")
		public String punchOff(HttpServletRequest req ) {
			HttpSession session = req.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("employee");
			if(info == null) {
				return "redirect:/employee/login";
			}
			Punching pun =  new Punching();
			
			pun.setEmpNo(info.getEmpNo());
			
			try {
				service.punchOff(pun);
			} catch (Exception e) {
				logger.warn("{}가 발생했습니다. empNo: {}",e.getMessage(),pun.getEmpNo());
			}
			
			
			
			return "redirect:/";
		}
		
}

