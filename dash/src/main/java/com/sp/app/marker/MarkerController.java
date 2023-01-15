package com.sp.app.marker;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller("marker.markerController")
@RequestMapping("/marker*")
public class MarkerController {

	@Autowired
	private MarkerService service;

	@RequestMapping(value = "main")
	public String main() {

		return ".map.marker";
	}

	@RequestMapping(value = "regions")
	@ResponseBody
	public Map<String, Object> regions(@RequestParam(defaultValue = "") String keyword) throws Exception {

		// 지도를 표시할 리전
		List<Marker> list = null;

		if (keyword.length() == 0) {
			list = service.listMarker();
		} else {
			list = service.listMarker(keyword);
		}

		Map<String, Object> model = new HashMap<String, Object>();

		model.put("list", list);

		return model;
	}

	@RequestMapping(value = "map1", method = RequestMethod.GET)
	public String map1() throws Exception {
		// 간단한 지도 만들기 및 마커 찍기
		return "map/map1";
	}

	@RequestMapping(value = "map2", method = RequestMethod.GET)
	public String map2() throws Exception {
		// 클릭한 위치에 마커 찍기
		return "map/map2";
	}

	@RequestMapping(value = "map3", method = RequestMethod.GET)
	public String map3(Model model) throws Exception {
		// 여러개 마커 및 이벤트 등록

		model.addAttribute("latitude", 37.557714093880406); // 래터튜드(위도)
		model.addAttribute("longitude", 126.92450981105797); // 란저튜드(경도)

		return "map/map3";
	}

	@RequestMapping(value = "map4", method = RequestMethod.GET)
	public String map4(Model model) throws Exception {
		// 여러개 마커 및 이벤트 등록

		model.addAttribute("latitude", 37.557714093880406);
		model.addAttribute("longitude", 126.92450981105797);

		return "map/map4";
	}

	@RequestMapping(value = "map5", method = RequestMethod.GET)
	public String map5(Model model) throws Exception {
		// 커스텀 오버레이

		return "map/map5";
	}

	@RequestMapping(value = "map6", method = RequestMethod.GET)
	public String map6(Model model) throws Exception {
		// 주소로 장소 표시

		return "map/map6";
	}

	@RequestMapping(value = "map7", method = RequestMethod.GET)
	public String map7(Model model) throws Exception {
		// 주소로 장소 표시 - 커스텀 오버레이

		return "map/map7";
	}

	@RequestMapping(value = "map8", method = RequestMethod.GET)
	public String map8(Model model) throws Exception {
		// 검색
		return "map/map8";
	}

	@RequestMapping(value = "map9", method = RequestMethod.GET)
	public String map9(Model model) throws Exception {
		// 카카오 키워드 검색
		return "map/map9";

	}
}
