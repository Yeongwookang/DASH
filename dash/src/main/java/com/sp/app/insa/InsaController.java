package com.sp.app.insa;


import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	public String main(Model model) throws Exception {
		model.addAttribute("mode", "member");
		return ".insa.main";
	}

	@RequestMapping(value = "main", method = RequestMethod.POST)
	public String mainSubmit(Employee dto, 
			final RedirectAttributes reAttr,
			Model model) {
		
		try {
			service.insertEmployee(dto);
			
		}   catch (DuplicateKeyException e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "사원번호 중복으로 등록에 실패했습니다.");
			return ".insa.main";
		}
		
		catch (DataIntegrityViolationException e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "사원등록에 실패했습니다.");
			return ".insa.main";
		}
		
		catch (Exception e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "사원등록에 실패했습니다.");
			return ".insa.main";
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append(dto.getName() + "님의 사원 등록이 정상적으로 처리되었습니다.<br>");

		reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("title", "사원 등록");

		return "redirect:/insa/complete";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(Employee dto,
			final RedirectAttributes reAttr,
			Model model) {

		try {
			service.updateEmployee(dto);
		} catch (Exception e) {
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getName() + "사원의 정보가 정상적으로 변경되었습니다.<br>");
		sb.append("메인화면으로 이동 하시기 바랍니다.<br>");

		reAttr.addFlashAttribute("title", "수정");
		reAttr.addFlashAttribute("message", sb.toString());

		return "redirect:/insa/complete";
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
	
	@RequestMapping("list") 
	public String list(@RequestParam(defaultValue = "0") long categoryNum,
		@RequestParam(defaultValue = "-1") int employeeShow,
		@RequestParam(defaultValue = "all") String col,
		@RequestParam(defaultValue = "") String kw,		
		@RequestParam(value = "page", defaultValue = "1") int current_page,
		HttpServletRequest req,
		Model model) throws Exception {
	
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			kw = URLDecoder.decode(kw, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNum", categoryNum);
		map.put("employeeShow", employeeShow);
		map.put("col", col);
		map.put("kw", kw);
		
		dataCount = insaService.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Employee> list = insaService.listEmployee(map);
		List<Employee> listCategory = insaService.listCategory();
		
		String listUrl = cp + "/insa/list?categoryNum="+categoryNum;
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("list", list);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("employeeShow", employeeShow);
		model.addAttribute("col", col);
		model.addAttribute("kw", kw);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
				
		return ".insa.list";
	}
	
	/*
	@RequestMapping(value="pwdFind", method=RequestMethod.GET)
	public String pwdFindForm(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info != null) {
			return "redirect:/";
		}
		
		return ".member.pwdFind";
	}
	
	@RequestMapping(value = "pwdFind", method = RequestMethod.POST)
	public String pwdFindSubmit(@RequestParam String userId,
			RedirectAttributes reAttr,
			Model model) throws Exception {
		

		return "redirect:/member/complete";
	}
	
	@RequestMapping(value = "noAuthorized")
	public String noAuthorized(Model model) {
		return ".member.noAuthorized";
	}
	*/
}
