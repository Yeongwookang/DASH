<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.statistic {	
	padding: 10px;
} 
</style>

<div class="row">
	<div class="col-8">
		<div class="row" style="height:50%">
			<span>타임라인</span>
		</div>
		<div class="row">
			<div class="col-4">
				<select name="category" class="form-select">
					<option value="일">일</option>
					<option value="월">월</option>
					<option value="년">년</option>
				</select>
			</div>
			<div class="col-4">
				<select name="category1" class="form-select" style="width: 50%; float: left; margin-right: 10px;">
					<option value="1">홍대입구역9번출구대여소</option>
					<option value="2">강남역12번출구대여소</option> 
					<option value="3">서울숲역2번출구대여소</option>
					<option value="4">여의도역1번출구대여소</option>
					<option value="5">압구정역6번출구대여소</option>
					<option value="6">신촌역5번출구대여소</option>
					<option value="7">신논현8번출구대여소</option>
					<option value="8">뚝섬역7번출구대여소</option>
					<option value="9">노량진역3번출구대여소</option>
					<option value="10">고속버스터미널역8번출구대여소</option>
				</select>
				<select name="category2" class="form-select" style="width: 45%">
					<option value="일">일</option>
					<option value="월">월</option> 
					<option value="년">년</option>   
				</select>
			</div>
			<div class="col-4">
				<select name="category" class="form-select">
					<option value="나이">나이</option>
					<option value="성별">성별</option>
					<option value="이용건수">이용건수</option>
					<option value="이용시간대">이용시간대</option>
					<option value="평균이동거리">평균이동거리</option>
					<option value="평균이동시간">평균이동시간</option>
				</select>
			</div>  
		</div>
		<div class="row border-end" style="height:40%;">
			<div class="col-4">분석</div> 
			<div class="col-4">분석</div>
			<div class="col-4">분석</div> 
		</div>  
	</div>
	<div class="col-4">
			<div class="row " style="height:60%">
				<div style="height:80%;">
					<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="profile">
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


