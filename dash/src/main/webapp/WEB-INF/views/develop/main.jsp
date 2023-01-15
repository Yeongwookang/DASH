<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
</script>

<div class="text-start fs-4 ml-2 mb-4">
	<span>| 유지보수</span>
</div>

<div class="scroll m-auto" style="height: 80%; overflow-y: scroll;">
	<div class="mx-5">
		<div class="col-6 text-center">
			<form class="row" name="searchForm"
				action="${pageContext.request.contextPath}/develop/main"
				method="post">
				<div class="col-auto p-1">
					<select name="condition" class="form-select">
						<option selected value="all">검색</option>
						<option value="signNum"
							${condition=="signNum"?"selected='selected'":""}>결재번호</option>
						<option value="title"
							${condition=="title"?"selected='selected'":""}>제목</option>
						<option value="name"
							${condition=="name"?"selected='selected'":""}>작성자</option>
						<option value="reg_date"
							${condition=="reg_date"?"selected='selected'":""}>등록일</option>
					</select>
				</div>
				<div class="col-auto p-1">
					<input type="text" name="keyword" value="${keyword}" class="form-control">
				</div>
				<div class="col-auto p-1">
					<button type="button" class="btn btn-light" onclick="searchList()">
						<i class="bi bi-search"></i>
					</button>
				</div>
				<div class="col">
					<button type="button" class="btn btn-light"
						onclick="location.href='${pageContext.request.contextPath}/develop/main';">새로고침</button>
				</div>
			</form>
		</div>

		<table class="table table text-center mt-3">
			<thead>
				<tr>
					<th scope="col">구분</th>
					<th scope="col">결재번호</th>
					<th scope="col">제목</th>
					<th scope="col">부서</th>
					<th scope="col">기안자</th>
					<th scope="col">요청일</th>
					<th scope="col">상세내용</th>
					<th scope="col">진행상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto" varStatus="status">
					<tr>
						<th>${status.count}</th>
						<td class="signNum">${dto.signNum}</td>
						<td class="title">${dto.title}</td>
						<td class="dep">${dto.depName}</td>
						<td class="rank">${dto.name}</td>
						<td class="name">${dto.reg_date}</td>
						<td>
							<button type="button" class="btn btn-primary sendList"
								data-bs-toggle="modal" data-bs-target="#staticBackdrop">내용확인</button>
						</td>
						<td><c:choose>
								<c:when test="${dto.state == 0 }">기안</c:when>
								<c:when test="${dto.state < dto.max_state && dto.state == 1 }">1차 승인</c:when>
								<c:when test="${dto.state < dto.max_state && dto.state == 2 }">2차 승인</c:when>
								<c:when test="${dto.state< dto.max_state }">결재 완료</c:when>
								<c:otherwise>문의</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>



<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div>
				<form name="develop" method="POST"
					action="${pageContext.request.contextPath}/develop/main"
					enctype="multipart/form-data">
					<div class="modal-body">
						<table class="table">
							<tbody>
								<tr>
									<td class="w-25 text-center  align-middle" scope="row"><h4>제목</h4></td>
									<td class="w-75">${dto.title}</td>
								</tr>

								<tr>
									<td class="w-25 text-center align-middle" scope="row"><h4>기안자</h4></td>
									<td class="w-75">${dto.depName}&nbsp;${dto.name}<input
										name="empNo" type="hidden" value="${dto.empNo}">
									</td>
								</tr>

								<tr>
									<td class="text-center align-middle" scope="row"><h4>결재라인</h4></td>
									<td class="d-flex "><input type="text"
										class="form-control me-2" id="ref1name"
										value="${ref1.depName}&nbsp;${ref1.name}" readonly> <input
										type="text" class="form-control me-2" id="ref2name"
										value="${ref2.depName}&nbsp;${ref2.name}" readonly> <input
										type="text" class="form-control" id="ref3name"
										value="${ref3.depName}&nbsp;${ref3.name}" readonly> <input
										type="hidden" class="form-control me-2" name="ref1"
										value="${dto.ref1}" readonly> <input type="hidden"
										class="form-control me-2" name="ref2" value="${dto.ref2}"
										readonly> <input type="hidden"
										class="form-control me-2" name="ref3" value="${dto.ref3}"
										readonly></td>
								</tr>

							</tbody>
						</table>
						<div class="form-control m-auto mb-4" style="min-height: 400px;">${dto.content}</div>
					</div>
				</form>
				<c:if test="${not empty fileList}">
					<div>
						<h4>파일</h4>
					</div>
					<c:forEach var="file" items="${fileList}" varStatus="status">
						<div class=" d-flex form-control mb-2 justify-content-between">
							<div>
								<button class="btn" type="button"
									onclick="location.href='${pageContext.request.contextPath}/approval/download/${file.fileNum}'">
									<i class="fa-solid fa-floppy-disk"></i>
									${file.originalFilename} (${file.fileSize/1000} kb)
								</button>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary">승인</button>
			</div>
		</div>
	</div>
</div>





