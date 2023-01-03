package com.sp.app.approval;

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
import com.sp.app.employee.Employee;
import com.sp.app.employee.EmployeeService;
import com.sp.app.employee.SessionInfo;

@Controller("approval.approvalController")
@RequestMapping(value = "/approval/*")
public class ApprovalController {
	   
		@Autowired
		private ApprovalService service;
		
		@Autowired
		private EmployeeService empService;
		
		@Autowired
		private MyUtil myUtil;
		
		@RequestMapping(value = "main")
		public String main(Model model, HttpServletRequest req ) throws Exception {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			HttpSession session = req.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("employee");
			if(info == null) {
				return "redirect:/employee/login";
			}
			map.put("empNo",info.getEmpNo());
			
			List<Approval> approvalList = service.approvalList(map);
			
			List<Approval> myApprovalList = service.myApprovalList(map);
			
			
			model.addAttribute("approvalList", approvalList);
			model.addAttribute("myApprovalList", myApprovalList);
			
			
		      return ".approval.main";
		}
		   
		@GetMapping("empSearch")
		@ResponseBody
		public Map<String, Object> empSearch(@RequestParam Map<String, Object> map
				  ) throws Exception {
		     List<Employee> empList=null;
		     
		     empList= service.empList(map);
		     Map<String, Object> model =  new HashMap<String, Object>();
		     model.put("empList",empList);
		     
		     return model;
		}
		
		@GetMapping("write")
		public String writeForm(Model model, HttpServletRequest req)throws Exception{
			HttpSession session = req.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("employee");
			if(info == null) {
				return "redirect:/employee/login";
			}
			model.addAttribute("mode", "write");
			return ".approval.write";
		}
		
		@PostMapping("write")
		public String writeSubmit(
				@RequestParam Map<String, Object>map
				) throws Exception{
			
			service.insertApproval(map);
			
			return "redirect:/approval/main";
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
			
			model.addAttribute("dto",dto);
			model.addAttribute("ref1",ref1);
			model.addAttribute("ref2",ref2);
			model.addAttribute("ref3",ref3);



			return ".approval.read";
		}
		
		@GetMapping("update/{signNum}")
		public String updateForm(Model model, HttpServletRequest req, @PathVariable long signNum)throws Exception{
			HttpSession session = req.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("employee");
			if(info == null) {
				return "redirect:/employee/login";
			}
			Approval dto = service.readApproval(signNum);		
			
			Employee ref1= empService.readEmployee(dto.getRef1());
			Employee ref2= empService.readEmployee(dto.getRef2());
			Employee ref3= empService.readEmployee(dto.getRef3());
			
			model.addAttribute("dto", dto);
			model.addAttribute("ref1", ref1);
			model.addAttribute("ref2", ref2);
			model.addAttribute("ref3", ref3);
			model.addAttribute("mode", "update");
			
			return ".approval.write";
		}
		
		@PostMapping("update")
		public String updateSubmit(
				@RequestParam Map<String, Object>map
				) throws Exception{
			
			service.updateApproval(map);
			
			return "redirect:/approval/main";
		}
		
		@GetMapping("approve/{signNum}")
		public String approve(@PathVariable long signNum
				) throws Exception{
			service.approveUpdate(signNum);
			service.approve(signNum);
			
			return "redirect:/approval/main";
		}
		
		
}

