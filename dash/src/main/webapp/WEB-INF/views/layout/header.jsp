<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<div class="d-flex justify-content-between align-items-center h-100" style="width: 90%">
		<div class="ps-3 align-middle">
			<p class="m-0" style="font-weight: 700; font-size: 21px">${dayOfWeek}</p>
			<p class="m-0 text-start" style="font-weight: 500; font-size: 14px; color: #787878">${msg}</p>
		</div>
		<div class="pe-3">
			<a class="icon" ><i class="fa-regular fa-bell"></i></a>
			<a class="icon"><img class="rounded-circle" style="width:2rem; height: 2rem;" src="${pageContext.request.contextPath}/resources/images/profile2.png" ></a>
			<span>경영지원</span> 
			<a class="icon"><i class="fa-solid fa-angle-down"></i></a>
			<a class="icon" href="${pageContext.request.contextPath}/member/logout" title="로그아웃" ><i class="fa-solid fa-arrow-right-from-bracket"></i></a>
		</div>
	</div>

