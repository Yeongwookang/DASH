<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row">
	<div class="col-8">
		<div class="row border-end" style="height:50%"><span>타임라인</span></div>
		<div class="row border-top border-bottom border-end" style="height:10%"><span>영역1</span></div>
		<div class="row border-end" style="height:40%;">
			<div class="col-4">분석</div>
			<div class="col-4">분석</div>
			<div class="col-4">분석</div>
		</div>
	</div>
	<div class="col-4">
			<div class="row border-bottom" style="height:60%">
				<div style="height:80%;">
				<img src="${pageContext.request.contextPath}/resources/images/profile.png" style="width:100%; height:100%; object-fit:contain">
				</div>
				<div style="height: 20%">
				<span>분석/통계부서</span>
				</div>
			</div>
			<div class="row" style="height:40%">
				<span>진행중인 결재</span>
			</div>
	</div>
</div>


