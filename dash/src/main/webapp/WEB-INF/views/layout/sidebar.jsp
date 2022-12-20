<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row d-flex justify-content-center">
	<div class="row" style="margin-top: 5.5rem">
		<img src="${pageContext.request.contextPath}/resources/images/mainLogo.png" class="logo" style="object-fit:contain;">
	</div>
	<div class="row mt-4" style="width: 85%">
			<ul style="list-style: none" class="nav text-start mt-4 flex-column " >
				<li class="nav-item">
					<a class="nav-box" href="#"><i class="fa-solid fa-grip-vertical"></i><span> 관리 목록</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-box" href="${pageContext.request.contextPath}/approval/main"><i class="fa-regular fa-folder"></i><span> 결재</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-box" href="#"><i class="fa-regular fa-note-sticky"></i><span> 공지</span></a>
				</li>
			</ul>
	</div>
</div>

	<script type="text/javascript">
		$(".logo").click(function(){
			location.href="${pageContext.request.contextPath}/";
		});
	</script>