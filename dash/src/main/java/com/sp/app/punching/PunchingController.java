package com.sp.app.punching;

import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.sp.app.common.MyUtil;
import com.sp.app.employee.SessionInfo;


@Controller("punching.punchingController")
@RequestMapping(value = "/punching/*")
public class PunchingController {
      private Logger logger = LoggerFactory.getLogger(this.getClass());
      
      @Autowired
      private PunchingService service;
      
      @Autowired
      private MyUtil myUtil;
      
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
      
    @RequestMapping(value = "main")
  	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
  		@RequestParam(defaultValue = "content") String condition,
  		@RequestParam(defaultValue = "") String keyword,
  		HttpServletRequest req,
  		Model model) throws Exception {
  		
  		int size = 10;
  		int total_page = 0;
  		int dataCount = 0;
  		
  		if(req.getMethod().equalsIgnoreCase("GET")) {
  			keyword = URLDecoder.decode(keyword, "utf-8");
  		}
  		
  		Map<String, Object> map = new HashMap<String, Object>();
  		map.put("condition", condition);
  		map.put("keyword", keyword);
  		
  		dataCount = service.dataCountGainVacation(map);
  		if(dataCount != 0) {
  			total_page = myUtil.pageCount(dataCount, size);
  		}
  		
  		if(total_page < current_page) {
  			current_page = total_page;
  		}
  		
  		int offset = (current_page - 1) * size;
  		if(offset < 0) offset = 0;
  		
  		map.put("offset", offset);
  		map.put("size", size);
  		
  		List<Punching> list = service.listGainVacation(map);
  		
  		for(Punching dto : list) {
  			dto.setContent(dto.getContent().replaceAll("<p>", ""));
  			dto.setContent(dto.getContent().replaceAll("</p>", ""));
  		}
  		
  		String cp = req.getContextPath();
  		String query = "";
  		String listUrl = cp + "/punching/main";
  		String updateUrl = cp + "/punching/update?page=" + current_page;
  		String deleteUrl = cp + "/punching/delete?page=" + current_page;
  		if(keyword.length() != 0) {
  			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
  		}
  		
  		if(query.length() != 0) {
  			listUrl = cp + "/punching/main?" + query;
  			updateUrl = cp + "/punching/update?page=" + current_page + "&" + query;
  			deleteUrl = cp + "/punching/delete?page=" + current_page + "&" + query;
  		}
  		
  		String paging = myUtil.paging(current_page, total_page, listUrl);
  		
  		model.addAttribute("condition", condition);
  		model.addAttribute("keyword", keyword);

  		model.addAttribute("list", list);
  		model.addAttribute("page", current_page);
  		model.addAttribute("dataCount", dataCount);
  		model.addAttribute("total_page", total_page);
  		model.addAttribute("paging", paging);
  		model.addAttribute("updateUrl", updateUrl);
  		model.addAttribute("deleteUrl", deleteUrl);
  		
  		return ".punching.main";
  	}
   
    @GetMapping(value = "write")
  	public String writeForm(Model model) throws Exception {
  		
  		model.addAttribute("mode", "write");
  		
  		return ".punching.write";
  	}
  	
  	@PostMapping(value = "write")
  	public String writeSubmit(Punching dto) throws Exception {
  		
  		try {
  			
  			Punching read = service.readVacation(dto.getEmpNo());
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
  		
  		return "redirect:/punching/main";
  	}
	
}

