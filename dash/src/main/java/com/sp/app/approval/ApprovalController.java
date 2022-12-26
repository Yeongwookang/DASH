package com.sp.app.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("approval.approvalController")
@RequestMapping(value = "/approval/*")
public class ApprovalController {
	@RequestMapping(value = "main")
	public String main() {
		return ".approval.main";
	}

}
