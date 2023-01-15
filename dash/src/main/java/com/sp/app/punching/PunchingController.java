package com.sp.app.punching;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.common.FileManager;
import com.sp.app.common.MyUtil;

@Controller("punching.punchingController")
@RequestMapping(value = "/punching/*")
public class PunchingController {
	   
		@Autowired
		private PunchingService service;
		
		@Autowired
		private MyUtil myUtil;
		
		@Autowired
		private FileManager fileManager;

		
}

