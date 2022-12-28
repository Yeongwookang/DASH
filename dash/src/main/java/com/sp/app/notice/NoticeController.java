package com.sp.app.notice;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.FileManager;
import com.sp.app.common.MyUtil;
import com.sp.app.employee.SessionInfo;

@Controller("notice.noticeController")
@RequestMapping("/notice/*")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
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
		
		List<Notice> noticeList = null;
		if(current_page == 1) {
			noticeList = service.listNoticeTop();
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Notice> list = service.listNotice(map);
		
		Date endDate = new Date();
		long gap;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(Notice dto : list) {
			Date startDate = sdf.parse(dto.getReg_date());
			
			gap = (endDate.getTime() - startDate.getTime()) / (24 * 60 * 60 * 1000);
			dto.setGap(gap);
			
			dto.setReg_date(dto.getReg_date().substring(0, 10));
		}
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/notice/main";
		String articleUrl = cp + "/notice/article?page=" + current_page;
		if(keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/notice/main?" + query;
			articleUrl = cp + "/notice/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		
		return ".notice.main";
	}
	
	@GetMapping(value = "write")
	public String writeForm(Model model) throws Exception {
		
		model.addAttribute("mode", "write");
		
		return ".notice.write";
	}
	
	@PostMapping(value = "write")
	public String writeSubmit(Notice dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("employee");

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "notice";
			
			dto.setEmpNo(info.getEmpNo());
			service.insertNotice(dto, pathname);
			
		} catch (Exception e) {
		}
		
		return "redirect:/notice/main";
	}
	
	@RequestMapping(value = "article")
	public String article(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page=" + page;
		if(keyword.length() != 0) {
			query = "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		service.updateHitCount(num);
		
		Notice dto = service.readNotice(num);
		if(dto == null) {
			return "redirect:/notice/main?" + query;
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("num", num);
		
		Notice preReadDto = service.preReadNotice(map);
		Notice nextReadDto = service.nextReadNotice(map);
		
		List<Notice> listFile = service.listFile(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".notice.article";
	}
	
	@GetMapping(value = "update")
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("employee");
		
		Notice dto = service.readNotice(num);
		if(dto == null || ! info.getEmpNo().equals(dto.getEmpNo())) {
			return "redirect:/notice/main?page=" + page;
		}
		
		List<Notice> listFile = service.listFile(num);
		
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		
		return ".notice.write";
	}
	
	@PostMapping(value = "update")
	public String updateSubmit(Notice dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("employee");
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "notice";

			dto.setEmpNo(info.getEmpNo());
			service.updateNotice(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/notice/main?page=" + page;
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "notice";
			service.deleteNotice(num, pathname);
		} catch (Exception e) {
		}

		return "redirect:/notice/main?" + query;
	}
	
	@RequestMapping(value = "download")
	public void download(@RequestParam long fileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "notice";
		
		boolean b = false;
		
		Notice dto = service.readFile(fileNum);
		if(dto != null) {
			String saveFilename = dto.getSaveFilename();
			String originalFilename = dto.getOriginalFilename();
			
			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		
		if(! b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능합니다.');history.back();<script>");
			} catch (Exception e) {
			}
		}
	
	}
	
	@RequestMapping(value = "zipdownload")
	public void zipdownload(@RequestParam long num,
			HttpServletResponse resp,
			HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "notice";
		
		boolean b = false;
		
		List<Notice> listFile = service.listFile(num);
		
		if(listFile.size() > 0) {
			String[] sources = new String[listFile.size()];
			String[] originals = new String[listFile.size()];
			String zipFilename = "문서번호 00" + num +  ".zip";
			
			for(int idx = 0; idx < listFile.size(); idx++) {
				sources[idx] = pathname + File.separator + listFile.get(idx).getOriginalFilename();
				originals[idx] = File.separator + listFile.get(idx).getOriginalFilename();
			}
			
			b = fileManager.doZipFileDownload(sources, originals, zipFilename, resp);
		}
		
		
		if(! b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능합니다.');history.back();<script>");
			} catch (Exception e) {
			}
		}
	
	}
	
	@PostMapping(value = "deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long fileNum,
			HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "notice";
		
		Notice dto = service.readFile(fileNum);
		if(dto != null) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
		}
		
		String state = "false";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "fileNum");
			map.put("num", fileNum);
			service.deleteFile(map);
			state = "true";
		} catch (Exception e) {
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	
	}
	
	
}
