package com.sp.app.marker;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service("marker.markerService")
public class MarkerServiceImpl implements MarkerService {

	@Override
	public List<Marker> listMarker() {
List<Marker> list = new ArrayList<Marker>();
		
		list.add(new Marker(1, "홍대입구역", "서울특별시 마포구 양화로 지하 160", "(우) 04050,  지번 (동교동 165)", "water.png", 37.557714093880406, 126.92450981105797));
		list.add(new Marker(2, "쌍용 강북 교육센터", "서울특별시 마포구 월드컵북로 21", "(우) 04001, 지번 (서교동 447-5)", "water.png", 37.55667974381328, 126.919460553798));
		list.add(new Marker(3, "홍대 걷고 싶은 거리", "서울특별시 마포구 어울마당로 145-3", "", "water.png", 37.55603167890089, 126.92416962522091));
		list.add(new Marker(4, "스타벅스 동교점", "서울특별시 마포구 월드컵북로 22", "", "water.png", 37.5569870957061, 126.91996779571745));
		list.add(new Marker(5, "써브웨이", "서울특별시 마포구 홍익로 10", "", "water.png", 37.55397680326557, 126.92361246688213));
		list.add(new Marker(6, "버거킹", "서울특별시 마포구 양화로 100", "", "water.png", 37.55293196670794, 126.918533985681));
		list.add(new Marker(7, "CGV 홍대", "서울특별시 마포구 양화로 153", "", "water.png", 37.556653112500015, 126.9225996668823));
		list.add(new Marker(8, "롯데시네마 홍대입구", "서울특별시 마포구 양화로 176", "", "water.png", 37.55742630505454, 126.92495708241894));
		list.add(new Marker(9, "IBK기업은행 홍대역지점", "서울특별시 마포구 양화로 148", "", "water.png", 37.55578630413002, 126.92253713947953));
		list.add(new Marker(10, "신한은행 서교동지점", "서울특별시 마포구 월드컵북로 35", "", "water.png", 37.557657467440116, 126.91832070702293));
		
		return list;
	}

	@Override
	public List<Marker> listMarker(String keyword) {
		List<Marker> searchList = new ArrayList<Marker>();

		List<Marker> list = listMarker();
		for (Marker dto : list) {
			if (dto.getSubject().indexOf(keyword) >= 0 || dto.getAddr().indexOf(keyword) >= 0) {
				searchList.add(dto);
			}
		}

		return searchList;
	}
}
