package com.sp.app.develop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("develop.developService")
public class DevelopServiceImpl implements DevelopService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Develop> list() {
		List<Develop> list = null;
		
		try {
			list = dao.selectList("develop.mydeptList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Develop readDevelop(String depName) {
		// 내용확인 누르면 모달창에 내용이 나옴 
		Develop dto = null;
		
		try {
			dto = dao.selectOne("develop.mydeptList", depName);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
