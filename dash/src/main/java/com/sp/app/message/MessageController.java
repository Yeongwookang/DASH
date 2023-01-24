package com.sp.app.message;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.employee.SessionInfo;

@RequestMapping("/message/*")
@Controller("message.messageController")
public class MessageController {
	@Autowired
	private MessageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "{menuItem}/main")
	public String main(@PathVariable String menuItem,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("employee");
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("empNo", info.getEmpNo());
		
		if(menuItem.equals("receive")) {
			dataCount = service.dataCountReceive(map);
		} else {
			dataCount = service.dataCountSend(map);
		}
		
		total_page = myUtil.pageCount(dataCount, size);
		
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Message> list = null;
		if(menuItem.equals("receive")) {
			list = service.listReceive(map);
		} else {
			list = service.listSend(map);
		}
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/message/" + menuItem + "/main";
		String articleUrl = cp + "/message/" + menuItem + "/article?page=" + current_page;
		if(keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/message/" + menuItem + "/main?" + query;
			articleUrl = cp + "/message/" + menuItem + "/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("menuItem", menuItem);
		
		return ".message.main";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		
		return ".message.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Message dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("employee");

		try {
			dto.setSenderEmpNo(info.getEmpNo());
			service.insertMessage(dto);
		} catch (Exception e) {

		}

		return "redirect:/message/send/main";
	}
	
	@GetMapping
	@ResponseBody
	public Map<String, Object> listEmployee(
			@RequestParam String condition,
			@RequestParam String keyword,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("employee");
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("empNo", info.getEmpNo());
		List<Message> listEmployee = service.listEmployee(map);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listEmployee", listEmployee);
		return model;
		
	}
	
	@RequestMapping(value = "{menuItem}/article")
	public String article(@PathVariable String menuItem,
			@RequestParam long num, @RequestParam String page,
			@RequestParam(defaultValue = "") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("employee");
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page=" + page;
		if(keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("empNo", info.getEmpNo());
		map.put("num", num);
		
		Message dto = null;
		
		
		if(menuItem.equals("send")) {
			dto = service.readSend(num);
		} else {
			service.updateIdentifyDay(num);
			dto = service.readReceive(num);
		}
		
		if(dto == null) {
			return "redirect:/message/" + menuItem + "/main?" + query;
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("menuItem", menuItem);
		
		return ".message.article";
	}
	
	@RequestMapping(value = "{menuItem}/delete")
	public String delete(@PathVariable String menuItem,
			@RequestParam List<Long> nums,
			@RequestParam String page,
			@RequestParam(defaultValue = "") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session,
			Model model) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		if (menuItem.equals("receive")) {
			map.put("field1", "receiveDelete");
			map.put("field2", "sendDelete");
		} else {
			map.put("field1", "sendDelete");
			map.put("field2", "receiveDelete");
		}

		map.put("numList", nums);

		try {
			service.deleteMessage(map);
		} catch (Exception e) {

		}

		return "redirect:/message/" + menuItem + "/main?" + query;
	}
	
	@RequestMapping(value = "newMessageCount")
	@ResponseBody
	public Map<String, Object> newMessageCount(HttpSession session) throws Exception {
		String state = "true";
		int newCount = 0;
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("employee");
			String empNo = info.getEmpNo();
			
			newCount = service.newMessageCount(empNo);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("newCount", newCount);
		
		return model;
	}

}
