<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div id="sidebar" class="list-group mt-5">
		<a class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" aria-current="page" href="${pageContext.request.contextPath}/schedule/main">일정관리<span class="badge bg-main rounded-pill">14</span></a>
		<a class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" aria-current="page" href="${pageContext.request.contextPath}/">알림<span class="badge bg-main rounded-pill">14</span></a>
		<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/mypage/main">마이페이지</a>
		<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/insa/list">사원현황</a>
</div>