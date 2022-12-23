<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="text-start fs-4 ml-2 mb-4">
	<span>| 개발</span>
</div>


<div class="card text-center">
	<div class="card-header">
		<ul class="nav nav-tabs card-header-tabs">
			<li class="nav-item"><a class="nav-link active"
				aria-current="true" href="#">대기 중인 결제 건</a></li>
			<li class="nav-item"><a class="nav-link" href="#">진행 중인 결제 건</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#"
				tabindex="-1" aria-disabled="true">승인완료</a></li>
		</ul>
	</div>
	<div class="d-flex justify-content-evenly">
		<div class="card-body" style="width: 38%">
			<div class="card text-center">
				<div class="card-header">
					<h5 class="card-title">결재명</h5>
				</div>
				<div class="card-body">

					<p class="card-text">요청 내용</p>
					<a href="#" class="btn btn-primary">확인</a>
				</div>
			</div>
		</div>
		<div class="card-body" style="width: 38%">
			<div class="card text-center">
				<div class="card-header">
					<h5 class="card-title">결재명</h5>
				</div>
				<div class="card-body">

					<p class="card-text">요청 내용</p>
					<a href="#" class="btn btn-primary">확인</a>
				</div>
			</div>
		</div>
		<div class="card-body" style="width: 38%">
			<div class="card text-center">
				<div class="card-header">
					<h5 class="card-title">결재명</h5>
				</div>
				<div class="card-body">

					<p class="card-text">요청 내용</p>
					<a href="#" class="btn btn-primary">확인</a>
				</div>
			</div>
		</div>
	</div>
</div>
