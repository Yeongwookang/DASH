<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<div class="row" style="width: 90%">
	<div class="row" style="height: 30%">
		<div class="col-8">
			<div class="mb-2 border round-box">
				<div class="row ms-3 mt-3 sales">| 오늘의 매출<div class="row ms-1 info">매출 요약</div></div>
				<div class="d-flex mt-5"> 
					<div class="col border box">
						총 매출액
						<div>${totalSales}</div>
					</div>
					<div class="col border box">
						신규 고객
						<div>${newCustomerCount}</div>	
					</div>
					<div class="col border box">
						수리현황
						<div>${repairCount}</div>		
					</div>
					<div class="col border box">
						이용건수
						<div>${rentalCount}</div>	
					</div>
				</div> 
			</div>
		</div> 
		<div class="col-4">
			<div class="mb-2 border round-box">
			</div>
		</div>
	</div>
	<div class="row mt-4" style="height: 30%">
		<div class="col-8">
			<div class="mb-2 border round-box">
			</div>
		</div>
		<div class="col-4">
			<div class="mb-2 border round-box">
			</div>
		</div>
	</div>
	<div class="row mt-4 mb-4" style="height: 30%">
		<div class="col-4">
			<div class="mb-2 border round-box">
			</div>
		</div>
		<div class="col-8">
			<div class="mb-2 border round-box">
			</div>
		</div>
	</div>
</div>