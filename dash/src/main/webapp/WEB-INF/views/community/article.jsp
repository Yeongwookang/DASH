<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/employee/login";
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
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	$("body").on("click", ".btnSendLike", function(){
		let num = "${dto.num}";
		let bbsLike = $(this).attr("data-like");
		const $btn = $(this);
		
		let msg = "게시글에 비공감하시겠습니까 ?";
		if(bbsLike === "1"){
			msg = "게시글에 공감하시겠습니까 ?"; 
		}
		
		if(! confirm(msg)){
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/community/insertCommunityLike";
		let query = "num=" + num + "&bbsLike=" + bbsLike;
		
		const fn = function(data){
			let state = data.state;
			if(state === "true") {
				let likeCount = data.likeCount;
				let disLikeCount = data.disLikeCount;
				 
				$btn.parent("td").children().eq(0).find("span").html(likeCount);
				$btn.parent("td").children().eq(1).find("span").html(disLikeCount);
				
			} else if(state === "liked") {
				alert("게시글 공감 여부는 한번만 가능합니다.");
			} else {
				alert("게시글 공감 여부 처리에 실패했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

$(function(){
	$(".btnSendReply").click(function(){
		let num = "${dto.num}";
		const $tb = $(this).closest("table");
		
		let content = $tb.find("textarea").val().trim();
		if(! content){
			$tb.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		let url = "${pageContext.request.contextPath}/community/insertReply";
		let query = "num=" + num + "&content=" + content + "&answer=0";
		
		const fn = function(data){
			$tb.find("textarea").val("");
			
			let state = data.state;
			if(state === "true"){
				listPage(1);
			} else if(state === "false"){
				alert("댓글 추가에 실패했습니다.");
			}
		}
		
		ajaxFun(url, "post", query, "json", fn);
		
	});
});

$(function(){
	listPage(1);
});

function listPage(page){
	let url = "${pageContext.request.contextPath}/community/listReply";
	let query = "num=${dto.num}&pageNo=" + page;
	let selector = "#listReply";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
	
}

$(function(){
	$("body").on("click", ".reply-dropdown", function(){
		const $menu = $(this).next(".reply-menu");
		if($menu.is(':visible')){
			$menu.fadeOut(100);
		} else {
			$(".reply-menu").hide();
			$menu.fadeIn(100);
			
			let pos = $(this).offset();
			$menu.offset( {left:pos.left-70, top:pos.top+20} );
		}
	});
	
	$("body").on("click", function(){
		if($(event.target.parentNode).hasClass("reply-dropdown")){
			return false;
		}
		$(".reply-menu").hide();
	});
});

$(function(){
	$("body").on("click", ".deleteReply", function(){
		if(! confirm("댓글을 삭제하시겠습니까 ?")){
			return false;
		}
		
		let replyNum = $(this).attr("data-replyNum");
		let page = $(this).attr("data-pageNo");
		
		let url = "${pageContext.request.contextPath}/community/deleteReply";
		let query = "replyNum=" + replyNum + "&mode=reply";
		
		const fn = function(data){
			listPage(page);
		}
		
		ajaxFun(url, "post", query, "json", fn);
		
	});
});

function countReplyAnswer(answer){
	let url = "${pageContext.request.contextPath}/community/countReplyAnswer";
	let query = "answer=" + answer;
	
	const fn = function(data){
		let count = data.count;
		let selector = "#answerCount" + answer;
		$(selector).html(count);
	};
	
	ajaxFun(url, "post", query, "json", fn);
	
}


function listReplyAnswer(answer){
	let url = "${pageContext.request.contextPath}/community/listReplyAnswer";
	let query = "answer=" + answer;
	let selector = "#listReplyAnswer" + answer;
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
	
}

$(function(){
	$("body").on("click", ".btnReplyAnswerLayout", function(){
		const $tr = $(this).closest("tr").next();
		
		let isVisible = $tr.is(":visible");
		let replyNum = $(this).attr("data-replyNum");
		
		if(isVisible){
			$tr.hide();
		} else {
			$tr.show();
			
			listReplyAnswer(replyNum);
			countReplyAnswer(replyNum);
		}
		
	});
});

$(function(){
	$("body").on("click", ".btnSendReplyAnswer", function(){
		let num = "${dto.num}";
		let replyNum = $(this).attr("data-replyNum");
		const $td = $(this).closest("td");
		
		let content = $td.find("textarea").val().trim();
		if(! content) {
			$td.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		let url = "${pageContext.request.contextPath}/community/insertReply";
		let query = "num=" + num + "&content=" + content + "&answer=" + replyNum;
		
		const fn = function(data){
			$td.find("textarea").val("");
			
			var state = data.state;
			if(state === "true") {
				listReplyAnswer(replyNum);
				countReplyAnswer(replyNum);
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
		
	});
});

$(function(){
	$("body").on("click", ".deleteReplyAnswer", function(){
		if(! confirm("대댓글을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		let replyNum = $(this).attr("data-replyNum");
		let answer = $(this).attr("data-answer");
		
		let url = "${pageContext.request.contextPath}/community/deleteReply";
		let query = "replyNum=" + replyNum + "&mode=answer";
		
		const fn = function(data){
			listReplyAnswer(answer);
			countReplyAnswer(answer);
		};
		
		ajaxFun(url, "post", query, "json", fn);
		
	});
});
</script>

<div class="scroll m-auto" style="height: 85%; width:90%; overflow-y:scroll;">
	<div class="text-start fs-4 mb-4">
		<span>
			<button type="button" class="btn text-white" onclick="location.href='${pageContext.request.contextPath}/community/main?${query}';"><img src="${pageContext.request.contextPath}/resources/images/left2.png" style="width: 18px;"></button>
		</span>
	</div>
	<table class="table community-article"> 
		<thead>
			<tr>
				<td colspan="2" align="left" style="border: none;"> 
					<div class="communitySubject2 pt-3 ps-3"><span class="categoryName">[${dto.categoryName}]</span>&nbsp;${dto.subject}</div>
				</td>
			</tr>
		</thead>		
		<tbody>
			<tr class="border-bottom"> 
				<td align="left"> 
					<span class="date pe-1 ps-3">
						<c:if test="${dto.replyDepCount != 0 }">
							<span class="answer-complete p-1">답변 완료</span>&nbsp;&nbsp;
						</c:if>
						<i class="fa-regular fa-message"></i>&nbsp;${dto.replyCount}&nbsp;&nbsp;&nbsp;&nbsp;${dto.reg_date}
					</span>
					<br>
				</td>
			</tr>				
			<tr>
				<td colspan="2" valign="top" height="200" class="pt-3 pb-3 px-3 ps-4"> 
					${dto.content} 
				</td> 
			</tr>
			
			<tr>   
				<td colspan="2" class="text-center p-3" style="border: none;">    
					<button type="button" class="btn btn-Point btnSendLike" data-like='1' title="좋아요"><i class="fa-solid fa-thumbs-up"></i>&nbsp;&nbsp;<span>${likeCount}</span></button> 
					<button type="button" class="btn btn-Point btnSendLike" data-like='0' title="싫어요"><i class="fa-solid fa-thumbs-down"></i>&nbsp;&nbsp;<span>${disLikeCount}</span></button>
				</td>
			</tr>
		</tbody>
	</table>	
	
	<div class="reply">
		<form name="replyForm" method="post"> 
			<div class='form-header'>
				<span class="bold ms-1">댓글</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가해 주세요.</span>
			</div> 
			
			<table class="table table-borderless reply-form">
				<tr>
					<td align="center">
						<textarea class='form-control' name="content"></textarea>
					</td>
				</tr>
				<tr>
				    <td align='right'>
				        <c:if test="${sessionScope.employee.depNo == 1}"> 
				        	<button type='button' class='btn button-main btnSendReply me-2 mt-2'>댓글 등록</button>   
				        	<button type='button' class='btn button-main me-2 mt-2' onclick="location.href='${pageContext.request.contextPath}/community/update?num=${dto.num}&page=${page}'">수정</button> 
				        </c:if>
				        <c:if test="${sessionScope.employee.depNo != 1}">
				        	<button type='button' class='btn button-main btnSendReply me-3 mt-2'>댓글 등록</button>
				        </c:if>
				    </td>
				 </tr>
			</table>
		</form>
		<div id="listReply"></div> 
	</div>
</div>