<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row d-flex justify-content-center">
	<div class="row" style="margin-top: 5.5rem">
		<img src="${pageContext.request.contextPath}/resources/images/mainLogo.png" class="logo" style="object-fit:contain;">
	</div>
	<div class="row mt-4 ms-5">
			<ul style="list-style: none" class="nav text-start mt-4 flex-column " >
				<li class="nav-item">
					<button class="btn nav-box" onclick="location.href='${pageContext.request.contextPath}/'"><i class="fa-lg fa-regular fa-clipboard"></i><span class="ms-3"> 메인</span></button>
				</li>
				<li class="nav-item">
					<button class="btn nav-box" onclick="location.href='${pageContext.request.contextPath}/approval/main';"><i class="fa-lg fa-regular fa-folder"></i><span class="ms-3">결재</span></button>
				</li>
				<li class="nav-item">
					<button class="btn nav-box" onclick="#"><i class="fa-lg fa-regular fa-note-sticky"></i><span class="ms-3"> 공지</span></button>
				</li>
				<li class="nav-item">
					<button class="btn nav-box" onclick="location.href='${pageContext.request.contextPath}/insa/main'"><i class="fa-lg bi bi-person-rolodex"></i><span class="ms-3">인사</span></button>
				</li>
				<li>
				<div class="dropdown dropend nav-item">
					<button class="btn dropdown-toggle nav-box" type="button" id="kickboardMenu" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="fa-solid fa-broom-ball"></i><span class="ms-3">운영</span>
					</button>	
				<ul class="dropdown-menu" aria-labelledby="kickboardMenu">
					<li class="dropdown-item ">
						<a class="nav-box text-black" href="${pageContext.request.contextPath}/register/main"><i class="fa-regular fa-square-plus"></i><span> 신규 등록</span></a>
					</li>
					<li class="dropdown-item">
						<a class="nav-box text-black" href="${pageContext.request.contextPath}/stationmanage/main"><i class="fa-solid fa-charging-station"></i><span> 대여소·충전소 관리</span></a>
					</li>
					<li class="dropdown-item">
						<a class="nav-box text-black" href="${pageContext.request.contextPath}/kickmanage/main"><i class="bi bi-speedometer"></i><span> 킥보드 관리</span></a>
					</li>
				</ul>
				</div>
				</li>
			</ul>
	</div>
</div>

	<script type="text/javascript">
		$(".logo").click(function(){
			location.href="${pageContext.request.contextPath}/";
		});
	</script>