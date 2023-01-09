<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
form .img-viewer {
	cursor: pointer;
	border: 1px solid #ccc;
	width: 55px;
	height: 55px;
	border-radius: 55px;
	background-image:
		url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

<script>
function searchList() {
	const f = document.searchForm;
	f.submit();
}

</script>

<div class="text-start fs-4 ml-2 mb-4">
	<span>| 사원 현황</span>
</div>

<div class="scroll m-auto" style="height: 80%; overflow-y: scroll;">
	<div class="mx-5">

		<form class="row" name="emplist"
			action="${pageContext.request.contextPath}/insa/list" method="post">
			<div class="col-auto">
				<select class="form-select form-select-sm"
					aria-label="Default select example" name="col">
					<option selected value="all">찾기</option>
					<option value="empNo" ${col=="empNo"?"selected='selected'":""}>사번</option>
					<option value="name" ${col=="name"?"selected='selected'":""}>이름</option>
					<option value="depName" ${col=="depName"?"selected='selected'":""}>부서</option>
					<option value="rankName"
						${col=="rankName"?"selected='selected'":""}>직급</option>
				</select>
			</div>
			<div class="col-auto">
				<input type="text" name="kwd" value="${kwd}"
					class="form-control form-select-sm">
			</div>
			<div class="col-auto">
				<button type="submit" class="btn bg-sub btn-sm"
					onclick="searchList()">
					<i class="bi bi-search"></i>검색
				</button>
			</div>

			<table class="table n-auto">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">사원번호</th>
						<th scope="col">사원명</th>
						<th scope="col">부서</th>
						<th scope="col">직무</th>
						<th scope="col">연락처</th>
						<th scope="col">이메일</th>

					</tr>
				</thead>
				<c:forEach var="dto" items="${emplist}" varStatus="status">
					<tbody>
						<tr>
							<th scope="row"><input type="file" name="selectFile"
								accept="image/*" class="form-control" style="display: none;">
							</th>
							<th scope="col">${dto.empNo}</th>
							<th scope="col">${dto.name}</th>
							<th scope="col">${dto.detpName}</th>
							<th scope="col">${dto.rankName}</th>
							<th scope="col">${dto.tel}</th>
							<th scope="col">${dto.email}</th>
						</tr>

					</tbody>
				</c:forEach>
			</table>
		</form>

	</div>
</div>