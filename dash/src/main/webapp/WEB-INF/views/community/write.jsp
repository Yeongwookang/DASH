<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
function check() {
    const f = document.communityForm;
	
	if($('#open').is(':checked') == true){
		$('#open').attr("value", "1");
	} else {
		$('#open').attr("value", "0");
	}
	
	str = f.categoryNum.value;
	if(str == ""){
		alert("게시글 유형을 선택하세요.");
		return;
	}
	console.log(str);	
    str = f.subject.value.trim();
    if(!str) {
        alert("게시글 제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert("게시글 내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/community/${mode}";
    f.submit(); 
}
</script>

<div class="card mt-5 mb-5 p-5 m-auto">
	<div class="text-start fs-3 mb-4 ps-4"> 
		<span>
		| 커뮤니티
		</span>
	</div>
	<div class="m-auto ps-5 pe-5 mt-4" style="width: 80%;">
		<div class="box p-2"> 
			* DASH의 사내 커뮤니티는 일반 익명 게시판과는 다릅니다. 단순 직원끼리 이야기를 나누는 익명게시판으로도 이용할 수 있지만 <span class="point">인사팀이나 경영진과의 소통</span>을 할 수 있습니다.<br>
			* 양식을 <span class="point">모두</span> 작성해 주세요.<br>
			* 작성 완료한 내용은 <span class="point">수정, 삭제</span>할 수 없습니다.<br>
			* 개인적인 내용이나 특정인을 지칭하는 내용이 있을 경우 게시글을 비공개 해주세요.<br>
			* 민감하거나 부적절한 내용의 게시물은 기업에 의해 비공개로 전환될 수 있습니다. 
		</div>
		<br>
		<form name="communityForm" method="post">
			<div class="d-flex justify-content-end">
				<div class="form-check form-switch">
				  <input class="form-check-input" type="checkbox" role="switch" id="open" name="open" value="${dto.open}">
				  <label class="form-check-label" for="open">게시글 비공개</label> 
				</div>
			</div> 
			<br> 
			<select name="categoryNum" id="categoryNum" class="form-select" style="width: 100%">
				<option value="" ${dto.categoryNum==""?"selected='selected'":""}>유형을 선택해주세요</option>  
				<option value="1" ${dto.categoryNum=="1"?"selected='selected'":""}>조직 문화에 대해 제안합니다.</option>
				<option value="2" ${dto.categoryNum=="2"?"selected='selected'":""}>복지 문화에 대해 제안합니다.</option>
				<option value="3" ${dto.categoryNum=="3"?"selected='selected'":""}>부당한 대우에 대해 신고합니다.</option>
				<option value="4" ${dto.categoryNum=="4"?"selected='selected'":""}>근무환경에 대해 제안합니다.</option>
				<option value="5" ${dto.categoryNum=="5"?"selected='selected'":""}>경영진에게 제안합니다.</option>
				<option value="6" ${dto.categoryNum=="6"?"selected='selected'":""}>기타 의견을 제안합니다.</option>
			</select>
			<br><br>
			<input name="subject" type="text"  class="form-control" placeholder="제목을 입력해 주세요. ex) 회의 분위기가 너무 무거워요." value="${dto.subject}" ${mode=="update" ? "readonly='readonly' ":""}>  
			<br><br>
			<textarea name="content" id="content" class="form-control" cols="10" placeholder="내용을 입력해 주세요. ex) 단체 회의 분위기가 조금은 경직된 것 같아요. 다같이 좋은 아이디어를 낼 수 있도록 조금은 부드러운 분위기를 만들어 주세요." style="height: 150px;" ${mode=="update" ? "readonly='readonly' ":""}>${dto.content}</textarea>
			<br> 
			<table class="table table-borderless">
				<tr>
					<td class="text-center"> 
						<div class="mt-4 mb-4 d-flex justify-content-center">
							<div class="me-3">  
								<button class="btn button-point text-white" type="button" onclick="check();">${mode=='update'?'수정':'등록'}&nbsp;<i class="bi bi-check-all"></i></button>
							</div> 
							<div class="me-3"> 
								<button class="btn button-main bg-gradient" type="reset">다시입력&nbsp;<i class="bi bi-arrow-clockwise"></i></button>
							</div>
							<div> 
								<button class="btn button-main bg-gradient" type="button" onclick="location.href='${pageContext.request.contextPath}/community/main';">등록취소&nbsp;<i class="bi bi-x"></i></button>
							</div>
						</div>
						<c:if test="${mode=='update'}">
							<input type="hidden" name="num" value="${dto.num}">
							<input type="hidden" name="page" value="${page}">
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
