<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
<c:if test="${sessionScope.employee.empNo == '8801001'}">
	function deleteOk() {
	    if(confirm("게시글을 삭제하시겠습니까 ? ")) {
		    let query = "num=${dto.num}&${query}";
		    let url = "${pageContext.request.contextPath}/notice/delete?" + query;
	    	location.href = url;
	    }
	}
</c:if>
</script>

<div class="scroll m-auto" style="height: 85%; width:90%; overflow-y:scroll;">
	<div class="text-start fs-4 mb-4">
		<span>
			| 공지사항
		</span>
	</div>
	<table class="table">
		<thead>
			<tr>
				<td colspan="2" align="center">
					<div class="subjectA pt-3">${dto.subject}</div>
				</td>
			</tr>
		</thead>		
		<tbody>
			<tr>
				<td align="left" class="ps-3"> 
					<span class="name">${dto.depName}팀 ${dto.name}</span> 
				</td>
				<td align="right">
					<span class="date pe-1">${dto.reg_date}</span> 
				</td>
			</tr>				
			<tr>
				<td colspan="2" valign="top" height="200" class="pt-3 pb-3 px-3">
					${dto.content}
				</td>
			</tr>
			<c:forEach var="vo" items="${listFile}"> 
				<tr>
					<td colspan="2" class="ps-3">
						<img src="${pageContext.request.contextPath}/resources/images/disk.gif" style="width: 15px;">&nbsp;
						<a href="${pageContext.request.contextPath}/notice/download?fileNum=${vo.fileNum}" class="bg-point-font">${vo.originalFilename}</a>
						(<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> kb) 
					</td>
				</tr> 
			</c:forEach> 
		</tbody>
	</table>	
	<div class="mt-5 ps-3">  
		이전글 : 
		<c:if test="${not empty preReadDto}">
			<a href="${pageContext.request.contextPath}/notice/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
		</c:if>
		<c:if test="${empty preReadDto}">  
			이전 게시글이 존재하지 않습니다. 
		</c:if>
	</div> 

	<div class="mt-4 mb-3 ps-3 next"> 
		다음글 : 
		<c:if test="${not empty nextReadDto}">
			<a href="${pageContext.request.contextPath}/notice/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
		</c:if>		
		<c:if test="${empty nextReadDto}">
			다음 게시글이 존재하지 않습니다.
		</c:if>
	</div>
	
	<table class="table table-borderless">
		<tr>
			<td width="50%">
				
				<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/notice/update?num=${dto.num}&page=${page}';">수정</button>
				
		    	
		    	<button type="button" class="btn btn-light" onclick="deleteOk();">삭제</button>
				
			</td>
			<td class="text-end">
				<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/notice/list?${query}';">리스트</button>
			</td>
		</tr>
	</table>
</div>