package com.sp.app.approval;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
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
		public String main(Model model) throws Exception {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			List<Approval> approvalList = service.approvalList(map);
			
		      return ".approval.main";
		}
		   
		@GetMapping("write")
		@ResponseBody
		public String write(@RequestBody String[] data
				  ) throws Exception {
		      return ".approval.write";
		}
		
}
