package com.sp.app.security;

import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.sp.app.employee.Employee;
import com.sp.app.employee.EmployeeService;
import com.sp.app.employee.SessionInfo;


public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	
	@Autowired
	private EmployeeService service;
	
	private String defaultUrl;
	
	private RequestCache requestCache = new HttpSessionRequestCache(); // 로그인 전 상태를 가지고 있는 객체
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy(); // 리다이렉트를 위한 객체
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		// 세션에 로그인 유저 정보 저장
		HttpSession session = request.getSession();
		
		Employee employee = service.readEmployee(authentication.getName());
		
		SessionInfo info = new SessionInfo();
		info.setEmpNo(employee.getEmpNo());
		info.setName(employee.getName());
		info.setPosNo(employee.getPosNo());
		info.setDepNo(employee.getDepNo());
		info.setDepName(employee.getDepName()); 
		
		session.setAttribute("employee", info);
		
		// 패스워드 변경이 90일 이상인 경우 패스워드 변경 창으로 이동
		try {
			Date endDate = new Date();
			long gap;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date modifyDate = sdf.parse(employee.getModify_date());
			gap = (endDate.getTime() - modifyDate.getTime()) / (24*60*60*1000);
			
			if(gap >= 90) {
				String targetUrl = "/employee/updatePwd";
				redirectStrategy.sendRedirect(request, response, targetUrl);
				return;
			}
		} catch (Exception e) {
		}
		
		// redirect 설정
		resultRedirectStrategy(request, response, authentication);
	}
	
	protected void resultRedirectStrategy(HttpServletRequest request, 
			HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		if(savedRequest != null) {
			// 로그인이 되지 않은 상태에서 권한이 필요한 페이지에 접근한 경우
			String targetUrl = savedRequest.getRedirectUrl();
			redirectStrategy.sendRedirect(request, response, targetUrl);
		} else {
			// 직접 로그인 주소를 클릭한 경우
			redirectStrategy.sendRedirect(request, response, defaultUrl);
		}
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

}
