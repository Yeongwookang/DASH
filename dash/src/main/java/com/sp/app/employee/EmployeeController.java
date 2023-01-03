package com.sp.app.employee;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("employee.employeeController")
@RequestMapping("/employee/*")
public class EmployeeController {
	
	@Autowired
	private EmployeeService service;
	
	@RequestMapping(value = "login")
	public String loginForm() {
		return "employee/login";
	}
	
	@RequestMapping(value = "noAuthorized")
	public String noAuthorized() {
		return ".employee.noAuthorized";
	}
	
	@RequestMapping(value = "expired")
	public String expired() {
		return ".employee.expired";
	}
	
	@GetMapping(value = "pwd")
	public String pwdForm(String dropout, Model model) {
		
		if(dropout == null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "dropout");
		}
		return ".employee.pwd";
	}
	
	@PostMapping(value = "pwd")
	public String pwdSubmit(@RequestParam String pwd, 
			@RequestParam String mode,
			final RedirectAttributes reAttr,
			HttpSession session,
			Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("employee");
		
		Employee dto = service.readEmployee(info.getEmpNo());
		if(dto == null) {
			session.invalidate();
			return "redirect:/";
		}
		
		boolean bPwd = service.isPasswordCheck(info.getEmpNo(), pwd);
		
		if(! bPwd) {
			if(mode.equals("update")) {
				model.addAttribute("mode", "update");
			} else {
				model.addAttribute("mode", "dropout");
			}
			model.addAttribute("message", "패스워드가 일치하지 않습니다.");
			return ".employee.pwd";
		}
		
		if(mode.equals("dropout")) {
			session.removeAttribute("employee");
			session.invalidate();
			
			StringBuilder sb = new StringBuilder();
			sb.append(dto.getName() + "님의 탈퇴 처리가 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동하시기 바랍니다.");
			
			reAttr.addFlashAttribute("title", "사원 탈퇴");
			reAttr.addFlashAttribute("message", sb.toString());
			
			return "redirect:/insa/complete";
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		return ".insa.main";
	}
	
	
	
	
	
	
}
