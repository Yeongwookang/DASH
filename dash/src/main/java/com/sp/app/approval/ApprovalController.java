package com.sp.app.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
		public String main(Model model) throws Exception {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			List<Approval> approvalList = service.approvalList(map);
			
			
		      return ".approval.main";
		}
		   
		@GetMapping("empSearch")
		@ResponseBody
		public Map<String, Object> write(@RequestParam Map<String, Object> map
				  ) throws Exception {
		     List<Employee> empList=null;
		     
		     empList= service.empList(map);
		     Map<String, Object> model =  new HashMap<String, Object>();
		     model.put("empList",empList);
		     
		     return model;
		}
		
}
