<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.dialog-receiver-list {
	height: 200px;
	overflow-y: scroll;
}
.dialog-receiver-list ul, .dialog-receiver-list li {
	list-style: none;
	padding: 0;
}

.receiver-user {
	color: #0d58ba;
	margin-right: 3px;
	cursor: pointer;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
$(function(){
    $("button[role='tab']").on("click", function(e){
		let tab = $(this).attr("data-tab");
		if(tab === "send") {
			return false;
		}		
		let url = "${pageContext.request.contextPath}/message/receive/main";
		location.href=url;
    });
});

function sendOk() {
	const f = document.messageForm;
	let str;

	if($("#forms-receiver-list input[name=receivers]").length === 0) {
		alert("받는 사람을 추가하세요.");
		return;
	}

	str = f.content.value.trim();
	if(!str) {
		alert("내용을 입력하세요.");
		f.content.focus();
		return;
	}

	f.action="${pageContext.request.contextPath}/message/write";

	f.submit();
}
</script>

<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/emplyoee/login";
}

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
				alert("요청 처리가 실패했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	$(".btnReceiverDialog").click(function(){
		$("#condition").val("name");
		$("#keyword").val("");
		$(".dialog-receiver-list ul").empty();
		
		$("#myDialogModal").modal("show");
	});
	
	// 대화상자 - 받는사람 검색 버튼
	$(".btnReceiverFind").click(function(){
		let condition = $("#condition").val();
		let keyword = $("#keyword").val();
		if(! keyword) {
			$("#keyword").focus();
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/message/listEmployee"; 
		let query = "condition="+condition+"&keyword="+encodeURIComponent(keyword);
		
		const fn = function(data){
			$(".dialog-receiver-list ul").empty();
			console.log(data.listEmployee);
			searchListEmployee(data);
		};
		ajaxFun(url, "get", query, "json", fn);
	});
	
	function searchListEmployee(data) {
		let s;
		for(let i=0; i<data.listEmployee.length; i++) {
			let empNo = data.listEmployee[i].empNo;
			let name = data.listEmployee[i].name;
			let depName = data.listEmployee[i].depName;
			let rankName = data.listEmployee[i].rankName;
			let posName = data.listEmployee[i].posName;
			
			s = "<li><input type='checkbox' class='form-check-input' data-empNo='"+empNo+"' title='"+empNo+"'> <span>"+ empNo + "&nbsp;" + name + "</span></li>";
			$(".dialog-receiver-list ul").append(s);
		}
	}
	
	// 대화상자-받는 사람 추가 버튼
	$(".btnAdd").click(function(){
		let len1 = $(".dialog-receiver-list ul input[type=checkbox]:checked").length;
		let len2 = $("#forms-receiver-list input[name=receivers]").length;
		
		if(len1 === 0) {
			alert("추가할 사람을 먼저 선택하세요.");
			return false;			
		}
		
		if(len1 + len2 >= 5) {
			alert("받는 사람은 최대 5명까지만 가능합니다.");
			return false;
		}
		
		var b, empNo, name, s;

		b = false;
		$(".dialog-receiver-list ul input[type=checkbox]:checked").each(function(){
			empNo = $(this).attr("data-empNo");
			name = $(this).next("span").text();
			
			$("#forms-receiver-list input[name=receivers]").each(function(){
				if($(this).val() === empNo) {
					b = true;
					return false;
				}
			});
			
			if(! b) {
				s = "<span class='receiver-user btn border px-1 ps-2 pe-2' style='color:black'>"+name+" <i class='fa-solid fa-xmark' data-empNo='"+empNo+"'></i></span>";
				$(".forms-receiver-name").append(s);
				
				s = "<input type='hidden' name='receivers' value='"+empNo+"'>";
				$("#forms-receiver-list").append(s);
			}
		});
		
		$("#myDialogModal").modal("hide");
	});
	
	$(".btnClose").click(function(){
		$("#myDialogModal").modal("hide");
	});
	
	$("body").on("click", ".fa-xmark", function(){
		let empNo = $(this).attr("data-empNo");
		
		$(this).parent().remove();
		$("#forms-receiver-list input[name=receivers]").each(function(){
			let receiver = $(this).val();
			if(empNo === receiver) {
				$(this).remove();
				return false;
			}
		});
		
	});

});
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
				<button class="nav-link active" id="tab-send" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="send" aria-selected="true" data-tab="send" style="color: black;">보낸 쪽지함</button>
			</li>
		</ul>
		
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active mt-3" id="nav-content" role="tabpanel" aria-labelledby="nav-tab-content">
			
				<form name="messageForm" method="post">
					<table class="table write-form">
						<tr>
							<td class="col-sm-2" scope="row">수신자</td>
							<td>
								<div class="row mt-4"> 
									<div class="col-auto pe-0">
										<button type="button" class="btn btnReceiverDialog">+ 추가</button>
									</div>
									<div class="col">
										<div class="forms-receiver-name"></div>
									</div>
								</div>
								<small class="form-control-plaintext">한번에 보낼수 있는 최대 인원은 5명입니다.</small>
							</td>
						</tr>
	        
						<tr>
							<td class="col-sm-2" scope="row">내 용</td>
							<td>
								<textarea name="content" id="content" class="form-control">${dto.content}</textarea>
							</td>
						</tr>
						
					</table>
					
					<table class="table table-borderless">
	 					<tr>
							<td class="text-center">
								<button type="button" class="btn btn-main" onclick="sendOk();">보내기&nbsp;<i class="bi bi-check-all"></i></button>
								<button type="reset" class="btn btn-sub">다시입력&nbsp;<i class="bi bi-arrow-clockwise"></i></button>
								<button type="button" class="btn btn-sub" onclick="location.href='${pageContext.request.contextPath}/message/send/main';">취소&nbsp;<i class="bi bi-x"></i></button>
								<div id="forms-receiver-list"></div>
							</td>
						</tr>
					</table>
				</form>			
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
				<h5 class="modal-title" id="myDialogModalLabel">받는 사람</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-auto p-1">
						<select name="condition" id="condition" class="form-select">
							<option value="name">이름</option>
							<option value="empNo">사원번호</option>
							<option value="depName">부서</option>
							<option value="rankName">직급</option>
							<option value="posName">직책</option>
						</select>
					</div>
					<div class="col-auto p-1">
						<input type="text" name="keyword" id="keyword" class="form-control">
					</div>
					<div class="col-auto p-1">
						<button type="button" class="btn btn-sub btnReceiverFind"> <i class="bi bi-search"></i> </button>
					</div>				
				</div>
				<div class="row p-1">
					<div class="border p-1 dialog-receiver-list">
						<ul></ul>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-main btnAdd">추가</button>
				<button type="button" class="btn btn-sub btnClose">닫기</button>
			</div>			
		</div>
	</div>
</div>