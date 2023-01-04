package com.sp.app.kickmanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;



@Controller("kick.kickmanageController")
@RequestMapping("/kickmanage/*")
public class KickmanageController {

	
	@Autowired
	private KickmanageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "main")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			Model model, @RequestParam(defaultValue = "other") String condition
			, HttpServletRequest req) {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
			
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		
		List<Kickmanage> list =  null;
		
		list = service.listkickboard(map);
	
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/kickmanage/main";
		
		if(condition.length() != 0) {
			query = "condition=" + condition;
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/kickmanage/main?" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
	
		model.addAttribute("list", list);
		model.addAttribute("condition", condition);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		
		return ".kickmanage.main";
	}
	
	
	//수리대기
	@RequestMapping(value = "repairwait")
	@ResponseBody
	public Map<String, Object> repairwaitForm(@RequestParam(value="val[]") List<String>kNums)throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		String state = "true";
		try {
			for(int i=0;i<kNums.size();i++) {
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("kNum", kNums.get(i));
				service.updatedamagekickBoardwait(map);
				service.insertrepairwait(map);
				
			}
		} catch (Exception e) {
			state = "false";
		}
		model.put("state", state);
		return model;
	}
	//입고
	@RequestMapping(value = "repair")
	@ResponseBody
	public Map<String, Object> repairForm(@RequestParam(value="val[]") List<String>kNums)throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		String state = "true";
		try {
			for(int i=0;i<kNums.size();i++) {
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("kNum", kNums.get(i));
				service.updaterepairing(map);
				
			}
		} catch (Exception e) {
			state = "false";
		}
		model.put("state", state);
		return model;
	}
	//완료
	@RequestMapping(value = "repaircom")
	@ResponseBody
	public Map<String, Object> repaircomForm(@RequestParam(value="val[]") List<String>kNums)throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		String state = "true";
		try {
			for(int i=0;i<kNums.size();i++) {
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("kNum", kNums.get(i));
				service.updaterepaircomkickBoard(map);
				service.updaterepaircom(map);
				
			}
		} catch (Exception e) {
			state = "false";
		}
		model.put("state", state);
		return model;
	}
	
	//파손
	@GetMapping(value = "damage")
	@ResponseBody
	public Map<String, Object> damageForm(@RequestParam(value="val[]") List<String>kNums) throws Exception {
		
		Map<String, Object> model = new HashMap<String, Object>();
		String state = "true";
		try {
			for(int i=0;i<kNums.size();i++) {
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("kNum", kNums.get(i));
				service.updatedamagekickBoard(map);
				service.insertdamage(map);
			}
			
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("state", state);
		
		return model;
		
	}

	
	
	
}
