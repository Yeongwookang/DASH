package com.sp.app.security;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.sp.app.employee.Employee;
import com.sp.app.employee.EmployeeService;

public class LoginFailureHandler implements AuthenticationFailureHandler {
	
	@Autowired
	private EmployeeService service;
	
	private String defaultFailureUrl;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String empNo = request.getParameter("empNo");
		
		String s = "아이디 또는 패스워드가 일치하지 않습니다.";
		
		try {
			if(exception instanceof BadCredentialsException) {
				// 패스워드가 일치 하지 않는 경우
				
				// 실패 횟수 누적
				service.updateFailureCount(empNo);
				int count = service.checkFailureCount(empNo);
				
				if(count >= 5) {
					// 계정 비활성화
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("enabled", 0);
					map.put("empNo", empNo);
					service.updateEmployeeEnabled(map);
					
					// 계정 비활성화 상태 저장
					Employee dto = new Employee();
					dto.setEmpNo(empNo);
					dto.setRegisterEmpNo(empNo);
					dto.setStateCode(1); // 패스워드 틀려서 누적 : 1
					dto.setMemo("패스워드 5회 이상 실패");
					service.insertEmployeeState(dto);
				}
			} else if(exception instanceof InternalAuthenticationServiceException) {
				// 존재하지 않는 아이디
			} else if(exception instanceof DisabledException) {
				// 인증 거부 : enabled=0
				s = "계정이 비활성화 되었습니다. 관리자에게 문의하세요.";
			}
		} catch (Exception e) {
		}
		
		request.setAttribute("message", s);
		
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
		
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}
	
	
	
}
