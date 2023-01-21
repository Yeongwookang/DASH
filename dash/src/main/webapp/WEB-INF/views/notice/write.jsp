<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
function check() {
    const f = document.noticeForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("공지사항 제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = editor.getData().trim();
	if( !str || str === "<p><br></p>" ) {
		alert("공지사항 내용을 입력하세요.");
		f.content.focus();
		return false;
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

<div style="margin-top: 5rem;">
	<div class="title mt-4">
		<span>공지사항</span>
	</div>
	<div class="m-auto mt-4">
		<form name="noticeForm" method="post" enctype="multipart/form-data">
			<table class="table"> 
				<tr>
					<td class="w-25 text-center align-middle" scope="row">제 목</td>
					<td class="w-75">
						<input name="subject" type="text"  class="form-control" value="${dto.subject}">
					</td>
				</tr>
				<tr>
					<td class="w-25 text-center align-middle" scope="row">작 성 자</td>
					<td class="w-75">
						<c:if test="${sessionScope.employee.depNo == 1}">경영지원 ${sessionScope.employee.name}</c:if>
						<c:if test="${sessionScope.employee.depNo == 2}">운영 ${sessionScope.employee.name}</c:if>
						<c:if test="${sessionScope.employee.depNo == 3}">기획 ${sessionScope.employee.name}</c:if>
						<c:if test="${sessionScope.employee.depNo == 4}">개발 ${sessionScope.employee.name}</c:if>
					</td>
				</tr>
				<tr>
					<td class="w-25 text-center align-middle" scope="row">중요 여부</td>
					<td class="w-75">
						<input type="checkbox" name="notice" id="notice" class="form-check-input" value="1" ${dto.notice== 1 ? "checked='checked' ":"" } >
						<label class="form-check-label" for="notice">&nbsp;중요</label>
					</td>
				</tr>
				<tr>
					<td class="w-25 text-center align-middle" scope="row">내 용</td>
					<td class="w-75">
						<textarea name="content" id="ir1" class="form-control" style="width: 95%; height: 270px;" >${dto.content}</textarea>
					</td>
				</tr>
				<tr>
					<td class="w-25 text-center align-middle" scope="row">첨 부</td>
					<td class="w-75">
						<input type="file" name="selectFile" multiple="multiple" class="form-control">
					</td>
				</tr>
				
				<c:if test="${mode=='update'}">
					<c:forEach var="vo" items="${listFile}">
						<tr id="f${vo.fileNum}">
							<td class="w-25 text-center align-middle" scope="row">첨부 파일</td>
							<td class="w-75"> 
								<p class="form-control-plaintext">
									${vo.originalFilename}&nbsp;
									<a href="javascript:deleteFile('${vo.fileNum}');" class="preNext"><i class="fa-solid fa-xmark"></i></a>
								</p>
							</td>
						</tr>
					</c:forEach> 
				</c:if>
			</table>
			
			<table class="table table-borderless">
					<tr>
					<td class="text-center"> 
						<div class="mt-4 mb-4 d-flex justify-content-center">
							<div class="me-3">  
								<button class="btn btn-main text-white" type="button" onclick="check();">${mode=='update'?'수정':'등록'}&nbsp;<i class="bi bi-check-all"></i></button>
							</div> 
							<div class="me-3"> 
								<button class="btn btn-sub bg-gradient" type="reset">다시입력&nbsp;<i class="bi bi-arrow-clockwise"></i></button>
							</div>
							<div> 
								<button class="btn btn-sub bg-gradient" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/main';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							</div>
						</div>
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
</div>
	
<script src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/translations/ko.js"></script>
<script>
	var editor;
	ClassicEditor
	.create(document.querySelector("#ir1"),{
	    language: "ko"
	})
	.then( newEditor=>{editor=newEditor;})
	.catch(error=>{
	    console.log(error)
	});
</script>
