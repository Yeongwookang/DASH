<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<div class="d-flex ps-4 pe-4 justify-content-between flex-wrap align-content-between elipsis" style="height: 90%">
		<div class="card" style="width: 66%;  height: 32%"> 
			<div class="text-start sales ms-4 mt-3">| 오늘의 매출</div>
			<div class="d-flex justify-content-evenly h-100 p-4"> 
				<div class="border d-flex box bg-sub text-start p-4">
					<div>   
					<div class="salesicon"><i class="fa-solid fa-sack-dollar fa-2x"></i></div>
					<div class="data">${totalSales}</div>
					<div>총 매출액</div>
					</div>
				</div>
				<div class="border d-flex box bg-sub text-start p-4"> 
					<div>
					<div class="salesicon"><i class="fa-solid fa-road fa-2x"></i></div>
					<div class="data">${rentalCount}</div>	
					<div>이용건수</div> 
					</div>
				</div>
				<div class="border d-flex box bg-sub text-start p-4">
					<div>
					<div class="salesicon"><i class="fa-regular fa-user fa-2x"></i></div>
					<div class="data">${newCustomerCount}</div>	
					<div>신규 고객</div>
					</div>
				</div>
				<div class="border d-flex box bg-sub text-start p-4">
					<div>
					<div class="salesicon"><i class="fa-solid fa-hammer fa-2x"></i></div>
					<div class="data">${repairCount}&nbsp;<span class="repair border">수리 중</span></div>	
					<div>수리현황</div>
					</div> 
				</div>
				<div class="border d-flex box bg-sub text-start p-4">
					<div>
					<div class="salesicon"><i class="fa-solid fa-triangle-exclamation fa-2x"></i></div>
					<div class="data">${damageCount}</div>	 
					<div>파손현황</div>
					</div>
				</div>
			</div> 
		</div>
		
		<div class="card"  style="width: 32%">
	
		</div>
			<div class="card " style="width: 66%; height: 32%">
				<div class="text-start sales ms-4 mt-3">| 대여소별 이용건수</div>
				<table class="table table-hover h-100 board-list">
					<thead>  
						<tr>
							<th>#</th>
							<th>대여소명</th>
							<th>인기도</th> 
							<th>이용건수</th> 
						</tr>
					</thead>
						<c:forEach var="dto" items="${usageRankList}" end="3">
							<tr>
								<td>0${dto.usageRank}</td> 
								<td>${dto.name}</td> 
								<td>
									<c:if test="${dto.usageRank == 1}">
										<div class="progress">
										  <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</c:if>
									<c:if test="${dto.usageRank == 2}"> 
										<div class="progress">
										  <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</c:if>
									<c:if test="${dto.usageRank == 3}">
										<div class="progress">
										  <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</c:if>
									<c:if test="${dto.usageRank == 4}">
										<div class="progress">
										  <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
										</div> 
									</c:if>
								</td>
								<td>${dto.usageCount}건</td>
							</tr>
						</c:forEach> 
					<tbody>
						
					</tbody>
			</table>
			</div>
		
		<div class="card"  style="width: 32%">
			<div class="text-start sales ms-4 mt-3">| 전일 시간대별 인원수</div>
		</div>
		
		<div class="card "  style="width: 32%;  height: 32%">
			<div class="text-start sales ms-4 mt-3">| 구별 매출</div>
			<div>sadadasd</div>
			<div>sadadasd</div>
			<div>sadadasd</div>
			<div>sadadasd</div>
			<div>sadadasd</div>
		</div>
		<div class="card " style="width: 66%">
			
		</div>
		</div> 