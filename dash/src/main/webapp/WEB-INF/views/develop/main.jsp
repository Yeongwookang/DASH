<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="text-start fs-4 ml-2 mb-4">
	<span>| 유지보수</span>
</div>

<div class="scroll m-auto" style="height: 80%; overflow-y: scroll;">
	<div class="mx-5">

		<table class="table">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">결재번호</th>
					<th scope="col">제목</th>
					<th scope="col">부서</th>
					<th scope="col">기안자</th>
					<th scope="col">승인대기</th>
					<th scope="col">승인</th>
					<th scope="col">반려</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<th scope="col">${dto.signNum}</th>
					<th scope="col">${dto.title}</th>
					<th scope="col">${dto.detpName}</th>
					<th scope="col">${dto.name}</th>
					<th scope="col">
					<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									내용확인</button>
					 </th>
					<th scope="col">승인</th>
					<th scope="col">반려</th>
				</tr>
				<tr>
					<th scope="row">2</th>
					<th scope="col">결재번호</th>
					<th scope="col">${dto.title}</th>
					<th scope="col">${dto.detpName}</th>
					<th scope="col">${dto.name}</th>
					<th scope="col">
					<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									내용확인</button>
					 </th>
					<th scope="col">승인</th>
					<th scope="col">반려</th>
				</tr>
				<tr>
					<th scope="row">3</th>
					<th scope="col">결재번호</th>
					<th scope="col">${dto.title}</th>
					<th scope="col">${dto.detpName}</th>
					<th scope="col">${dto.name}</th>
					<th scope="col">
					<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									내용확인</button>
					 </th>
					<th scope="col">승인</th>
					<th scope="col">반려</th>
				</tr>
			</tbody>
		</table>

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
			<div class="modal-body">
			${dto.content}
			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">반려</button>
				<button type="button" class="btn btn-primary">승인</button>
			</div>
		</div>
	</div>
</div>
