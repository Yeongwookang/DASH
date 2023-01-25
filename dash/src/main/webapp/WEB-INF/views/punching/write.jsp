<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
function check() {
    const f = document.vacationForm;
	let str;
	
    str = f.gainQty.value.trim();
    if(!str) {
        alert("획득일수를 입력하세요.");
        f.subject.focus();
        return;
    }
    
    str = f.expireDate.value.trim();
    if(!str) {
        alert("만료일을 입력하세요.");
        f.expireDate.focus();
        return;
    }

    str = editor.getData().trim();
	if( !str || str === "<p><br></p>" ) {
		alert("사유를 입력하세요.");
		f.content.focus();
		return false;
	}

    f.action = "${pageContext.request.contextPath}/punching/${mode}";
    f.submit(); 
}
</script>

<div>
	<div class="title mt-4">
		<span>특별휴가</span>
	</div>
	<div class="m-auto mt-4">
		<form name="vacationForm" method="post">
			<table class="table"> 
				<tr>
					<td class="w-25 text-center align-middle" scope="row">획득일수</td>
					<td class="w-75">
						<input name="gainQty" type="number" class="form-control" min="1" max="30"> 
					</td>
				</tr>
				<tr>
					<td class="w-25 text-center align-middle" scope="row">만료일</td>
					<td class="w-75">
						<input class="form-control" type="date" name="expireDate">
					</td>
				</tr>
				<tr>
					<td class="w-25 text-center align-middle" scope="row">사유</td>
					<td class="w-75">
						<textarea name="content" id="ir1" class="form-control" style="width: 95%; height: 270px;" ></textarea>
					</td>
				</tr>
			
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
								<button class="btn btn-sub bg-gradient" type="button" onclick="location.href='${pageContext.request.contextPath}/punching/write';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							</div>
						</div>
						
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
