package com.sp.app.insa;


import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.app.common.MyUtil;




@Controller("insa.insaController")
@RequestMapping("/insa/*")
public class InsaController {

	@Autowired
	private InsaService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "main")
	public String mainForm(String empNo, 
			@RequestParam(defaultValue= "all")String col,
			@RequestParam(defaultValue="")String kwd,
			HttpServletRequest req, 
			Model model) throws Exception {
		
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("col", col);
		map.put("kwd", kwd);
		
		List<Insa> list = service.list(map);
		
		if(empNo != null) {
			Insa emp = service.readInsa(empNo);
			model.addAttribute("emp", emp);
			model.addAttribute("mode", "update");
		}else {
			model.addAttribute("mode", "insert");
			model.addAttribute("col", col);
			model.addAttribute("kwd", kwd);
			
		}
		
		model.addAttribute("list", list);
		return ".insa.main";
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String mainSubmit(Insa dto,
			final RedirectAttributes reAttr,
			HttpSession session,
			Model model) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";

		
	//	List<Insa> list = service.list();
		
		try {
			service.insertInsa(dto, path);
			
		}   catch (DuplicateKeyException e) {
			model.addAttribute("mode", "insert");
			model.addAttribute("message", "사원번호 중복으로 등록에 실패했습니다.");
		//	model.addAttribute("list", list);
			return ".insa.main";
		}
		
		catch (DataIntegrityViolationException e) {
			model.addAttribute("mode", "insert");
			model.addAttribute("message", "사원등록에 실패했습니다.");
		//	model.addAttribute("list", list);
			return ".insa.main";
		}
		
		catch (Exception e) {
			model.addAttribute("mode", "insert");
			model.addAttribute("message", "사원등록에 실패했습니다.");
		//	model.addAttribute("list", list);
			return ".insa.main";
		}
	

		return "redirect:/insa/main";
	}
	
	
	@GetMapping(value = "update")
	public String updateForm(@RequestParam String empNo ,
			HttpSession session,
			Model model) throws Exception {
		Insa dto = service.readInsa(empNo);
		if(dto == null) {
			return "redirect:/insa/main";
	}
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		
		return ".insa.main";
}
	
	@RequestMapping(value = "update")
	public String updateSubmit(Insa dto, 
			HttpSession session,
			Model model) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";

		
		
		try {
			service.updateInsa(dto, path);
		} catch (Exception e) {
		}
		

		return "redirect:/insa/main";
		
	}
	
	
	@RequestMapping(value = "empNoCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> empNoCheck(@RequestParam String empNo) throws Exception {

		String p = "true";
		Insa dto = service.readInsa(empNo);
		if (dto != null) {
			p = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("passed", p);
		return model;
	}
	
	
	@RequestMapping(value = "pwd", method = RequestMethod.GET)
	public String pwdForm(String dropout, Model model) {

		if (dropout == null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "dropout");
		}

		return ".insa.pwd";
	}

	@RequestMapping(value = "list")
	public String list(String empNo, 
			@RequestParam(defaultValue= "all")String col,
			@RequestParam(defaultValue="")String kwd,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req, 
			Model model) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("col", col);
		map.put("kwd", kwd);
		
		
		int size = 10;
		
		int total_page;
		int dataCount = service.dataCount(map);
		
		total_page = myUtil.pageCount(dataCount, size);
		
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		
		String cp = req.getContextPath();
		
		String list_url = cp+"/insa/list";
		String paging = myUtil.paging(current_page, total_page, list_url);
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Insa> list = service.list2(map);
		
		model.addAttribute("col", col);
		model.addAttribute("kwd", kwd);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		return ".insa.list";
	}
	
	@RequestMapping(value = "authority/list")
	public String authorityList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "empNo") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String enabled,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();

		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enabled", enabled);
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.authorityDataCount(map);
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

		List<Insa> list = service.listAuthority(map);

		String query = "";
		String listUrl = cp + "/insa/authority/list";

		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (enabled.length() != 0) {
			if (query.length() != 0)
				query = query + "&enabled=" + enabled;
			else
				query = "enabled=" + enabled;
		}

		if (query.length() != 0) {
			listUrl = listUrl + "?" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("enabled", enabled);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".insa.authorityList";
	}
	
	@RequestMapping(value = "authority/detail")
	public String authorityDetail(@RequestParam String empNo, Model model) throws Exception {
		Insa dto = service.readAuthority(empNo);
		Insa employeeState = service.readEmployeeState(empNo);
		List<Insa> listState = service.listEmployeeState(empNo);

		model.addAttribute("dto", dto);
		model.addAttribute("employeeState", employeeState);
		model.addAttribute("listState", listState);

		return "insa/authorityDetail";
	}

	@RequestMapping(value = "authority/updateEmployeeState", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateInsaState(Insa dto) throws Exception {

		String state = "true";
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("empNo", dto.getEmpNo());
			if (dto.getStateCode() == 0) {
				map.put("enabled", 1);
			} else {
				map.put("enabled", 0);
			}
			service.updateEmployeeEnabled(map);

			service.insertEmployeeState(dto);

			if (dto.getStateCode() == 0) {
				service.updateFailureCountReset(dto.getEmpNo());
			}
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	

	
}



