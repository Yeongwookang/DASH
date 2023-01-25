package com.sp.app.punching;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.employee.SessionInfo;
;

@Controller("punching.punchingController")
@RequestMapping(value = "/punching/*")
public class PunchingController {
		private Logger logger = LoggerFactory.getLogger(this.getClass());
		@Autowired
		private PunchingService service;
		
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
				if(service.readDayOff(info.getEmpNo())==null) {
					service.insertDayoff(pun);
				} 
				service.punchOff(pun);
				service.updateWorkDays(info.getEmpNo());
				
			} catch (Exception e) {
				logger.warn("{}오류가 발생했습니다. empNo: {}", e.getMessage(), pun.getEmpNo());
			}
			
			
			
			return "redirect:/";
		}
		
		@RequestMapping(value = "listPunchclock")
		@ResponseBody
		public String list(Model model, @RequestParam(defaultValue = "other") String condition, 
				@RequestParam(defaultValue = "") String startDate, @RequestParam(defaultValue = "") String endDate, 
				HttpServletRequest req ) {
			
			HttpSession session = req.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("employee");
			if(info == null) {
				return "redirect:/employee/login";
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("empNo", info.getEmpNo());
			map.put("condition", condition);
			map.put("startDate", startDate);
			map.put("endDate", endDate);
				
			List<Punching> clockList = service.listPunchclock(map);
			
			model.addAttribute("clockList", clockList);
			model.addAttribute("condition", condition);
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
			
			return ".mainLayout";
		}
	
		@RequestMapping(value = "listSday")
		public String listSday(Model model) throws Exception{
			return "punching/sday";
		}
}

