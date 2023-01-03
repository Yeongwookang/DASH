package com.sp.app.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("community.communityService")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertCommunity(Community dto) throws Exception {
		try {
			dao.insertData("community.insertCommunity", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("community.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Community> listCommunity(Map<String, Object> map) {
		List<Community> list = null;
		
		try {
			list = dao.selectList("community.listCommunity", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	

}
