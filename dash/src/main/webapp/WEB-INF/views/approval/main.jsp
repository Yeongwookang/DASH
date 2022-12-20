<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row d-flex flex-column ms-1">
	<div class="text-start fs-4">
		<span>| 결재</span>
	</div>
	<form name="approval-search p-0" method="post">
		<div class="d-flex justify-content-center align-items-center">
			<div class="form-control">
				<input class="form-control" type="date"> 
			</div>
			<span>&nbsp;~&nbsp;</span>
			<div class="form-control">
				<input class="form-control" type="date"> 
			</div>
			<div>
				<button class="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>	
		</div>
	</form>
	<div class="mt-4">
		<div class="card">
			<div class="card-header text-start">결재 대기 목록</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0">
			      <p>A well-known quote, contained in a blockquote element.</p>
			      <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
			    </blockquote>
			</div>		
		</div>
	</div>
	<div class="mt-4 mb-4">
	<div class="card">
		<div class="card-header text-start">? 의 결재</div>
		<div class="card-body">
			<blockquote class="blockquote mb-0">
		      <p>A well-known quote, contained in a blockquote element.</p>
		      <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
		    </blockquote>
		</div>		
	</div>
	</div>
</div>