package com.sp.app;

import java.util.Calendar;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.app.analysis.Analysis;
import com.sp.app.analysis.AnalysisService;
import com.sp.app.approval.Approval;
import com.sp.app.approval.ApprovalService;
import com.sp.app.community.Community;
import com.sp.app.community.CommunityService;
import com.sp.app.employee.SessionInfo;
import com.sp.app.notice.Notice;
import com.sp.app.notice.NoticeService;
import com.sp.app.punching.Punching;
import com.sp.app.punching.PunchingService;

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

   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, HttpServletRequest req, Model model) throws Exception {
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
      
      String msg = year + "." + month + "." + day + "(" + korDayOfWeek + ")";
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
      
      List<Community> listCommunity = coService.listCommunityMain();
      
      
      
      model.addAttribute("list", list);
      model.addAttribute("listTop", listTop);
      model.addAttribute("listCommunity", listCommunity);
      model.addAttribute("todayPunch", punching);
      
      return ".mainLayout";
   }
   
   
}