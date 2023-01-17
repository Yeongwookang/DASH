package com.sp.app.mypage;

import java.util.List;
import java.util.Map;



public interface MypageService {
	public void updateMypage(Mypage dto, String pathname) throws Exception;
	public List<Mypage> listemployee (Map<String, Object> map);
}
