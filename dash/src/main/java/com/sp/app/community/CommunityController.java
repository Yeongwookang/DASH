package com.sp.app.community;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;
import com.sp.app.employee.SessionInfo;

@Controller("community.CommunityController")
@RequestMapping("/community/*")
public class CommunityController {
	@Autowired
	private CommunityService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "main")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
		@RequestParam(defaultValue = "all") String condition,
		@RequestParam(defaultValue = "") String keyword,
		HttpServletRequest req,
		Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Community> list = service.listCommunity(map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/community/main";
		String articleUrl = cp + "/community/article?page=" + current_page;
		if(keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/community/main?" + query;
			articleUrl = cp + "/community/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("condition", condition);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		
		return ".community.main";
		
	}
	
	@GetMapping(value = "write")
	public String writeForm(Model model) throws Exception {
		
		model.addAttribute("mode", "write");
		
		return ".community.write";
	}
	
	@PostMapping(value = "write")
	public String writeSubmit(Community dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("employee");

		try {
			
			dto.setEmpNo(info.getEmpNo());
			service.insertCommunity(dto);
			
		} catch (Exception e) {
		}
		
		return "redirect:/community/main"; 
	}
	
}
