package com.sp.app.insa;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.app.common.MyUtil;



@Controller("insa.insaController")
@RequestMapping("/insa/*")
public class InsaController {

	@Autowired
	private InsaService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String mainForm(String empNo, Model model) throws Exception {
		
		List<Insa> list = service.list();
		
		if(empNo != null) {
			Insa emp = service.readInsa(empNo);
			model.addAttribute("emp", emp);
		}
		
		model.addAttribute("mode", "main");
		model.addAttribute("list", list);
		return ".insa.main";
	}

	@RequestMapping(value = "main", method = RequestMethod.POST)
	public String mainSubmit(Insa dto,
			final RedirectAttributes reAttr,
			Model model) {
		
		List<Insa> list = service.list();
		
		try {
			service.insertInsa(dto, "");
			
		}   catch (DuplicateKeyException e) {
			model.addAttribute("mode", "employee");
			model.addAttribute("message", "사원번호 중복으로 등록에 실패했습니다.");
			model.addAttribute("list", list);
			
			return ".insa.main";
		}
		
		catch (DataIntegrityViolationException e) {
			model.addAttribute("mode", "employee");
			model.addAttribute("message", "사원등록에 실패했습니다.");
			model.addAttribute("list", list);
			return ".insa.main";
		}
		
		catch (Exception e) {
			model.addAttribute("mode", "employee");
			model.addAttribute("message", "사원등록에 실패했습니다.");
			model.addAttribute("list", list);
			return ".insa.main";
		}
	

		return "redirect:/insa/main";
	}
	
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(Insa dto, 
			final RedirectAttributes reAttr,
			Model model) {
	
		try {
			service.updateInsa(dto, "");
		} catch (Exception e) {
		}
		

		return "redirect:/insa/main";
		
	}
	
	
	@RequestMapping(value = "empNoCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> empNoCheck(@RequestParam String empNo) throws Exception {

		String p = "true";
		Insa dto = service.readInsa(empNo);
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



