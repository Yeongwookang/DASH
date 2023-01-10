package com.sp.app.develop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;
import com.sp.app.employee.SessionInfo;


@Controller("develop.developController")
@RequestMapping("/develop/*")
public class DevelopController {
	
	@Autowired
	private DevelopService service;

	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "main")
	public String main(Model model, 
			HttpServletRequest req, 
			@RequestParam(value = "page", defaultValue = "1") int current_page ) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("employee");
		if(info == null) {
			return "redirect:/employee/login";
		}
		map.put("empNo",info.getEmpNo());
		
		List<Develop> approvalList = service.approvalList(map);
		
		int size = 5;
		
		int total_page;
		int dataCount = service.depApprovalCount(map);
		
		total_page = myUtil.pageCount(dataCount, size);
		
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		String cp = req.getContextPath();
		
		String list_url = cp+"/develop/main";
		String paging = myUtil.paging(current_page, total_page, list_url);
		
		List<Develop> depApprovalList = service.depApprovalList(map);
		
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("depApprovalList", depApprovalList);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".develop.main";
	}
	
	
	
	
}
