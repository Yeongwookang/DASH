<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="d-flex justify-content-between align-items-center p-2" >
	<a class="navbar-brand" href="${pageContext.request.contextPath}"><img
		src="${pageContext.request.contextPath}/resources/images/logo_pink.png"
		class="logo mt-3 mb-3" style="width: 150px;"> </a>
	<div class="ps-3">
		<c:if test="${sessionScope.employee.imageFilename != null}">
			<a class="icon"><img class="rounded-circle"
				style="width: 2.5rem; height: 2.5rem;"
				src="${pageContext.request.contextPath}/uploads/photo/${sessionScope.employee.imageFilename}"></a>
		</c:if>
		<c:if test="${sessionScope.employee.imageFilename == null}">
			<a class="icon"><img class="rounded-circle"
				style="width: 2.5rem; height: 2.5rem;"
				src="${pageContext.request.contextPath}/resources/images/profile2.png"></a>
		</c:if> 
		<span class="dep me-4">${sessionScope.employee.depName}&nbsp;${sessionScope.employee.name}</span>
		<a class="icon me-4" title="쪽지" href="${pageContext.request.contextPath}/message/receive/main"><i class="fa-regular fa-envelope fa-lg"></i></a>
		<a class="icon" href="${pageContext.request.contextPath}/employee/logout"
			title="로그아웃"><i class="fa-solid fa-arrow-right-from-bracket fa-lg"></i></a>
	</div>
</div>

