package com.sp.app.approval;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.employee.Employee;

@Controller("approval.approvalController")
@RequestMapping(value = "/approval/*")
public class ApprovalController {
	   
		@Autowired
		private ApprovalService service;
		
		@Autowired
		private MyUtil myUtil;
	
		@RequestMapping(value = "main")
		public String main(@RequestParam(value = "page", defaultValue = "1") int current_page,
				@RequestParam(defaultValue = "dep") String condition,
				@RequestParam(defaultValue = "") String keyword,
				HttpServletRequest req,
				Model model) throws Exception {
			
			if (req.getMethod().equalsIgnoreCase("GET")) {
				keyword = URLDecoder.decode(keyword, "utf-8");
			}

			int size = 4;
			int dataCount, total_page;

			Map<String, Object> map = new HashMap<>();
			map.put("condition", condition);
			map.put("keyword", keyword);
			
			dataCount = service.dataCount(map);
			total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			map.put("offset", offset);
			map.put("size", size);

			
			List<Employee> empList = service.empList(map);
			
			String cp = req.getContextPath();
			String listUrl = cp + "/approval/main";

			if (keyword.length() != 0) {
				listUrl += "?condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
			}

			String paging = myUtil.paging(current_page, total_page, listUrl);
			
			
			model.addAttribute("list", empList);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			model.addAttribute("condition", condition);
			model.addAttribute("keyword", keyword);
			
		      return ".approval.main";
		}
		   
		@GetMapping("write")
		@ResponseBody
		public String write(@RequestBody String[] data
				  ) throws Exception {
		      return ".approval.write";
		}
		
}
