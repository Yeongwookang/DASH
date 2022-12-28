<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
function sendOk() {
    const f = document.noticeForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/notice/${mode}";
    f.submit();
}

<c:if test="${mode=='update'}">
	function deleteFile(fileNum) {
		let url = "${pageContext.request.contextPath}/notice/deleteFile";
		$.post(url, {fileNum:fileNum}, function(data){
			$("#f"+fileNum).remove();
		}, "json");
	}
</c:if>
</script>

<div class="scroll m-auto" style="height: 85%; width:90%; overflow-y:scroll;">
	<div class="text-start fs-4 mb-4">
		<span>
		| 공지사항
		<c:if test="${mode=='write'}"> 작성</c:if> 
		</span>
	</div>
	<form name="noticeForm" method="post" enctype="multipart/form-data" 
		onsubmit="return submitContents(this);">
		<table class="table border write-form mt-5">
			<tr>
				<td class="table-light col-sm-2 text-center" scope="row">제 목</td>
				<td>
					<input type="text" name="subject" class="form-control" value="${dto.subject}">
				</td>
			</tr>
			<tr> 
				<td class="table-light col-sm-2 text-center" scope="row">중요 여부</td>
				<td class="py-3 text-start">
					<input type="checkbox" name="notice" id="notice" class="form-check-input" value="1" ${dto.notice== 1 ? "checked='checked' ":"" } >
					<label class="form-check-label" for="notice">&nbsp;중요</label>
				</td> 
			</tr> 
			<tr>
				<td class="table-light col-sm-2 text-center" scope="row">작성자</td>
				<td class="text-start">
					<c:if test="${sessionScope.employee.depNo == 1}">경영지원팀 ${sessionScope.employee.name}</c:if>
					<c:if test="${sessionScope.employee.depNo == 2}">운영팀 ${sessionScope.employee.name}</c:if>
					<c:if test="${sessionScope.employee.depNo == 3}">기획팀 ${sessionScope.employee.name}</c:if>
					<c:if test="${sessionScope.employee.depNo == 4}">개발팀 ${sessionScope.employee.name}</c:if>
				</td>
			</tr>
			<tr>
				<td class="table-light col-sm-2 text-center" scope="row">내 용</td> 
				<td>
					<textarea name="content" class="form-control" style="width: 100%; height: 275px;">${dto.content}</textarea>
				</td>
			</tr>
			
			<tr>
				<td class="table-light col-sm-2 text-center">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
				<td> 
					<input type="file" name="selectFile" class="form-control">
				</td>
			</tr> 
			<c:if test="${mode=='update'}"> 
				<tr>
					<td class="table-light col-sm-2 text-center" scope="row">첨부된 파일</td>
					<td>  
						<p class="form-control-plaintext">
							<c:if test="${not empty dto.saveFilename}">
								<a href="javascript:deleteFile('${dto.num}');"> <i class="fa-solid fa-trash fa-lg"></i> </a>
								${dto.originalFilename}
							</c:if> 
							&nbsp;
						</p>
					</td>
				</tr>
			</c:if>
		</table>
		
		<table class="table table-borderless">
				<tr>
				<td class="text-center"> 
					<div class="mt-4 mb-4 d-flex justify-content-center">
						<div class="me-3">  
							<button class="btn bg-sub bg-point text-white" type="submit">${mode=='update'?'수정':'등록'}&nbsp;<i class="bi bi-check-all"></i></button>
						</div> 
						<div class="me-3"> 
							<button class="btn bg-sub bg-gradient" type="reset">다시입력&nbsp;<i class="bi bi-arrow-clockwise"></i></button>
						</div>
						<div> 
							<button class="btn bg-sub bg-gradient" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/main';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
						</div>
					</div>
					<button type="submit" class="btn text-white bold">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
					<button type="reset" class="btn basic text-white">다시입력</button>
					<button type="button" class="btn basic text-white" onclick="location.href='${pageContext.request.contextPath}/notice/main';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
					<c:if test="${mode=='update'}">
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="page" value="${page}">
						<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
						<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
						<input type="hidden" name="fileSize" value="${dto.fileSize}"> 
					</c:if>
				</td>
			</tr>
		</table>
	</form>
</div>
	
	