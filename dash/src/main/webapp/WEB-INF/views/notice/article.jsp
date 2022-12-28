<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
function deleteOk() { 
    if(confirm("해당 공지사항을 삭제하시겠습니까 ? ")) {
	    let query = "num=${dto.num}&${query}";
	    let url = "${pageContext.request.contextPath}/notice/delete?" + query;
    	location.href = url;
    }
}
</script>

<div class="scroll m-auto" style="height: 85%; width:90%; overflow-y:scroll;">
	<div class="text-start fs-4 mb-4">
		<span>
			<button type="button" class="btn text-white" onclick="location.href='${pageContext.request.contextPath}/notice/main?${query}';"><img src="${pageContext.request.contextPath}/resources/images/left2.png" style="width: 18px;"></button>
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
					<span class="name">${dto.depName}&nbsp;${dto.name}</span> 
				</td>
				<td align="right">
					<span class="date pe-1">${dto.reg_date} | 조회수 ${dto.hitCount}</span> 
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
						<a href="${pageContext.request.contextPath}/notice/download?fileNum=${vo.fileNum}" class="preNext">${vo.originalFilename}</a>
						(<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> kb) 
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="2" class="mt-5 ps-3">  
					이전글 : 
					<c:if test="${not empty preReadDto}">
						<a href="${pageContext.request.contextPath}/notice/article?${query}&num=${preReadDto.num}" class="preNext">${preReadDto.subject}</a>
					</c:if>
					<c:if test="${empty preReadDto}">  
						이전 게시글이 존재하지 않습니다. 
					</c:if>
				</td> 
			</tr>
			<tr>
				<td colspan="2" class="mt-4 mb-3 ps-3"> 
					다음글 : 
					<c:if test="${not empty nextReadDto}">
						<a href="${pageContext.request.contextPath}/notice/article?${query}&num=${nextReadDto.num}" class="preNext">${nextReadDto.subject}</a>
					</c:if>
					<c:if test="${empty nextReadDto}">
						다음 게시글이 존재하지 않습니다.
					</c:if>	
				</td>
			</tr>
		</tbody>
	</table>	
	
	<table class="table table-borderless">
		<tr>
			<c:if test="${sessionScope.employee.empNo == '8801001'}">
				<td width="50%" class="text-end">
					<button type="button" class="btn button-main" onclick="location.href='${pageContext.request.contextPath}/notice/update?num=${dto.num}&page=${page}';">수정</button>
			    	<button type="button" class="btn button-main" onclick="deleteOk();">삭제</button>
				</td>
			</c:if>
		</tr>
	</table>
</div>