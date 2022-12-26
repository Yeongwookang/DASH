package com.sp.app.analysis;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.employee.Employee;
import com.sp.app.employee.EmployeeService;
import com.sp.app.employee.SessionInfo;

@Controller("analysis.AnalysisController")
@RequestMapping("/analysis/*")
public class AnalysisController {
	
	@Autowired
	private AnalysisService service;
	
	@Autowired
	private EmployeeService service2;
	
	@RequestMapping(value = "main")
	public String main(HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("employee");
		Employee dto = service2.readMain(info.getEmpNo());
		
		model.addAttribute("dto", dto);
		
		return ".analysis.main";
	}
}
