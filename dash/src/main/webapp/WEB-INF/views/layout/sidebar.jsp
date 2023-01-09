<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="h-75 ">
	<div class="w-75 m-auto">
		<img
			src="${pageContext.request.contextPath}/resources/images/mainLogo.png"
			class="logo" style="object-fit: contain;">
	</div>
	<div class="mt-5">
		<ul style="list-style: none" class="text-start">
			<li class="nav-item">
				<button class="btn nav-box"
					onclick="location.href='${pageContext.request.contextPath}/'">
					<i class="fa-lg fa-regular fa-clipboard"></i><span class="ms-3">
						메인</span>
				</button>
			</li>
			<li class="nav-item">
				<button class="btn nav-box"
					onclick="location.href='${pageContext.request.contextPath}/marker/main'">
					<i class="bi bi-1-circle"></i><span class="ms-3">마커</span>
				</button>
			</li>
			<li class="nav-item">
				<button class="btn nav-box"
					onclick="location.href='${pageContext.request.contextPath}/map/main'">
					<i class="bi bi-2-circle"></i><span class="ms-3">맵</span>
				</button>
			</li>
			<li class="nav-item">
				<button class="btn nav-box"
					onclick="location.href='${pageContext.request.contextPath}/approval/main?page=1';">
					<i class="fa-lg fa-regular fa-folder"></i><span class="ms-3">결재</span>
				</button>
			</li>
			<li class="nav-item">
				<button class="btn nav-box"
					onclick="location.href='${pageContext.request.contextPath}/notice/main';">
					<i class="fa-lg fa-regular fa-note-sticky"></i><span class="ms-3">
						공지</span>
				</button>
			</li>
			<li class="nav-item">
				<button class="btn nav-box"
					onclick="location.href='${pageContext.request.contextPath}/community/main';">
					<i class="fa-regular fa-address-card"></i><span class="ms-3">
						커뮤니티</span>
				</button>
			</li>
			<li class="nav-item">
				<button class="btn nav-box"
					onclick="location.href='${pageContext.request.contextPath}/analysis/main';">
					<i class="fa-lg fa-solid fa-chart-simple"></i><span class="ms-3">통계</span>
				</button>
			</li>
			<c:if test="${sessionScope.employee.depNo==1}">
				<li class="nav-item">
					<button class="btn nav-box"
						onclick="location.href='${pageContext.request.contextPath}/insa/main'">
						<i class="fa-lg bi bi-person-rolodex"></i><span class="ms-3">인사</span>
					</button>
				</li>
			</c:if>

			<li class="nav-item">
				<button class="btn nav-box"
					onclick="location.href='${pageContext.request.contextPath}/insa/list'">
					<i class="bi bi-person-lines-fill"></i><span class="ms-3">사원현황</span>
				</button>
			</li>

			<c:if test="${sessionScope.employee.depNo==2}">
				<li>
					<div class="dropdown dropend nav-item">
						<button class="btn dropdown-toggle nav-box" type="button"
							id="kickboardMenu" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa-solid fa-broom-ball"></i><span class="ms-3">운영</span>
						</button>
						<ul class="dropdown-menu" aria-labelledby="kickboardMenu">
							<li class="dropdown-item "><a class="nav-box text-black"
								href="${pageContext.request.contextPath}/register/main"><i
									class="fa-regular fa-square-plus"></i><span> 신규 등록</span></a></li>
							<li class="dropdown-item"><a class="nav-box text-black"
								href="${pageContext.request.contextPath}/stationmanage/main"><i
									class="fa-solid fa-charging-station"></i><span> 대여소·충전소
										관리</span></a></li>
							<li class="dropdown-item"><a class="nav-box text-black"
								href="${pageContext.request.contextPath}/kickmanage/main"><i
									class="bi bi-speedometer"></i><span> 킥보드 관리</span></a></li>
						</ul>
					</div>
				</li>
			</c:if>

			<li>
				<div class="dropdown dropend nav-item">
					<button class="btn dropdown-toggle nav-box" type="button" id="map"
						data-bs-toggle="dropdown" aria-expanded="false">
						<i class="bi bi-search"></i><span class="ms-3">추천</span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="map">
						<li class="dropdown-item "><a class="nav-box text-black"
							href="${pageContext.request.contextPath}/map/filter"><span>
									필터</span></a></li>
						<li class="dropdown-item"><a class="nav-box text-black"
							href="${pageContext.request.contextPath}/map/marker"><span>
									마커</span></a></li>
					</ul>
				</div>
			</li>
			




			<c:if test="${sessionScope.employee.depNo==4}">
				<li class="nav-item">
					<button class="btn nav-box"
						onclick="location.href='${pageContext.request.contextPath}/develop/main'">
						<i class="bi bi-gear-fill"></i><span class="ms-3">요청사항 관리</span>
					</button>
				</li>
			</c:if>
		</ul>
	</div>
</div>
<script type="text/javascript">
	$(".logo").click(function() {
		location.href = "${pageContext.request.contextPath}/";
	});
</script>