package com.sp.app;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.analysis.Analysis;
import com.sp.app.analysis.AnalysisService;
import com.sp.app.approval.Approval;
import com.sp.app.approval.ApprovalService;
import com.sp.app.community.Community;
import com.sp.app.community.CommunityService;
import com.sp.app.employee.SessionInfo;
import com.sp.app.message.MessageService;
import com.sp.app.notice.Notice;
import com.sp.app.notice.NoticeService;
import com.sp.app.punching.Punching;
import com.sp.app.punching.PunchingService;
import com.sp.app.schedule.ScheduleService;

@Controller
public class HomeController {
   private Logger logger = LoggerFactory.getLogger(this.getClass());
	
   @Autowired
   private AnalysisService service;
   
   @Autowired
   private ApprovalService apService;
   
   @Autowired
   private NoticeService noService;
   
   @Autowired
   private CommunityService coService;
   
   @Autowired
   private PunchingService punService;
   
   @Autowired
   private MessageService msgService;

   @RequestMapping(value = "/")
   public String home(Locale locale, HttpServletRequest req, Model model,
		   @RequestParam(defaultValue = "other") String condition, 
		   @RequestParam(defaultValue = "") String std, @RequestParam(defaultValue = "") String edt) throws Exception {
      Calendar cal = Calendar.getInstance();
      
      int year = cal.get(Calendar.YEAR);
      int month = cal.get(Calendar.MONTH)+1;
      int day = cal.get(Calendar.DATE);
      int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
      
      String korDayOfWeek = "";
      switch(dayOfWeek) {
         case 1:
            korDayOfWeek = "일";
            break;
         case 2:
            korDayOfWeek = "월";
            break;
         case 3:
            korDayOfWeek = "화";
            break;
         case 4:
            korDayOfWeek = "수";
            break;
         case 5:
            korDayOfWeek = "목";
            break;
         case 6:
            korDayOfWeek = "금";
            break;
         case 7:
            korDayOfWeek = "토";
            break;
      }
      
      String msg = year + "." + month + "." + day + "&nbsp;(" + korDayOfWeek + ")";
      String s = "즐거운 " + korDayOfWeek + "요일입니다.";
      
      String totalSales = service.totalSales();
      int rentalCount = service.rentalCount();
      int newCustomerCount = service.newCustomerCount();
      int repairCount = service.repairCount();
      int damageCount = service.damageCount();
      
      List<Analysis> usageRankList = service.usageRankList();
      
      HttpSession session = req.getSession();
      SessionInfo info = (SessionInfo)session.getAttribute("employee");
      
      if(info == null) {
         return "redirect:/employee/login";
      }    
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("empNo",info.getEmpNo());
      
      Punching punching = punService.todayPunch(map);
      
      map.put("offset",0);
      map.put("size",5);
      List<Approval> myApprovalList = apService.myApprovalList(map);
      
      model.addAttribute("msg", msg);
      model.addAttribute("dayOfWeek", s);
      model.addAttribute("totalSales", totalSales);
      model.addAttribute("rentalCount", rentalCount);
      model.addAttribute("newCustomerCount", newCustomerCount);
      model.addAttribute("repairCount", repairCount);
      model.addAttribute("damageCount", damageCount);
      model.addAttribute("usageRankList", usageRankList);
      model.addAttribute("myApprovalList", myApprovalList);
      
      List<Notice> list = noService.listNoticeMain();
      List<Notice> listTop = noService.listNoticeTopMain();
      
      Date endDate = new Date();
	  long gap;
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  for(Notice dto : list) {
		  Date startDate = sdf.parse(dto.getReg_date());
		
		  gap = (endDate.getTime() - startDate.getTime()) / (24 * 60 * 60 * 1000);
		  dto.setGap(gap);
		
		  dto.setReg_date(dto.getReg_date().substring(0, 10));
	  }
      
      List<Community> listCommunity = coService.listCommunityMain();
      
      
      Punching punDto = punService.readDayOff(info.getEmpNo());
      
      model.addAttribute("list", list);
      model.addAttribute("listTop", listTop);
      model.addAttribute("listCommunity", listCommunity);
      model.addAttribute("todayPunch", punching);
      model.addAttribute("punDto", punDto);
      
      Map<String, Object> punmap = new HashMap<String, Object>();
      punmap.put("empNo", info.getEmpNo());
      punmap.put("condition", condition);
      punmap.put("std", std);
      punmap.put("edt", edt);
			
      List<Punching> clockList = punService.listPunchclock(punmap);
		
	  model.addAttribute("clockList", clockList);
	  model.addAttribute("condition", condition);
	  model.addAttribute("std", std);
	  model.addAttribute("edt", edt);
      
      return ".mainLayout";
   }
   
    @PostMapping(value = "newMessageCount")
	@ResponseBody
	public Map<String, Object> newMessageCount(HttpSession session){
    	SessionInfo info = (SessionInfo)session.getAttribute("employee");
		int count = msgService.newMessageCount(info.getEmpNo());
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("count", count);
		return model;
	} 
   
   
}