<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="m-auto card mt-5 mb-5 p-4">
	<div class="text-start fs-3 mb-4 ps-4 mt-4">
		<span>| 결재</span>
	</div>
	<div class="m-auto" style="width:80%">
		<div class="card">
			<div class="card-header bg-main text-white bg-gradient fs-5" style="font-weight: bold;">
				결재 대기 목록
			</div>
			<div class="card-body">
			<c:choose >
			<c:when test="${not empty approvalList}">
				<table class="table table-hover text-center">
					<thead>
	        			<tr>
	        				<th>#</th>
	        				<th style="width: 50%">제목</th>
	        				<th style="width: 15%">부서 </th>
	        				<th style="width: 10%">직급</th> 
	        				<th style="width: 10%">기안자</th>
	        				<th style="width: 15%">상태</th>
	        			</tr>
        			</thead>
        			<tbody class="sendList">
        			<c:forEach items="${approvalList}" var="ap" varStatus="status">
        				<tr>
        					<th>${status.count}</th>
        					<td class="title">${ap.title}</td>
        					<td class="dep">${ap.depName}</td>
        					<td class="rank">${ap.rankName}</td>
        					<td class="name">${ap.name}</td>
        					<td>
        					<c:choose>
        						<c:when test="${ap.state == 0 }">기안</c:when>
        						<c:when test="${ap.state < ap.max_state && ap.state == 1 }">1차 승인</c:when>
        						<c:when test="${ap.state < ap.max_state && ap.state == 2 }">2차 승인</c:when>
        						<c:when test="${ap.state< ap.max_state }">결재 완료</c:when>
        						<c:otherwise>문의</c:otherwise>
        					</c:choose>
        					</td>
        					<td class="signNum" style="display: none">${ap.signNum}</td>
        				</tr>
        			</c:forEach>
        			</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<blockquote class="blockquote mt-5 mb-5 text-center text-muted">
			      <p>" 결재 대기중인 목록이 없습니다 "</p>
			    </blockquote>
			</c:otherwise>
			</c:choose>
			</div>
		</div>

	<div class="mt-4">
		<div class="card">
			<div class="card-header  bg-main text-white bg-gradient text-start fs-5"  style="font-weight: bold;">
				${sessionScope.employee.name}님의 결재
			</div>
			<div class="card-body">
				<c:choose >
			<c:when test="${not empty myApprovalList}">
				<table class="table  table-hover text-center">
					<thead>
	        			<tr>
	        				<th>#</th>
	        				<th style="width: 50%">제목</th>
	        				<th style="width: 15%">부서 </th> 
	        				<th style="width: 10%">직급</th>
	        				<th style="width: 10%">기안자</th>
	        				<th style="width: 15%">상태</th>
	        			</tr>
        			</thead>
        			<tbody class="sendList">
        			<c:forEach items="${myApprovalList}" var="ap" varStatus="status">
        				<tr>
        					<th>${status.count}</th>
        					<td class="title">${ap.title}</td>
        					<td class="dep">${ap.depName}</td>
        					<td class="rank">${ap.rankName}</td>
        					<td class="name">${ap.name}</td>
        					<td>
        					<c:choose>
        						<c:when test="${ap.state == 0 }">기안</c:when>
        						<c:when test="${ap.state < ap.max_state && ap.state == 1 }">1차 승인</c:when>
        						<c:when test="${ap.state < ap.max_state && ap.state == 2 }">2차 승인</c:when>
        						<c:when test="${ap.state< ap.max_state }">결재 완료</c:when>
        						<c:otherwise>문의</c:otherwise>
        					</c:choose>
        					</td>
        					<td class="signNum" style="display: none">${ap.signNum}</td>
        				</tr>
        			</c:forEach>
        			</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<blockquote class="blockquote mt-5 mb-5 text-center text-muted">
			      <p>" ${sessionScope.employee.name}님이 작성한 결재가 없습니다 "</p>
			    </blockquote>
			</c:otherwise>
			</c:choose>
			</div>
			<div>${paging}</div>		
		</div>
	</div>
	<div class="mt-4 mb-4 d-flex justify-content-between">	
			<button class="btn btn-sub bg-gradient" type="button" data-bs-toggle="modal" data-bs-target="#timeLine">타임라인</button>
			<button class="btn btn-sub bg-gradient" type="button" onclick="location.href='${pageContext.request.contextPath}/approval/write'">신규 결재</button>
	</div>
</div>
</div>
<!-- Modal -->
<div class="modal fade" id="timeLine" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="timeLineLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">타임라인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
        	<div class="alert bg-sub text-center" role="alert">
        		<div>타임라인이란, </div>
        		<div><span style="font-weight: bold">여러 결재를 하나로 묶어 시간순으로 배열하는 것</span>을 의미합니다.</div>
        		<div>프로젝트 단위의 결재를 처리하는데 용이하며,</div>
        		<div><span style="font-weight: bold">부서, 팀, 이름, 제목</span>으로 검색이 가능합니다.</div>
        	</div>
        	<div class="d-flex">
        	<select class="form-select me-2" id="condition">
	      		<option value="dep">부서</option>
	      		<option value="team">팀</option>
	      		<option value="name">이름</option>
	      		<option value="title">제목</option>
	      	</select>
        	<input class="form-control" id="keyword">
        	<button type="button" class="btn btn-main ms-2" ><i class="fa-solid fa-magnifying-glass"></i></button>
        	</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sub" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
	$(".sendList").children().click(function(){
		let signNum = this.querySelector(".signNum").textContent;
		location.href="${pageContext.request.contextPath}/approval/read/"+signNum;
	});

</script>
