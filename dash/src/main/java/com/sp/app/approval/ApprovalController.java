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
		public String writeForm(Model model)throws Exception{
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
		public String approvalForm(Model model, @PathVariable long signNum) throws Exception {
			model.addAttribute("mode", "read");
			
			Approval dto = service.readApproval(signNum);
			Approval refList = service.refList(signNum);
			
			String ref1 = refList.getRef1();
			String ref2 = refList.getRef2();
			String ref3 = refList.getRef3();
			
			dto.setRef1(ref1);
			dto.setRef2(ref2);
			dto.setRef3(ref3);
			
			
			Employee ref1dto = empService.readEmployee(ref1);
			Employee ref2dto = empService.readEmployee(ref2);
			Employee ref3dto = empService.readEmployee(ref3);
			
			String ref1name = ref1dto.getDepName()+" "+ ref1dto.getName();
			String ref2name = ref2dto.getDepName()+" "+ ref2dto.getName();
			String ref3name = ref3dto.getDepName()+" "+ ref3dto.getName();
			
			dto.setRef1name(ref1name);
			dto.setRef2name(ref2name);
			dto.setRef3name(ref3name);
			
			
			model.addAttribute("dto",dto);

			return ".approval.read";
		}
		
		@GetMapping("update/{signNum}")
		public String updateForm(Model model, @PathVariable long signNum)throws Exception{
			
			Approval dto =  service.readApproval(signNum);
			
			model.addAttribute("mode", "update");
			model.addAttribute("dto", dto);
			return ".approval.write";
		}
		
		@PostMapping("update")
		public String updateSubmit(
				@RequestParam Map<String, Object>map
				) throws Exception{
			

			service.updateApproval(map);
			
			return "redirect:/approval/main";
		}
		
}

