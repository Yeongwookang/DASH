<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<header> 
	<div class="d-flex justify-content-between">
		<span class="font">
			${dayOfWeek}
			<br> 
			<span class="cal">${msg}</span>
		</span>
		<div class="header-right">
			<a class="icon"><i class="fa-regular fa-bell"></i></a> 
			<a class="icon"><i class="fa-solid fa-angle-down"></i></a>
			<a href="${pageContext.request.contextPath}/member/logout" title="로그아웃" class="icon"><i class="fa-solid fa-arrow-right-from-bracket"></i></a>
		</div>
	</div> 
</header>
