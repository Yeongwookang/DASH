package com.sp.app.develop;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("develop.developService")
public class DevelopServiceImpl implements DevelopService {
	@Autowired
	private CommonDAO dao;


	@Override
	public List<Develop> approvalList(Map<String, Object> map) {
		List<Develop> list = null;

		try {
			list = dao.selectList("develop.approvalList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	@Override
	public Develop readApproval(long signNum) {
		Develop dto = null;
		
		try {
			dto = dao.selectOne("develop.readApproval", signNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	

	@Override
	public List<Develop> fileList(long signNum) {
		List<Develop> list = null;
		try {
			list = dao.selectList("develop.fileList", signNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Develop readFile(long fileNum) {
		Develop dto = null;
		try {
			dto = dao.selectOne("develop.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public void approveUpdate(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("develop.approveUpdate", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void approve(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("develop.approve", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("develop.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

	
}
