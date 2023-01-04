<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="vo" items="${listReplyAnswer}">
	<div class='m-1'>
		<div class='row p-1'>
			<div class='col-auto'>
				<div class='row reply-writer'>
					<div class='col-1' style="margin-left: 70px;"><i class="fa-solid fa-l fa-2x"></i></div>
					<div class='col ms-2 align-self-center'> 
						<div class='p-2'>
							${vo.content}
						</div>
					</div>
				</div>
			</div>
			<c:if test="${sessionScope.employee.empNo == vo.empNo || sessionScope.employee.depNo ==  1}">
				<div class='col align-self-center text-end'>
					<span class='reply-dropdown me-4'><i class='bi bi-three-dots-vertical'></i></span>
					<div class='reply-menu'>
						<div class='deleteReplyAnswer reply-menu-item' data-replyNum='${vo.replyNum}' data-answer='${vo.answer}'>삭제</div>		
					</div>
				</div>
			</c:if>
		</div>
		<div class='date' style="margin-left: 100px; border: none;"> 
			&nbsp;&nbsp;&nbsp;${vo.reg_date}
		</div>
	</div>
</c:forEach>
