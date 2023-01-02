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
		| 커뮤니티
		</span>
	</div>
	<div class="mt-4"> 
		<table class="table table-hover board-list">
			<thead class="bg-sub"> 
					<tr class="text-center">
						<th style="width: 10%">순번</th>
						<th class="text-start ps-5" style="width: 40%">제목</th> 
						<th style="width: 10%">작성자</th> 
						<th style="width: 10%">조회수</th> 
						<th style="width: 10%">작성일</th>
						<th style="width: 5%"></th>
					</tr>
			</thead>
			<tbody>
					
				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr class="text-center">  
						<td class="align-middle">${dataCount - (page-1) * size - status.index}</td>
						<td class="subject ps-5 align-middle text-start">
							<a href="${articleUrl}&num=${dto.num}" class="text-reset underline">${dto.subject}</a>
						</td>
						<td class="align-middle">${dto.depName}&nbsp;${dto.name}</td>
						<td class="align-middle">${dto.hitCount}</td>
						<td class="align-middle date">${dto.reg_date}</td>
						<td class="align-middle">
							<a href="${articleUrl}&num=${dto.num}" class="text-reset"><img src="${pageContext.request.contextPath}/resources/images/right2.png" style="width: 10px;"></a>
						</td>
					</tr>
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


