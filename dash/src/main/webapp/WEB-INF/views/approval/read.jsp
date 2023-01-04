<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="m-auto scroll" style="width: 90%; height:85%; overflow-y: scroll;">
	<div><h4>| 결재</h4></div>
	<div class="ps-5 pe-5 mt-4">
		<form name="approval" method="POST" action="${pageContext.request.contextPath}/approval/write" enctype="multipart/form-data">
			<table class="table">
				<tbody>
				<tr>
					<td class="w-25 text-center align-middle" scope="row"><h4>제목</h4></td>
					<td class="w-75">
						${dto.title}
					</td>
				</tr>
				<tr>
					<td class="w-25 text-center align-middle" scope="row"><h4>기안자</h4></td>
					<td class="w-75">
						 ${dto.depName}&nbsp;${dto.name}
						 <input name= "empNo" type="hidden" value="${dto.empNo}" >
					</td>
				</tr>
				<tr>
					<td class="text-center align-middle" scope="row"><h4>타임라인</h4></td>
					<td class="d-flex ">
						<input type="text" class="form-control" value="${dto.timeLine}" readonly>
					</td>
				</tr>
				<tr>
					<td class="text-center align-middle" scope="row"><h4>참 조</h4></td>
					<td class="d-flex ">
						<input type="text" class="form-control me-2" id="ref1name" value="${ref1.depName}&nbsp;${ref1.name}" readonly>
						<input type="text" class="form-control me-2" id="ref2name" value="${ref2.depName}&nbsp;${ref2.name}" readonly>
						<input type="text" class="form-control" id="ref3name" value="${ref3.depName}&nbsp;${ref3.name}" readonly>
						<input type="hidden" class="form-control me-2" name="ref1" value="${dto.ref1}" readonly>
						<input type="hidden" class="form-control me-2" name="ref2" value="${dto.ref2}" readonly>
						<input type="hidden" class="form-control me-2" name="ref3" value="${dto.ref3}" readonly>
					</td>
				</tr>
				</tbody>
			</table>
			<div class="form-control m-auto mb-4" style="min-height: 400px; ">${dto.content}</div>
			</form>
			<c:if test="${not empty fileList }">
				<div><h4>파일</h4></div>
				<c:forEach var="file" items="${fileList}" varStatus="status" >
					<div class=" d-flex form-control mb-2 justify-content-between">
						<div><button class="btn" type="button" onclick="location.href='${pageContext.request.contextPath}/approval/download/${file.fileNum}'"><i class="fa-solid fa-floppy-disk"></i> ${file.originalFilename} (${file.fileSize/1000} kb)</button></div> 
					</div>
				</c:forEach>
			</c:if>
		<div class="d-flex justify-content-end mt-4">
			<c:if test="${sessionScope.employee.empNo == dto.empNo && dto.state < 1}">
				<button class="btn bg-light bg-gradient me-2" type="button" onclick="location.href='${pageContext.request.contextPath}/approval/update/${dto.signNum}'">수정</button>
			</c:if>
			<form method="POST" action="${pageContext.request.contextPath}/approval/approve" name="approve">
				<input type="hidden" value="${dto.state}" name="state">
				<input type="hidden" value="${dto.signNum}" name="signNum">			
			<c:if test="${sessionScope.employee.empNo == dto.ref1 || sessionScope.employee.empNo == dto.ref2 || sessionScope.employee.empNo == dto.ref3}">
				<button class="btn bg-light bg-gradient me-2" type="submit">결재</button>
			</c:if>
			</form>
		</div>
		
	</div>
</div>

