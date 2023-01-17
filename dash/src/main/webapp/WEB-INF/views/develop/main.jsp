<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
</script>


<div class="m-auto  card mt-5 mb-5 p-4">
<div class="text-start fs-4 ml-2 mb-4">
	<span>| 유지보수</span>
</div>
	<div class="mx-5">
		<div class="col-6 text-center">
			<form class="row" name="searchForm"
				action="${pageContext.request.contextPath}/develop/main"
				method="post">
				<div class="col-auto p-1">
					<select name="condition" class="form-select">
						<option selected value="all">검색</option>
						<option value="signNum"
							${condition=="signNum"?"selected='selected'":""}>결재번호</option>
						<option value="title"
							${condition=="title"?"selected='selected'":""}>제목</option>
						<option value="name"
							${condition=="name"?"selected='selected'":""}>작성자</option>
						<option value="reg_date"
							${condition=="reg_date"?"selected='selected'":""}>등록일</option>
					</select>
				</div>
				<div class="col-auto p-1">
					<input type="text" name="keyword" value="${keyword}" class="form-control">
				</div>
				<div class="col-auto p-1">
					<button type="button" class="btn btn-light" onclick="searchList()">
						<i class="bi bi-search"></i>
					</button>
				</div>
				<div class="col">
					<button type="button" class="btn btn-light"
						onclick="location.href='${pageContext.request.contextPath}/develop/main';">새로고침</button>
				</div>
			</form>
		</div>

		<table class="table table text-center mt-3">
			<thead>
				<tr>
					<th scope="col">구분</th>
					<th scope="col">결재번호</th>
					<th scope="col">제목</th>
					<th scope="col">부서</th>
					<th scope="col">기안자</th>
					<th scope="col">요청일</th>
					<th scope="col">상세내용</th>
					<th scope="col">진행상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto" varStatus="status">
					<tr>
						<th>${status.count}</th>
						<td class="signNum">${dto.signNum}</td>
						<td class="title">${dto.title}</td>
						<td class="dep">${dto.depName}</td>
						<td class="name">${dto.name}</td>
						<td class="reg_date">${dto.reg_date}</td>
						<td>
							<button type="button" class="btn btn-primary sendList read-btn" data-signNum="${dto.signNum}">내용확인</button>
						</td>
						<td><c:choose>
								<c:when test="${dto.state == 0 }">기안</c:when>
								<c:when test="${dto.state < dto.max_state && dto.state == 1 }">1차 승인</c:when>
								<c:when test="${dto.state < dto.max_state && dto.state == 2 }">2차 승인</c:when>
								<c:when test="${dto.state< dto.max_state }">결재 완료</c:when>
								<c:otherwise>문의</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>



<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div>
					<div class="modal-body">
						<table class="table">
							<tbody>
								<tr>
									<td class="w-25 text-center  align-middle" scope="row"><h4>제목</h4></td>
									<td class="w-75 read-title"></td>
								</tr>

								<tr>
									<td class="w-25 text-center align-middle" scope="row"><h4>부서</h4></td>
									<td class="w-75 read-depName">
									</td>
								</tr>
								
								<tr>
									<td class="w-25 text-center align-middle" scope="row"><h4>기안자</h4></td>
									<td class="w-75 read-name">
									</td>
								</tr>

								<tr>
									<td class="w-25 text-center align-middle" scope="row"><h4></h4></td>
									<td class="w-75 read-reg_date">
									</td>
								</tr>
								
								<tr>
									<td class="text-center align-middle" scope="row"><h4>결재라인</h4></td>
									<td class="d-flex "></td>
								</tr>

							</tbody>
						</table>
						<div class="form-control m-auto mb-4 read-content" style="min-height: 400px;"></div>
					</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary dtn-shortcuts">바로가기</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
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
				alert('요청 처리가 실패 했습니다.');
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}


$(function(){
	$(".read-btn").click(function(){
		let signNum = $(this).attr("data-signNum");
		
		let url = "${pageContext.request.contextPath}/develop/read"
		let query = "signNum="+signNum;
		
		const fn = function(data){
			let title = data.dto.title;
			let depName = data.dto.depName;
			let name = data.dto.name;
			let reg_date = data.dto.reg_date;
			let content = data.dto.content;
			
			$("#staticBackdrop .read-title").html(title);
			$("#staticBackdrop .read-depName").html(content);
			$("#staticBackdrop .read-name").html(content);
			$("#staticBackdrop .read-reg_date").html(content);
			$("#staticBackdrop .read-content").html(content);
			
			$("#staticBackdrop .dtn-shortcuts").attr("data-signNum", signNum);
			$("#staticBackdrop").modal("show");
		};
		ajaxFun(url, "get", query, "json", fn)
		
	});
});


// 대화상자-바로가기
$(function(){
	$(".dtn-shortcuts").click(function(){
		let signNum = $(this).attr("data-signNum");
		
		let url = "${pageContext.request.contextPath}/approval/read/"+signNum;
		location.href=url;
	});
});

</script>


