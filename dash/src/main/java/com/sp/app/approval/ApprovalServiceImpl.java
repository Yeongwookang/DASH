package com.sp.app.approval;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;
import com.sp.app.employee.Employee;

@Service("approval.approvalService")
public class ApprovalServiceImpl implements ApprovalService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertApproval(Map<String,Object>map) throws Exception {
		try {
			dao.insertData("approval.insertApproval", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateApproval(Map<String,Object>map) throws Exception {
		try {
			dao.insertData("approval.updateApproval", map);
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
		int result = 0;
		
		try {
			result = dao.selectOne("approval.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Approval> approvalList(Map<String, Object> map) {
		List<Approval> list = null;
		
		try {
			list = dao.selectList("approval.approvalList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Employee> empList(Map<String, Object> map) {
		
		List<Employee> empList = null;
		
		try {
			empList = dao.selectList("approval.empList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return empList;
	}

	@Override
	public List<Approval> myApprovalList(Map<String, Object> map) {
		List<Approval> list = null;
		
		try {
			list = dao.selectList("approval.myApprovalList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}