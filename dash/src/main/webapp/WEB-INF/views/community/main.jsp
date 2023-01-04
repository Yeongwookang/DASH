<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<div class="scroll m-auto" style="height: 85%; width:90%; overflow-y:scroll;">
	<div class="text-start fs-4 mb-4">
		<span> 
		| 커뮤니티&nbsp;&nbsp;<span class="dataCount">${dataCount}건</span> 
		</span>
	</div>
	<div class="mt-4" align="center"> 
		<table class="table table-hover community-list">
			<tbody>	
				<c:forEach var="dto" items="${list}" varStatus="status">
					<c:if test="${dto.open == 1}">
						<tr class="text-center">  
							<td class="align-middle categoryName">[${dto.categoryName}]</td>
							<c:choose>
								<c:when test="${sessionScope.employee.empNo==dto.empNo || sessionScope.employee.depNo == 1}">
									<td class="align-middle text-start"> 
										<a href="${articleUrl}&num=${dto.num}" class="text-reset underline communitySubject">
											비공개 게시글입니다.&nbsp;<span class="lockIcon"><i class="fa-solid fa-lock"></i></span>
											<c:if test="${dto.replyDepCount != 0 }">
												<span class="answer-complete2 p-1">답변 완료</span>&nbsp;&nbsp;
											</c:if>
											</a>
									</td> 
									<td class="align-middle communityDate">${dto.reg_date}</td>
									<td class="align-middle communityIcon">
										<a href="${articleUrl}&num=${dto.num}" class="text-reset"><img src="${pageContext.request.contextPath}/resources/images/right2.png" style="width: 10px;"></a>
									</td>
								</c:when>
								<c:otherwise>
									<td class="align-middle text-start">
										<a href="#" class="text-reset underline communitySubject">
											비공개 게시글입니다.&nbsp;<span class="lockIcon"><i class="fa-solid fa-lock"></i></span>
											<c:if test="${dto.replyDepCount != 0 }">
												<span class="answer-complete2 p-1">답변 완료</span>&nbsp;&nbsp;
											</c:if>
										</a>
									</td>
									<td class="align-middle communityDate">${dto.reg_date}</td>
									<td class="align-middle communityIcon">
										<a href="#" class="text-reset"><img src="${pageContext.request.contextPath}/resources/images/right2.png" style="width: 10px;"></a>
									</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:if>
					<c:if test="${dto.open == 0}">
						<tr class="text-center">  
							<td class="align-middle categoryName">[${dto.categoryName}]</td>   
							<td class="align-middle text-start">
								<a href="${articleUrl}&num=${dto.num}" class="text-reset underline communitySubject">${dto.subject}</a>&nbsp;&nbsp;
								<c:if test="${dto.replyDepCount != 0 }">
									<span class="answer-complete2 p-1">답변 완료</span>&nbsp;&nbsp;
								</c:if>
								<i class="fa-regular fa-message" id="msg"></i>&nbsp;<span id="msg">${dto.replyCount}</span>
							</td>
							<td class="align-middle communityDate">${dto.reg_date}</td>
							<td class="align-middle communityIcon">
								<a href="${articleUrl}&num=${dto.num}" class="text-reset"><img src="${pageContext.request.contextPath}/resources/images/right2.png" style="width: 10px;"></a>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody> 
		</table>  
		
		<div class="page-navigation paging mt-5 text-center">
			${dataCount == 0 ? "등록된 커뮤니티 게시글이 없습니다." : paging}
		</div> 
	
		<form name="searchForm" action="${pageContext.request.contextPath}/notice/main" method="post" class="mt-5">
			<div class="d-flex justify-content-center m-auto">   		
				<div class="p-1">
					<select name="condition" class="form-select">
						<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
						<option value="name" ${condition=="name"?"selected='selected'":""}>작성자</option>
						<option value="reg_date" ${condition=="reg_date"?"selected='selected'":""}>등록일</option>
						<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
						<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
					</select>
				</div> 
				<div class="p-1">
					<input type="text" name="keyword" value="${keyword}" class="form-control">
				</div>
				<div class="p-1">
					<button type="button" class="btn bg-sub" onclick="searchList()"> <i class="bi bi-search"></i> </button>
				</div>
			</div>
		</form>

		<div class="mt-4 mb-4 d-flex justify-content-end">
			<div> 
				<button class="btn button-main bg-gradient" type="button" onclick="location.href='${pageContext.request.contextPath}/community/write';">작성</button>
			</div> 
		</div>
	</div>
</div>


