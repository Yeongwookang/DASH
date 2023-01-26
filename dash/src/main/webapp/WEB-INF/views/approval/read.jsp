<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div>
	<div class="mt-4 title">
		<span>결재</span>
		<hr class="mt-4 mb-4" style="border: solid 1px;">
	</div>
	<div>
		<form name="approval" method="POST" action="${pageContext.request.contextPath}/approval/write" enctype="multipart/form-data">
				<div class="mb-4">
				<div class="d-flex align-items-center">
					<div class="w-25 p-2 text-white text-center bg-main fs-4 fw-bold">제목</div>
					<div class="w-75 fs-5 ms-3 me-3">${dto.title }</div>
				</div>
				<div class="d-flex align-items-center">
					<div class="w-25 p-2  text-white text-center bg-main fs-4 fw-bold">기안자</div>
					<div class="w-75 ms-3 me-3"> ${dto.depName}&nbsp;${dto.name}
						 <input name= "empNo" type="hidden" value="${dto.empNo}" >
					</div>
				</div>
				<div class="d-flex align-items-center">
					<div class="w-25 p-2  text-white text-center bg-main fs-4 fw-bold">타임라인</div>
					<div class="d-flex w-75 ms-3 me-3">
						<input type="text" class="form-control" name="tlName" value="${tldto.tlName}" readonly>
						<button type="button" class="btn btn-main ms-2" data-bs-toggle="modal" data-bs-target="#timeLine"><i class="fa-solid fa-magnifying-glass"></i></button>
						<input type="hidden" name="tlNum" value="${tldto.tlNum}">
						<input type="hidden" name="max_state" value="${tldto.max_state}">
						<input type="hidden" name="empNo" value="${tldto.empNo}">
					</div>
				</div>
				<div class="d-flex align-items-center">
					<div class="w-25 p-2  text-white text-center bg-main fs-4 fw-bold">참 조</div>
					<div class="w-75 ms-3 me-3">
						<div class="d-flex">
						<input type="text" class="form-control me-2" id="ref1name" value="${ref1.depName}&nbsp;${ref1.name}" readonly>
						<input type="text" class="form-control me-2" id="ref2name" value="${ref2.depName}&nbsp;${ref2.name}" readonly>
						<input type="text" class="form-control" id="ref3name" value="${ref3.depName}&nbsp;${ref3.name}" readonly>
						<input type="hidden" class="form-control me-2" name="ref1" value="${dto.ref1}" readonly>
						<input type="hidden" class="form-control me-2" name="ref2" value="${dto.ref2}" readonly>
						<input type="hidden" class="form-control me-2" name="ref3" value="${dto.ref3}" readonly>
						</div>
					</div>
				</div>
				</div>
			<div class="form-control m-auto mb-4" style="min-height: 400px; ">${dto.content}</div>
			</form>
			<c:if test="${not empty fileList }">
				<div><h4>파일</h4></div>
				<c:forEach var="file" items="${fileList}" varStatus="status" >
					<div class=" d-flex form-control mb-2 justify-content-between">
						<div><button class="btn" type="button" onclick="location.href='${pageContext.request.contextPath}/approval/download/${file.fileNum}'"><i class="fa-solid fa-floppy-disk"></i> ${file.originalFilename} (${file.fileSize/1000} kb)</button></div> 
					</div>
				</c:forEach>
			</c:if>
			
		<hr class="mt-4 mb-4" style="border: solid 1px;">
		<div class="d-flex justify-content-end mt-4">
			<c:if test="${sessionScope.employee.empNo == dto.empNo && dto.state < 1}">
				<button class="btn btn-sub bg-gradient me-2" type="button" onclick="location.href='${pageContext.request.contextPath}/approval/update/${dto.signNum}'">수정</button>
				<button class="btn btn-main bg-gradient me-2" type="button" onclick="location.href='${pageContext.request.contextPath}/approval/delete/${dto.signNum}'">삭제</button>
			</c:if>
			<form method="POST" name="approve">
				<input type="hidden" value="${dto.state}" name="state">
				<input type="hidden" value="${dto.signNum}" name="signNum">			
			<c:if test="${sessionScope.employee.empNo == dto.ref1 || sessionScope.employee.empNo == dto.ref2 || sessionScope.employee.empNo == dto.ref3}">
				<button class="btn btn-sub bg-gradient me-2" type="button" onclick="reject();">반려</button>
				<button class="btn btn-main bg-gradient me-2" type="button" onclick="approve();">결재</button>
			</c:if>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
function approve(){
	const f = document.approve;
	f.action = "${pageContext.request.contextPath}/approval/approve";
	
	f.submit();
}

function reject(){
	const f = document.approve;
	f.action = "${pageContext.request.contextPath}/approval/reject";
	
	f.submit();
}
</script>


