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
<div class="col">
	<button type="button" class="btn btn-light"
		onclick="location.href='${pageContext.request.contextPath}/insa/list';">새로고침</button>
</div>

<div class="col-6 text-center">
	<form class="row" name="searchForm"
		action="${pageContext.request.contextPath}/insa/list" method="post">
		<div class="col-auto p-1">
			<select name="condition" class="form-select">
				<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
				<option value="userName"
					${condition=="emp.empNo"?"selected='selected'":""}>작성자</option>
				<option value="reg_date"
					${condition=="reg_date"?"selected='selected'":""}>등록일</option>
				<option value="subject"
					${condition=="subject"?"selected='selected'":""}>제목</option>
				<option value="content"
					${condition=="content"?"selected='selected'":""}>내용</option>
			</select>
		</div>
		<div class="col-auto p-1">
			<input type="text" name="kwd" value="${kwd}"
				class="form-control">
		</div>
		<div class="col-auto p-1">
			<button type="button" class="btn btn-light" onclick="searchList()">
				<i class="bi bi-search"></i>
			</button>
		</div>
	</form>
</div>


<div class="scroll m-auto" style="height: 80%; overflow-y: scroll;">
	<div class="mx-5">

		<div class="col-auto me-auto">
			${dataCount}개(${page}/${total_page} 페이지)</div>

		<table class="table n-auto">
			<thead>
				<tr>
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
				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr>
						<td scope="row">${e.signNum}<td scope="col">${d
						to.title}</td>
						<td scope="col">${depName}</td>
						<td scope="col">${emp.name}</td>
						<td scope="col">${reg_date}</td>
						<td scope="col">
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal">
								내용확인</button>
						</td>
						<td scope="col">${dto.state}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="page-navigation">
				${dataCount == 0 ? "요청 사항이 없습니다." : paging}
			</div>

	</div>
</div>


<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">

				<h5 class="modal-title" id="exampleModalLabel">결재 TITLE</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">${dto.content}</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary">접수</button>
			</div>
		</div>
	</div>
</div>
