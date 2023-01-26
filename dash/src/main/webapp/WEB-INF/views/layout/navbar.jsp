<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<nav class="navbar navbar-expand-lg bg-main">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul style="list-style: none" class="navbar-nav m-auto">
			<li class="nav-item">
				<a class="nav-link nav-box"
					href="${pageContext.request.contextPath}/">
					<i class="fa-lg fa-regular fa-clipboard"></i><span class="ms-3">
						메인</span>
				</a>
			</li>
			
			<li class="dropdown nav-item">
				<a class="nav-link dropdown-toggle nav-box" id="approvalMenu" 
					data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fa-lg fa-regular fa-folder"></i><span class="ms-3">결재</span></a>
				<ul class="dropdown-menu" aria-labelledby="approvalMenu">
					<li class="dropdown-item"><a
						href="${pageContext.request.contextPath}/approval/main?page=1">
						<span> 결재관리</span></a></li>
					<li class="dropdown-item"><a
						href="${pageContext.request.contextPath}/approval/timeline"><span> 타임라인관리</span></a></li>
				</ul>
			</li>
			<li class="nav-item">
				<a class="nav-link nav-box"
					href="${pageContext.request.contextPath}/notice/main">
					<i class="fa-lg fa-regular fa-note-sticky"></i><span class="ms-3">
						공지</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link nav-box"
					href="${pageContext.request.contextPath}/community/main">
					<i class="fa-solid fa-bullhorn"></i><span class="ms-3">
						커뮤니티</span>
				</a>
			</li>
			
			<c:if test="${sessionScope.employee.depNo==1}">
			<li class= "dropdown nav-item">
				<a class="nav-link dropdown-toggle nav-box"
					id="insaMenu" data-bs-toggle="dropdown"
					aria-expanded="false">
					<i class="bi bi-people-fill"></i><span class="ms-3">인사</span></a>
				<ul class="dropdown-menu" aria-labelledby="insaMenu">
					<li class="dropdown-item"><a
						href="${pageContext.request.contextPath}/insa/main">
						<span> 사원 관리</span></a></li>
					<li class="dropdown-item"><a
						href="${pageContext.request.contextPath}/punching/main"><span> 연차 관리</span></a></li>
						
					<c:if test="${sessionScope.employee.adminEmpNo == sessionScope.employee.empNo}">
						<li class="dropdown-item"><a
						href="${pageContext.request.contextPath}/insa/authority/list">
						<span> 권한 관리</span></a></li>
					</c:if>
				</ul>
			</li>
			</c:if>
					

			<c:if test="${sessionScope.employee.depNo==2}">
				<li class="nav-item">
				<a class="nav-link nav-box"
					href="${pageContext.request.contextPath}/analysis/main">
					<i class="fa-lg fa-solid fa-chart-simple"></i><span class="ms-3">통계</span>
				</a>
				</li>
				<li class= "dropdown nav-item">
						<a class="nav-link dropdown-toggle nav-box"
							id="kickboardMenu" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa-solid fa-charging-station"></i><span class="ms-3">운영</span>
						</a>
						<ul class="dropdown-menu" aria-labelledby="kickboardMenu">
							<li class="dropdown-item"><a
								href="${pageContext.request.contextPath}/stationmanage/main">
								<span> 대여소·충전소 관리</span></a></li>
							<li class="dropdown-item"><a
								href="${pageContext.request.contextPath}/kickmanage/main"><span> 킥보드 관리</span></a></li>
						</ul>
				</li>
			</c:if>
			
			<c:if test="${sessionScope.employee.depNo==3}">
				<li class="nav-item">
				<a class="nav-link nav-box"
					href="${pageContext.request.contextPath}/analysis/main">
					<i class="fa-lg fa-solid fa-chart-simple"></i><span class="ms-3">통계</span>
				</a>
				</li>
				<li class="nav-item">
					<a class="nav-link nav-box"
						href="${pageContext.request.contextPath}/map/main">
						<i class="fa-solid fa-map-location-dot"></i><span class="ms-3">추천</span> 
					</a>
				</li>
				<li class="dropdown nav-item">
				<a class="nav-link dropdown-toggle nav-box" id="approvalMenu" 
					data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fa-lg fa-regular fa-folder"></i><span class="ms-3">추천 순위</span></a>
				<ul class="dropdown-menu" aria-labelledby="approvalMenu">
					<li class="dropdown-item"><a
						href="${pageContext.request.contextPath}/map/6/allDetail">
						<span> 종합</span></a></li>
					<li class="dropdown-item"><a
						href="${pageContext.request.contextPath}/map/6/trafficDetail"><span> 유동인구</span></a></li>
					<li class="dropdown-item"><a
						href="${pageContext.request.contextPath}/map/6/bikeDetail"><span> 따릉이</span></a></li>
				</ul>
			</li>
			</c:if>
			<c:if test="${sessionScope.employee.depNo==4}">
				<li class="nav-item">
					<a class="nav-link nav-box"
						href="${pageContext.request.contextPath}/develop/main">
						<i class="bi bi-gear-fill"></i><span class="ms-3">요청사항 관리</span>
					</a>
				</li>
			</c:if>
		</ul>
    </div>
  </div>
</nav>