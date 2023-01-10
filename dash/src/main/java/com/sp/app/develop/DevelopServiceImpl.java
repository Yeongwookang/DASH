package com.sp.app.develop;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.approval.Approval;
import com.sp.app.common.dao.CommonDAO;
import com.sp.app.employee.Employee;

@Service("develop.developService")
public class DevelopServiceImpl implements DevelopService {
	@Autowired
	private CommonDAO dao;

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
	public Approval readApproval(long signNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> refList(long signNum) {
		List<String> refList = new ArrayList<String>();
		try {
			Approval app = dao.selectOne("approval.refList", signNum);
			refList.add(app.getRef1());
			refList.add(app.getRef2());
			refList.add(app.getRef3());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return refList;
	}

	@Override
	public Approval readEmp(String empNo) {
		Approval dto = null;
		try {
			dto = dao.selectOne("approval.readEmp", empNo);
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
	public int myApprovalCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("approval.myApprovalCount", map);
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
	public List<Approval> myApprovalList(Map<String, Object> map) {
		List<Approval> list = null;

		try {
			list = dao.selectList("approval.myApprovalList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Approval> fileList(long signNum) {
		List<Approval> list = null;
		try {
			list = dao.selectList("approval.fileList", signNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Approval readFile(long fileNum) {
		Approval dto = null;
		try {
			dto = dao.selectOne("approval.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public void approveUpdate(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("approval.approveUpdate", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void approve(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("approval.approve", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	
}
