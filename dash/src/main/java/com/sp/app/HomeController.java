package com.sp.app;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.analysis.Analysis;
import com.sp.app.analysis.AnalysisService;
import com.sp.app.employee.Employee;
import com.sp.app.employee.EmployeeService;
import com.sp.app.employee.SessionInfo;

@Controller
public class HomeController {
   
   @Autowired
   private AnalysisService service;
   
   @Autowired
   private EmployeeService service2;

   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, HttpSession session, Model model) throws Exception {
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
      
      SessionInfo info = (SessionInfo)session.getAttribute("employee");
      
      if(info == null) {
         return "redirect:/employee/login";
      }    
      
      Employee dto = service2.readMain(info.getEmpNo());
      
      model.addAttribute("msg", msg);
      model.addAttribute("dayOfWeek", s);
      model.addAttribute("totalSales", totalSales);
      model.addAttribute("rentalCount", rentalCount);
      model.addAttribute("newCustomerCount", newCustomerCount);
      model.addAttribute("repairCount", repairCount);
      model.addAttribute("damageCount", damageCount);
      model.addAttribute("usageRankList", usageRankList);
      
      model.addAttribute("dto", dto);
      
      return ".mainLayout";
   }
   
   @RequestMapping("zoonSalesAnalysis")
   @ResponseBody
   public Map<String, Object> salesRankList() throws Exception {
      Map<String, Object> model = new HashMap<String, Object>();

      List<Analysis> salesRankList = service.salesRankList();

      model.put("salesRankList", salesRankList);

      return model;
   }
   
   @RequestMapping("zoonUsageCountAnalysis")
   @ResponseBody
   public Map<String, Object> lastDayUsageCount() throws Exception {
      Map<String, Object> model = new HashMap<String, Object>();

      Analysis lastDayUsageCount = service.lastDayUsageCount();

      model.put("lastDayUsageCount", lastDayUsageCount);

      return model;
   }
   
}