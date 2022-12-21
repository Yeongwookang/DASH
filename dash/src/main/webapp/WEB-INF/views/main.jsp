<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<div class="row" style="width: 90%">
	<div class="row" style="height: 30%">
		<div class="col-8">
			<div class="card h-100">
				<div class="text-start">| 오늘의 매출<div class="ms-1 info">매출 요약</div></div>
				<div class="d-flex justify-content-evenly align-content-center flex-wrap" style="height: 80%"> 
					<div class="border box bg-sub">   
						<div class="mt-3 salesicon"><i class="fa-solid fa-sack-dollar fa-2x"></i></div>
						<div class="mt-2 data">${totalSales}</div>
						<div class="mt-2">총 매출액</div>
					</div>
					<div class="border box bg-sub">
						<div class="mt-3 salesicon"><i class="fa-solid fa-road fa-2x"></i></div>
						<div class="mt-2 data">${rentalCount}</div>	
						<div class="mt-2">이용건수</div> 
					</div>
					<div class="border box bg-sub">
						<div class="mt-3 salesicon"><i class="fa-regular fa-user fa-2x"></i></div>
						<div class="mt-2 data">${newCustomerCount}</div>	
						<div class="mt-2">신규 고객</div>
					</div>
					<div class="border box bg-sub">
						<div class="mt-3 salesicon"><i class="fa-solid fa-hammer fa-2x"></i></div>
						<div class="mt-2 data">${repairCount}</div>	
						<div class="mt-2">수리현황</div>
					</div>
					<div class="border box bg-sub">
						<div class="mt-3 salesicon"><i class="fa-solid fa-hammer fa-2x"></i></div>
						<div class="mt-2 data">${repairCount}</div>	
						<div class="mt-2">수리현황</div>
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
				<div class="text-start">| 오늘의 매출<div class="ms-1 info">매출 요약</div></div>
				<div class="d-flex justify-content-evenly align-content-center flex-wrap" style="height: 80%"> 
					<div class="border box bg-sub">   
						<div class="mt-3 salesicon"><i class="fa-solid fa-sack-dollar fa-2x"></i></div>
						<div class="mt-2 data">${totalSales}</div>
						<div class="mt-2">총 매출액</div>
					</div>
					<div class="border box bg-sub">
						<div class="mt-3 salesicon"><i class="fa-solid fa-road fa-2x"></i></div>
						<div class="mt-2 data">${rentalCount}</div>	
						<div class="mt-2">이용건수</div> 
					</div>
					<div class="border box bg-sub">
						<div class="mt-3 salesicon"><i class="fa-regular fa-user fa-2x"></i></div>
						<div class="mt-2 data">${newCustomerCount}</div>	
						<div class="mt-2">신규 고객</div>
					</div>
					<div class="border box bg-sub">
						<div class="mt-3 salesicon"><i class="fa-solid fa-hammer fa-2x"></i></div>
						<div class="mt-2 data">${repairCount}</div>	
						<div class="mt-2">수리현황</div>
					</div>
					<div class="border box bg-sub">
						<div class="mt-3 salesicon"><i class="fa-solid fa-hammer fa-2x"></i></div>
						<div class="mt-2 data">${repairCount}</div>	
						<div class="mt-2">수리현황</div>
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