package com.sp.app.stationmanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.employee.Employee;
import com.sp.app.employee.EmployeeService;
import com.sp.app.employee.SessionInfo;

@Controller("station.stationmanageController")
@RequestMapping("/stationmanage/*")
public class StationmanageController {
	@Autowired
	private StationmanageService service;
	
	@Autowired
	   private EmployeeService service2;
	   
	
	
	   @RequestMapping(value = "main")
	   public String main(HttpSession session, Model model) throws Exception {
	      
	      SessionInfo info = (SessionInfo)session.getAttribute("employee");
	      Employee dto = service2.readMain(info.getEmpNo());
	      
	      model.addAttribute("dto", dto);
	      
	      return ".stationmanage.main";
	   }
	   
	   
	   
	   @RequestMapping(value = "regions")
	   @ResponseBody
	   public Map<String, Object> regions() throws Exception {
		   
		   List<Stationmanage> list = null;
		   
		   list = service.listStation();
		   
		   Map<String, Object> model =  new HashMap<String, Object>();
		   
		   model.put("list", list);
		   
		   return model;
	   }
	   
	   
	   
	
}
