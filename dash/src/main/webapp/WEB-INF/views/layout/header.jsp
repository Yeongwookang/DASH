<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<header> 
	<div class="d-flex justify-content-between align-items-center">
		<span class="font">
			${dayOfWeek}
			<br> 
			<span class="cal">${msg}</span>
		</span>
		<div class="me-4">
			<a class="icon"><i class="fa-regular fa-bell"></i></a>
			<a class="icon"><img src="${pageContext.request.contextPath}/resources/images/profile2.png" class="profile"></a>
			<span class="dep">경영지원</span> 
			<a class="down"><i class="fa-solid fa-angle-down"></i></a>
			<a href="${pageContext.request.contextPath}/member/logout" title="로그아웃" class="icon"><i class="fa-solid fa-arrow-right-from-bracket"></i></a>
		</div>
	</div> 
</header>
