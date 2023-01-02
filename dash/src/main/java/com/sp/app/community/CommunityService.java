package com.sp.app.community;

import java.util.List;
import java.util.Map;

public interface CommunityService {
	public void insertCommunity(Community dto) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Community> listCommunity(Map<String, Object> map);
}
