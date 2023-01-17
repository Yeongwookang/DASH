<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="d-flex justify-content-between align-items-center p-2">
	<a class="navbar-brand ps-5" href="${pageContext.request.contextPath}"><img
		src="${pageContext.request.contextPath}/resources/images/mainLogo.png"
		class="logo" style="width: 200px"> </a>
	<div class="ps-3 pe-5">
		<a class="icon" title="알림설정"><img class="rounded-circle"
			style="width: 2rem; height: 2rem;"
			src="${pageContext.request.contextPath}/resources/images/profile2.png"></a>
		<span class="dep">${sessionScope.employee.depName}&nbsp;${sessionScope.employee.name}</span>
		<button type="button" class="btn" data-bs-toggle="modal"
			data-bs-target="#exampleModal">
			<i class="fa-solid fa-angle-down"></i>
		</button>




		<a class="icon me-4"><i class="fa-regular fa-bell"></i></a> <a
			class="icon"
			href="${pageContext.request.contextPath}/employee/logout"
			title="로그아웃"><i class="fa-solid fa-arrow-right-from-bracket"></i></a>
	</div>
</div>




<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	data-bs-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">개인정보수정</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<form class="mt-4" id="mypageForm" name="mypageForm" method="post"
					enctype="multipart/form-data">
					<div class="d-flex justify-content-start">
						<div class="table-form">
							<div class="img-viewer"></div>
							<input type="file" name="imageFilenameFile"
								id="imageFilenameFile" accept="image/*" class="form-control"
								style="display: None;">

						</div>
						<table class="table text-center align-middle"
							style="font-size: 16px;">

							<tr>
								<td class=" col-sm-2" scope="row">사원번호</td>
								<td><input type="text" name="name" class="form-control"
									value="${dto.empNo}">${dto.empNo}</td>
							</tr>
						
						</table>
					</div>
				</form>
				</c:forEach>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn bg-sub"
					onclick="sendOk();">
					등록하기&nbsp;<i class="bi bi-check2"></i>
				</button>
				<button type="button" class="btn btn-light"
					onclick="location.href='${pageContext.request.contextPath}/';">
					등록취소&nbsp;<i class="bi bi-x"></i>
				</button>

			</div>
		</div>
	</div>
</div>


<script>

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data: query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

var url = "${pageContext.request.contextPath}/mypage/list";
var query = null;
var fn = function(data) {
	
}
ajaxFun(url, "get", query, "json", fn);

</script>