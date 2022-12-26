package com.sp.app.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("approval.approvalController")
@RequestMapping(value = "/approval/*")
public class ApprovalController {
	   
	   @RequestMapping(value = "main")
	   public String main() throws Exception {
	      
	      return ".approval.main";
	   }
	   
	   @PostMapping("write")
	   @ResponseBody
	   public String write(@RequestBody String[] data
			  ) throws Exception {
	      
	      System.out.println(data);
	      
	      
	      return ".approval.write";
	   }
}
