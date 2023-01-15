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


<div class="card mt-5 mb-5 p-4 m-auto" style="width:70%">
<div class="text-start fs-4 ml-2 mb-4">
	<span>| 사원 현황</span>
</div>
	<div class="mx-5">

		<form class="row" name="searchForm"
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
					<i class="bi bi-search"></i>&nbsp;검색
				</button>
			</div>

		</form>
		<br>
		<table class="table n-auto">
			<thead>
				<tr>
					<th scope="col">구분</th>
					<th scope="col">사원번호</th>
					<th scope="col">사원명</th>
					<th scope="col">부서</th>
					<th scope="col">직무</th>
					<th scope="col">연락처</th>
					<th scope="col">이메일</th>

				</tr>
			</thead>
			<c:forEach var="dto" items="${list}" varStatus="status">
				<tbody>
					<tr>
						<th scope="row">
							<div class="img-viewer"></div> <input type="file"
							 name="imageFilenameFile" id="imageFilenameFile" accept="image/*" class="form-control"
							style="display: none;">
						</th>
						<td scope="col">${dto.empNo}</td>
						<td scope="col">${dto.name}</td>
						<td scope="col">${dto.depName}</td>
						<td scope="col">${dto.rankName}</td>
						<td scope="col">${dto.tel}</td>
						<td scope="col">${dto.email}</td>
					</tr>

				</tbody>
			</c:forEach>
		</table>


	</div>

</div>

<script type="text/javascript">

$(function(){

	$(".table-form .img-viewer").click(function(){
		$("#imageFilenameFile").trigger("click");
	});
	
	$("#imageFilenameFile").change(function(){
		let file = this.files[0];
		
		
		if(! file) {
			$(".table-form .img-viewer").empty();
			
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/photo/"+img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/insertimage.png";
			}
			$(".table-form .img-viewer").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) { 
			$(".table-form .img-viewer").empty();
			$(".table-form .img-viewer").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL( file );
	});

});

</script>