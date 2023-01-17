package com.sp.app.develop;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.FileManager;
import com.sp.app.common.MyUtil;
import com.sp.app.employee.SessionInfo;


@Controller("develop.developController")
@RequestMapping("/develop/*")
public class DevelopController {

	@Autowired
	private DevelopService service;

	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "main")
	public String main(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
	
		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		SessionInfo info = (SessionInfo)session.getAttribute("employee");
		map.put("empNo", info.getEmpNo());

		map.put("offset", offset);
		map.put("size", size);

		List<Develop> list = service.approvalList(map);
	
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".develop.main";
	}
	
	@GetMapping("read")
	@ResponseBody
	public Map<String, Object> readApproval(@RequestParam long signNum) throws Exception {
		
		
		Develop dto = service.readApproval(signNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("dto", dto);

		return model;
	}

	
}
