package com.sp.app.approval;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.sp.app.common.dao.CommonDAO;

public class ApprovalServiceImpl implements ApprovalService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertApproval(Approval dto) throws Exception {
		try {
			dao.insertData("approval.insertApproval", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateApproval(Approval dto) throws Exception {
		try {
			dao.insertData("approval.updateApproval", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteApproval(long signNum) throws Exception {
		try {
			dao.insertData("approval.deleteApproval", signNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Approval readApproval(long signNum) {
		Approval dto = null;
		
		try {
			dto = dao.selectOne("approval.readApproval");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Approval> ListApproval(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
