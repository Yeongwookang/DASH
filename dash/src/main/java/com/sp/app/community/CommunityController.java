package com.sp.app.community;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		HttpServletRequest req,
		Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		
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
		if(condition.length() != 0) {
			query = "condition=" + condition;
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/community/main?" + query;
			articleUrl = cp + "/community/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
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
	
	@GetMapping(value = "article")
	public String article(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("employee");
		
		String query = "page=" + page;
		if(condition.length() != 0) {
			query += "&condition=" + condition;
		}
		
		Community dto = service.readCommunity(num);
		if(dto == null) {
			return "redirect:/community/main?" + query;
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", info.getEmpNo());
		map.put("num", num);
		
		Map<String, Object> countMap = service.communityLikeCount(map);
		
		int likeCount = ((BigDecimal) countMap.get("LIKECOUNT")).intValue();
		int disLikeCount = ((BigDecimal) countMap.get("DISLIKECOUNT")).intValue();
		
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("disLikeCount", disLikeCount);
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".community.article";
 	}
	
	@PostMapping("insertCommunityLike")
	@ResponseBody
	public Map<String, Object> insertCommunityLike(@RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		String state = "true";
		
		SessionInfo info = (SessionInfo)session.getAttribute("employee");
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			paramMap.put("empNo", info.getEmpNo());
			service.insertCommunityLike(paramMap);
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> countMap = service.communityLikeCount(paramMap);
		
		int likeCount = ((BigDecimal) countMap.get("LIKECOUNT")).intValue();
		int disLikeCount = ((BigDecimal) countMap.get("DISLIKECOUNT")).intValue();
		
		model.put("likeCount", likeCount);
		model.put("disLikeCount", disLikeCount);
		model.put("state", state);
		
		return model;
	}
	
	@GetMapping(value = "listReply")
	public String listReply(@RequestParam long num,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {
		int size = 5;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		
		dataCount = service.replyCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page < total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Reply> listReply = service.listReply(map);
		List<Reply> listReplyTop = service.listReplyTop(map);
		
		for(Reply dto : listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("listReply", listReply);
		model.addAttribute("listReplyTop", listReplyTop);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "community/listReply";
	}
	
	@PostMapping(value = "insertReply")
	@ResponseBody
	public Map<String, Object> insertReply(Reply dto, HttpSession session){
		SessionInfo info = (SessionInfo)session.getAttribute("employee");
		String state = "true";
		
		try {
			dto.setEmpNo(info.getEmpNo());
			service.insertReply(dto);
		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping(value = "deleteReply")
	@ResponseBody
	public Map<String, Object> deleteReply(@RequestParam Map<String, Object> paramMap){
		String state = "true";
		
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@GetMapping(value = "listReplyAnswer")
	public String listReplyAnswer(@RequestParam Map<String, Object> paramMap,
			Model model) throws Exception {
		List<Reply> listReplyAnswer = service.listReplyAnswer(paramMap);
		
		for(Reply dto : listReplyAnswer) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("listReplyAnswer", listReplyAnswer);
		
		return "community/listReplyAnswer";
	}
	
	@PostMapping(value = "countReplyAnswer")
	@ResponseBody
	public Map<String, Object> countReplyAnswer(@RequestParam Map<String, Object> paramMap){
		int count = service.replyAnswerCount(paramMap);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("count", count);
		return model;
	}
	
	@PostMapping(value = "countReply")
	@ResponseBody
	public Map<String, Object> countReply(@RequestParam Map<String, Object> paramMap){
		int count = service.replyCount(paramMap);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("count", count);
		return model;
	}
	
	@GetMapping(value = "update")
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		Community dto = service.readCommunity(num);
		if(dto == null) {
			return "redirect:/community/main?page=" + page;
		}
		
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		
		return ".community.write";
	}
	
	@PostMapping(value = "update")
	public String updateSubmit(Community dto,
			@RequestParam String page) throws Exception {
		
		try {
			service.updateCommunity(dto);
		} catch (Exception e) {
		}

		return "redirect:/community/main?page=" + page;
	}
	
}	
