<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.table .ellipsis {
	position: relative;
	min-width: 200px;
}
.table .ellipsis span {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	position: absolute;
	left: 85px;
	right: 9px;
	cursor: pointer;
}
.table .ellipsis:before {
	content: '';
	display: inline-block;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<style type="text/css">
.reply-form textarea {
	height: 130px;
}
</style>

<script type="text/javascript">
$(function(){
	let menu = "${menuItem}";
	$("#tab-"+menu).addClass("active");
	
    $("button[role='tab']").on("click", function(e){
		const tab = $(this).attr("data-tab");
		let url = "${pageContext.request.contextPath}/message/"+tab+"/main";
		location.href = url;
    });
});

$(function(){
	$(".btnReplyNote").click(function(){
		$("#myDialogModal").modal("show");
	});

	$(".btnSendOk").click(function(){
		const f = document.replyForm;
		if(!f.content.value) {
			alert("내용을 입력하세요.");
			f.content.focus();
			return false;
		}
		
		$("#myDialogModal").modal("hide");
		
		f.action = "${pageContext.request.contextPath}/message/write";
		f.submit();
	});
});

function deleteNote() {
	let query = "nums=${dto.num}&${query}";
	let url = "${pageContext.request.contextPath}/message/${menuItem}/delete?" + query;

	if(confirm("쪽지를 삭제하시겠습니까 ? ")) {
		location.href = url;
	}
}
</script>

<div>
	<div class="title mt-4">
		<span>쪽지</span>
	</div>
	<div class="m-auto mt-4">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-receive" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="receive" aria-selected="true" data-tab="receive" style="color: black;">받은 쪽지함</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-send" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="send" aria-selected="true" data-tab="send" style="color: black;">보낸 쪽지함</button>
			</li>
		</ul>
			
		<div class="tab-content pt-2" id="nav-tabContent">
			<div class="tab-pane fade show active mt-3" id="nav-content" role="tabpanel" aria-labelledby="nav-tab-content">
			
				<c:if test="${menuItem=='receive'}">
					<table class="table table-borderless mb-0">
						<tr>
							<td align="right" width="50%">
									<button type="button" class="btn btn-sub btnReplyNote" >답장</button>
							</td>
						</tr>
					</table>
				</c:if>
				
				<table class="table mb-0">
					<tr class="border-top2">
						<td colspan="2" align="left">
							<c:choose>
								<c:when test="${menuItem=='receive'}">
									발신자 : ${dto.senderName}(${dto.senderEmpNo})
								</c:when>
								<c:when test="${menuItem=='send'}">
									수신자 : ${dto.receiverName}(${dto.receiverEmpNo})
								</c:when>
							</c:choose>
						</td>
					</tr>
					
					<tr>
						<td width="50%">
							<c:choose>
								<c:when test="${menuItem=='receive'}">
									수신 날짜 : ${dto.sendDay}
								</c:when>
								<c:when test="${menuItem=='send'}">
									발신 날짜 : ${dto.sendDay}
								</c:when>
							</c:choose>
						</td>
						<td align="right">
							읽은날짜 : ${empty dto.identifyDay ? "읽지 않음": dto.identifyDay}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="170">
							${dto.content}
						</td>
					</tr>

				</table>
				
				<table class="table table-borderless mt-3">
					<tr>
						<td width="50%">
					    	<button type="button" class="btn btn-sub" onclick="deleteNote();">삭제</button>
						</td>
						<td class="text-end">
							<button type="button" class="btn btn-sub" onclick="location.href='${pageContext.request.contextPath}/message/${menuItem}/main';">돌아가기</button>
						</td>
					</tr> 
				</table>
			
			</div>
		</div>		
		
	</div>
</div>

<div class="modal fade" id="myDialogModal" tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="myDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myDialogModalLabel">답장</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form name="replyForm" method="post">
					<div class="row reply-form m-1">
						<textarea name="content" class="form-control"></textarea>
						<input type="hidden" name="receivers" value="${dto.senderEmpNo}">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-main btnSendOk">작성</button>
				<button type="button" class="btn btn-sub btnSendCancel" data-bs-dismiss="modal">취소</button>
			</div>			
		</div>
	</div>
</div>