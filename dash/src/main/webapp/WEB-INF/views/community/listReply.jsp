<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class='reply-info mb-2 ms-1'>
	<span class='reply-count'>댓글 ${replyCount}개</span>
	<span>[목록, ${pageNo}/${total_page} 페이지]</span>
</div>


<c:forEach var="vo" items="${listReplyTop}">
	<table class='table table-reply border' style="height: 180px;" >
		<tr class="important-background" >
			<td colspan='2' valign='top' class="ps-4 pt-4 date" style="padding-bottom: 0px; border-style: none;">
				<span class="important">기업 답변</span>&nbsp;&nbsp;|&nbsp;&nbsp;${vo.reg_date}
			</td>
		</tr>
		<tr class="important-background" >
			<td align='right' valign="top" style="border-style: none;"> 
				<div align="left" class="ps-3">${vo.content}</div>
				<br>
			</td>
		</tr>
	</table>
</c:forEach> 

<c:forEach var="vo" items="${listReply}">
	<table class='table table-reply border'>
		<tr>
			<td width='50%' style="border-style: none;">
				<div class='row reply-writer'>
					<div class='col-1 d-flex'>
						<img class="rounded-circle ms-4 mt-2" style="width:4rem; height: 4rem;" src="${pageContext.request.contextPath}/resources/images/profile2.png" >
						<div class="ms-4 mt-4">${vo.content}</div>
					</div>
				</div>
			</td>
			<c:if test="${sessionScope.employee.empNo == vo.empNo || sessionScope.employee.depNo ==  1}">
				<td width='50%' align='right' class='align-middle' style="border-style: none;">
					<span class='reply-dropdown me-4'><i class='bi bi-three-dots-vertical'></i></span>
					<div class="reply-menu">
						<div class='deleteReply reply-menu-item' data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</div>
					</div>
				</td>
			</c:if>
		</tr>
		<tr style="border-style: none;">
			<td colspan='2' valign='top' class="ps-4 date" style="border-style: none;">
				${vo.reg_date}&nbsp;&nbsp;
				<button type='button' class='btn btnReplyAnswerLayout mb-1' data-replyNum='${vo.replyNum}'>대댓글&nbsp;&nbsp;<span id="answerCount${vo.replyNum}">${vo.answerCount}개</span></button>		
			</td>
		</tr>
	
	    <tr class='reply-answer' style="border-style: none;"> 
	        <td colspan='2' style="border-style: none;">
	        	<div>
		            <div id='listReplyAnswer${vo.replyNum}' class='answer-list'></div>
		            <div class="pt-2 pe-3"> 
		                <textarea class="form-control m-2" style="height: 100px;"></textarea>  
		            </div>
					<div class='text-end pe-2 pb-1 mt-2'>
						<button type='button' class='btn btn-sub btnSendReplyAnswer' data-replyNum='${vo.replyNum}'>답글 등록</button>
		            </div> 
	            </div>
			</td>
	    </tr>
	</table>
</c:forEach>
<br>
<div class="page-navigation">
	${paging}
</div>			
