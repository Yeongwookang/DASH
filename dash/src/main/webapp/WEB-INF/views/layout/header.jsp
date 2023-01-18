<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="d-flex justify-content-between align-items-center p-2">
	<a class="navbar-brand ps-5" href="${pageContext.request.contextPath}"><img
		src="${pageContext.request.contextPath}/resources/images/logo_2.png"
		class="logo" style="width: 200px"> </a>
	<div class="ps-3 pe-5">
		<c:if test="${sessionScope.employee.imageFilename != null}">
			<a class="icon"><img class="rounded-circle"
				style="width: 2rem; height: 2rem;"
				src="${pageContext.request.contextPath}/uploads/photo/${sessionScope.employee.imageFilename}"></a>
		</c:if>
		<c:if test="${sessionScope.employee.imageFilename == null}">
			<a class="icon"><img class="rounded-circle"
				style="width: 2rem; height: 2rem;"
				src="${pageContext.request.contextPath}/resources/images/profile2.png"></a>
		</c:if> 
		<span class="dep me-4"><a class="aTag" href="${pageContext.request.contextPath}/mypage/main">${sessionScope.employee.depName}&nbsp;${sessionScope.employee.name}</a></span>
		<a class="icon me-4" title="알림설정"><i class="fa-regular fa-bell"></i></a> <a
			class="icon"
			href="${pageContext.request.contextPath}/employee/logout"
			title="로그아웃"><i class="fa-solid fa-arrow-right-from-bracket"></i></a>
	</div>
</div>

