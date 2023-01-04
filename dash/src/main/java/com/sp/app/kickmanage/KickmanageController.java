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



@Controller("kick.kickmanageController")
@RequestMapping("/kickmanage/*")
public class KickmanageController {

	
	@Autowired
	private KickmanageService service;
	
	@RequestMapping(value = "main")
	public String list(Model model, @RequestParam(defaultValue = "other") String condition
			, HttpServletRequest req) {
		
		List<Kickmanage> list =  null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		
		list = service.listkickboard(map);
	
		model.addAttribute("list", list);
		model.addAttribute("condition", condition);
		
		
		
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
