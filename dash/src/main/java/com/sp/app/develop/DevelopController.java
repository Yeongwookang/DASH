package com.sp.app.develop;

import java.io.File;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.approval.Approval;
import com.sp.app.common.FileManager;
import com.sp.app.common.MyUtil;
import com.sp.app.employee.Employee;
import com.sp.app.employee.EmployeeService;
import com.sp.app.employee.SessionInfo;


@Controller("develop.developController")
@RequestMapping("/develop/*")
public class DevelopController {

	@Autowired
	private DevelopService service;

	@Autowired
	private EmployeeService empService;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
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
		
		List<Approval> approvalList = service.approvalList(map);
		
		int size = 5;
		
		int total_page;
		int dataCount = service.myApprovalCount(map);
		
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
		
		List<Approval> myApprovalList = service.myApprovalList(map);
		
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("depApprovalList", myApprovalList);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".develop.main";
	}
	
	@GetMapping("read/{signNum}")
	public String approvalForm(Model model, HttpServletRequest req, @PathVariable long signNum) throws Exception {
		HttpSession session = req.getSession(); 
		SessionInfo info = (SessionInfo)session.getAttribute("employee");
		if(info == null) {
			return "redirect:/employee/login";
		}
		model.addAttribute("mode", "read");
		
		Approval dto = service.readApproval(signNum);	
		
		Employee ref1= empService.readEmployee(dto.getRef1());
		Employee ref2= empService.readEmployee(dto.getRef2());
		Employee ref3= empService.readEmployee(dto.getRef3());
		
		List<Approval> fileList = service.fileList(signNum);
		
		model.addAttribute("dto",dto);
		model.addAttribute("fileList", fileList);
		model.addAttribute("ref1",ref1);
		model.addAttribute("ref2",ref2);
		model.addAttribute("ref3",ref3);

		return ".develop.main";
	}
	

	@GetMapping("download/{fileNum}")
	public void downloadFile(HttpServletResponse resp,
			HttpSession session,
			@PathVariable long fileNum) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "approval";
		
		System.out.println(root+":"+pathname);
		
		boolean b = false;
		
		Approval dto = service.readFile(fileNum);
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
	
	
	@PostMapping("approve")
	public String approve(@RequestParam Map<String, Object> map
			) throws Exception{
		String signNum = (String)map.get("signNum");
		map.put("signNum",Long.parseLong(signNum));
		service.approveUpdate(map);
		service.approve(map);
		
		return "redirect:/approval/main";
	}
	

	
}
