package com.sp.app.insa;


import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.app.common.MyUtil;
import com.sp.app.employee.Employee;
import com.sp.app.employee.EmployeeService;



@Controller("insa.insaController")
@RequestMapping("/insa/*")
public class InsaController {
	@Autowired
	private EmployeeService service;
	
	@Autowired
	private InsaService insaService;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String mainForm(Model model) throws Exception {
		model.addAttribute("mode", "main");
		return ".insa.main";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String mainSubmit(Employee dto, 
			final RedirectAttributes reAttr,
			Model model) {
		
		try {
			service.insertEmployee(dto);

		}   catch (DuplicateKeyException e) {
			model.addAttribute("mode", "employee");
			model.addAttribute("message", "사원번호 중복으로 등록에 실패했습니다.");
			return ".insa.main";
		}
		
		catch (DataIntegrityViolationException e) {
			model.addAttribute("mode", "employee");
			model.addAttribute("message", "사원등록에 실패했습니다.");
			return ".insa.main";
		}
		
		catch (Exception e) {
			model.addAttribute("mode", "employee");
			model.addAttribute("message", "사원등록에 실패했습니다.");
			return ".insa.main";
		}
	
		StringBuilder sb = new StringBuilder();
		sb.append(dto.getName() + "님의 사원 등록이 정상적으로 처리되었습니다.<br>");

		reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("title", "사원 등록");

		return "redirect:/insa/main";
	}
	
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(Employee dto,
			final RedirectAttributes reAttr,
			Model model) {
	
		try {
			service.updateEmployee(dto);
		} catch (Exception e) {
		}
		

		return "redirect:/insa/main";

	}
	
	
	@RequestMapping(value = "empNoCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> empNoCheck(@RequestParam String empNo) throws Exception {

		String p = "true";
		Employee dto = service.readEmployee(empNo);
		if (dto != null) {
			p = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("passed", p);
		return model;
	}
	
	
	@RequestMapping(value = "pwd", method = RequestMethod.GET)
	public String pwdForm(String dropout, Model model) {

		if (dropout == null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "dropout");
		}

		return ".insa.pwd";
	}

	
}



