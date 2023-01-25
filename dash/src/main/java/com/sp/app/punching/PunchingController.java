package com.sp.app.punching;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.employee.SessionInfo;
import com.sp.app.notice.Notice;


@Controller("punching.punchingController")
@RequestMapping(value = "/punching/*")
public class PunchingController {
      private Logger logger = LoggerFactory.getLogger(this.getClass());
      @Autowired
      private PunchingService service;
      
      @GetMapping("punchOn")
      public String punchOn(HttpServletRequest req ) {
         HttpSession session = req.getSession();
         SessionInfo info = (SessionInfo)session.getAttribute("employee");
         if(info == null) {
            return "redirect:/employee/login";
         }
         Punching pun =  new Punching();
         pun.setEmpNo(info.getEmpNo());
         
         try {
            service.punchOn(pun);
            
         } catch (Exception e) {
            logger.warn("{}가 발생했습니다. empNo: {}", e.getMessage(), pun.getEmpNo());
         }
         
         return "redirect:/";
         
         
      }
      
      @GetMapping("punchOff")
      public String punchOff(HttpServletRequest req ) {
         HttpSession session = req.getSession();
         SessionInfo info = (SessionInfo)session.getAttribute("employee");
         if(info == null) {
            return "redirect:/employee/login";
         }
         Punching pun =  new Punching();
         pun.setEmpNo(info.getEmpNo());
         
         
         try {
            if(service.readDayOff(info.getEmpNo())==null) {
               service.insertDayoff(pun);
            } 
            service.punchOff(pun);
            service.updateWorkDays(info.getEmpNo());
            
         } catch (Exception e) {
            logger.warn("{}오류가 발생했습니다. empNo: {}", e.getMessage(), pun.getEmpNo());
         }
         
         
         
         return "redirect:/";
      }
   
      @GetMapping(value = "write")
  	public String writeForm(Model model) throws Exception {
  		
  		model.addAttribute("mode", "write");
  		
  		return ".punching.write";
  	}
  	
  	@PostMapping(value = "write")
  	public String writeSubmit(Punching dto, HttpSession session) throws Exception {
  		
  		SessionInfo info = (SessionInfo) session.getAttribute("employee");

  		try {
  
  			dto.setEmpNo(info.getEmpNo());
  			
  			Punching read = service.readVacation(info.getEmpNo());
  			if(read == null) {
  				dto.setTotalQty(dto.getGainQty());
  				dto.setLeftQty(dto.getGainQty());
  				service.insertVacation(dto);
  				service.insertGainVacation(dto);
  			} else {
  				dto.setTotalQty(dto.getGainQty());
  				service.updateVacation(dto);
  				service.insertGainVacation(dto);
  			}
  			
  		} catch (Exception e) {
  		}
  		
  		return "redirect:/punching/write";
  	}
}

