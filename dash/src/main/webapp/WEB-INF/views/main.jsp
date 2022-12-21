<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<div class="row" style="width: 90%">
	<div class="row" style="height: 30%">
		<div class="col-8"> 
			<div class="card h-100"> 
				<div class="text-start sales ms-4 mt-3">| 오늘의 매출<div class="ms-3 info">매출 요약</div></div>
				<div class="d-flex justify-content-evenly align-content-center flex-wrap" style="height: 80%"> 
					<div class="border box bg-sub text-start ps-4">   
						<div class="mt-3 salesicon"><i class="fa-solid fa-sack-dollar fa-2x"></i></div>
						<div class="mt-2 data">${totalSales}</div>  
						<div class="mt-1">총 매출액</div>
					</div>
					<div class="border box bg-sub text-start ps-4"> 
						<div class="mt-3 salesicon"><i class="fa-solid fa-road fa-2x"></i></div>
						<div class="mt-2 data">${rentalCount}</div>	
						<div class="mt-1">이용건수</div> 
					</div>
					<div class="border box bg-sub text-start ps-4">
						<div class="mt-3 salesicon"><i class="fa-regular fa-user fa-2x"></i></div>
						<div class="mt-2 data">${newCustomerCount}</div>	
						<div class="mt-1">신규 고객</div>
					</div>
					<div class="border box bg-sub text-start ps-4">
						<div class="mt-3 salesicon"><i class="fa-solid fa-hammer fa-2x"></i></div>
						<div class="mt-2 data">${repairCount}&nbsp;<span class="repair border">수리 중</span></div>	
						<div class="mt-1">수리현황</div> 
					</div>
					<div class="border box bg-sub text-start ps-4">
						<div class="mt-3 salesicon"><i class="fa-solid fa-triangle-exclamation fa-2x"></i></div>
						<div class="mt-2 data">${damageCount}</div>	 
						<div class="mt-1">파손현황</div>
					</div>
				</div> 
			</div>
		</div> 
		<div class="col-4">
			<div class="card  h-100">

			</div>
		</div>
	</div>
	<div class="row" style="height: 30%">
		<div class="col-8">
			<div class="card h-100">
				<div class="text-start sales ms-4 mt-3">| 대여소별 이용건수</div>
				<table class="table table-hover board-list mt-3">
					<thead>  
						<tr>
							<th>#</th>
							<th>대여소명</th>
							<th style="width: 300px;">인기도</th> 
							<th>이용건수</th> 
						</tr>
					</thead>
						<c:forEach var="dto" items="${usageRankList}" end="3">
							<tr>
								<td>${dto.usageRank}</td>
								<td>${dto.name}</td> 
								<td>
									<div class="progress">
									  <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</td>
								<td>${dto.usageCount}</td>
							</tr>
						</c:forEach> 
					<tbody>
						
					</tbody>
			</table>
			</div>
		</div> 
		<div class="col-4">
			<div class="card  h-100">

			</div>
		</div>
	</div>
	
	<div class="row" style="height: 30%">
		<div class="col-4">
			<div class="card h-100">

			</div>
		</div> 
		<div class="col-8">
			<div class="card  h-100">

			</div>
		</div>
	</div>
</div>