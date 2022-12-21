<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row d-flex flex-column" style="height: 95%">
	<div class="text-start fs-4 mb-4">
		<span>| 결재</span>
	</div>
	<div>
	<form name="approval-search"  method="post">
		<div class="d-flex justify-content-center align-items-center">
				<input class="form-control" type="date"> 
			<span class="ms-2 me-2">~</span>
				<input class="form-control" type="date"> 
			<button type="button" class="btn bg-sub bg-gradient ms-2"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div>
	</form>
	</div>
	<div class="mt-4">
		<div class="card">
			<div class="card-header bg-sub text-start">결재 대기 목록</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0">
			      <p>A well-known quote, contained in a blockquote element.</p>
			      <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
			    </blockquote>
			</div>
		</div>
	</div>
	<div class="mt-4">
		<div class="card">
			<div class="card-header bg-sub text-start">? 의 결재</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0">
			      <p>A well-known quote, contained in a blockquote element.</p>
			      <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
			    </blockquote>
			</div>		
		</div>
	</div>
	<div class="mt-4 mb-4 d-flex justify-content-end">
		<div>
			<button class="btn bg-sub bg-gradient" type="button" data-bs-toggle="modal" data-bs-target="#newApproval">신규 결재</button>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="newApproval" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="newApprovalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">참조자 설정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="flex-container">
        <div class="alert bg-sub  text-center" role="alert">
        	<div>결재 문서의 참조자를 설정해주세요.</div><div> 참조자는 최대 3명까지 가능합니다.</div>
        </div>
        <form class="form-control">
        <div class="d-flex mt-2">
        	<select class="form-select">
        		<option>부서</option>
        		<option>직책</option>
        		<option>이름</option>
        	</select>
        	<input type="text" class="form-control ms-2">
        	<button type="button" class="btn bg-sub bg-gradient ms-2"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
        	<div>
        		<table class="table table-hover mt-2">
        			<thead>
	        			<tr>
	        				<th scope="col">#</th>
	        				<th scope="col">부서</th>
	        				<th scope="col">직급</th>
	        				<th scope="col">직책</th>
	        				<th scope="col">이름</th>
	        			</tr>
        			</thead>
        			<tbody>
        				<tr>
        					<th scope="row">1</th>
        					<td>개발부</td>
        					<td>부장</td>
        					<td>머시기저시기</td>
        					<td>김시연</td>
        				</tr>
        				<tr>
        					<th scope="row">2</th>
        					<td>개발부</td>
        					<td>과장</td>
        					<td>머시기저시기</td>
        					<td>강모씨</td>
        				</tr>
        				<tr>
        					<th scope="row">3</th>
        					<td>개발부</td>
        					<td>팀장</td>
        					<td>머시기저시기</td>
        					<td>강모씨</td>
        				</tr>
        			</tbody>
        		</table>
        		<div class="d-flex justify-content-center">
        		<nav aria-label="...">
				  <ul class="pagination">
				    <li class="page-item">
				      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;</a>
				    </li>
				    <li class="page-item disabled"><span class="page-link">-</span></li>
				    <li class="page-item">
				      <a class="page-link" href="#">&gt;</a>
				    </li>
				  </ul>
				</nav>
				</div>
        	</div>
        </form>
        <div class="form-control mt-4">
        	<table class="table table-hover mt-2">
        		<thead>
	       			<tr>
	       				<th scope="col">#</th>
	       				<th scope="col">부서</th>
	       				<th scope="col">직급</th>
	       				<th scope="col">직책</th>
	       				<th scope="col">이름</th>
	       			</tr>
     			</thead>
        	</table>
        </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn bg-sub">글쓰기</button>
      </div>
    </div>
  </div>
</div>