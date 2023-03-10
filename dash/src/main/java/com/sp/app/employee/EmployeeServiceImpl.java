package com.sp.app.employee;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("employee.employeeService") 
public class EmployeeServiceImpl implements EmployeeService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	@Override
	public Employee loginEmployee(String empNo) {
		Employee dto = null;
		
		try {
			dto = dao.selectOne("employee.loginEmployee", empNo);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return dto;
	}

	@Override
	public void insertEmployee(Employee dto) throws Exception {
		try {
			// 사원정보 저장
			dao.insertData("employee.insertEmployee", dto);

			// 권한저장
			dto.setAuthority("ROLE_USER");
			dao.insertData("employee.insertAuthority", dto);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
	}	
	

	@Override
	public void updateLastLogin(String empNo) throws Exception {
		try {
			dao.updateData("employee.updateLastLogin", empNo);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void updateEmployee(Employee dto) throws Exception {

		try {
			dao.updateData("employee.updateMember", dto);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
	}
		

	@Override
	public Employee readEmployee(String empNo) {
		Employee dto = null;
		
		try {
			dto = dao.selectOne("employee.readEmployee", empNo);
			
			if(dto != null) {
				if(dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}
				
				if(dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}
			
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return dto;
	}

	@Override
	public void deleteEmployee(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("employee.deleteMember", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
	}
	
	@Override
	public Employee readMain(String empNo) throws Exception {
		Employee dto = null;
		
		try {
			dto = dao.selectOne("employee.readMain", empNo);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return dto;
	}

	@Override
	public void generatePwd(Employee dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean isPasswordCheck(String empNo, String pwd) {
		Employee dto = readEmployee(empNo);
		
		if(dto == null) {
			return false;
		}
		
		return bcrypt.matches(pwd, dto.getPwd());
	}

	@Override
	public void updatePwd(Employee dto) throws Exception {
		try {
			if(isPasswordCheck(dto.getEmpNo(), dto.getPwd())) {
				throw new RuntimeException("패스워드가 기존 패스워드와 일치합니다.");
			}
			
			String encPwd = bcrypt.encode(dto.getPwd());
			dto.setPwd(encPwd);
			
			dao.updateData("employee.updateEmployee1", dto);
			
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public int checkFailureCount(String empNo) {
		int count = 0;
		
		try {
			count = dao.selectOne("employee.checkFailureCount", empNo);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return count;
	}

	@Override
	public void updateFailureCount(String empNo) throws Exception {
		try {
			dao.updateData("employee.updateFailureCount", empNo);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void updateFailureCountReset(String empNo) throws Exception {
		try {
			dao.updateData("employee.updateFailureCountReset", empNo);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void updateEmployeeEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("employee.updateEmployeeEnabled", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void insertEmployeeState(Employee dto) throws Exception {
		try {
			dao.insertData("employee.insertEmployeeState", dto);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
	}

	@Override
	public List<Employee> adminEmpNo() {
		List<Employee> list = null;
		
		try {
			list = dao.selectList("employee.adminEmpNo");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	


	
	

}
