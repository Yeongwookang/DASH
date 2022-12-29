<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>

<script type="text/javascript">
$(function(){
	let url = "${pageContext.request.contextPath}/zoonUsageCountAnalysis";
	
	$.getJSON(url, function(data){
		// console.log(data);
		lastDayUsageCount(data);
		
		function lastDayUsageCount(data){
			var chartDom = document.getElementById('chart-container1');
			var myChart = echarts.init(chartDom);
			var option;

			option = {
			  tooltip: {
			    trigger: 'item'
			  },
			  series: [
			    { 
			      name: '전일 시간대별 인원수',
			      type: 'pie',
			      radius: ['40%', '70%'],
			      avoidLabelOverlap: false,
			      itemStyle: {
			        borderRadius: 10,
			        borderColor: '#fff',
			        borderWidth: 2
			      },
			      label: {
			        show: false,
			        position: 'center'
			      },
			      emphasis: {
			        label: {
			          show: true,
			          fontSize: 40,
			          fontWeight: 'bold'
			        }
			      },
			      labelLine: {
			        show: false
			      },
			      data: [
			        { value: data.lastDayUsageCount.t0, name: '00 ~ 03' },
			        { value: data.lastDayUsageCount.t3, name: '03 ~ 06' },
			        { value: data.lastDayUsageCount.t6, name: '06 ~ 09' },
			        { value: data.lastDayUsageCount.t9, name: '9 ~ 12' },
			        { value: data.lastDayUsageCount.t12, name: '12 ~ 15' },
			        { value: data.lastDayUsageCount.t15, name: '15 ~ 18' },
			        { value: data.lastDayUsageCount.t18, name: '18 ~ 21' },
			        { value: data.lastDayUsageCount.t21, name: '21 ~ 24' }
			      ]
			    }
			  ]
			};

			option && myChart.setOption(option);
		}
		

	});
		
	window.onload = function () {
        window.myChart = echarts.init(document.getElementById('chart-container1'));

        //graph resize
        $(window).on('resize', resize);
        function resize(){
            setTimeout(function(){
                window.myChart.resize();
            }, 100);
        }
    }
	
});

</script>

<script type="text/javascript">
$(function(){
	let url = "${pageContext.request.contextPath}/zoonSalesAnalysis";
	
	$.getJSON(url, function(data){
		// console.log(data);
		salesRankList(data);
		
		function salesRankList(data) {
			let price = [];
			let zoonName = [];
			
			for(let i=0; i<data.salesRankList.length; i++) {
				item = data.salesRankList[i];
				if (i == 0){
					obj = {value : item.price, itemStyle:{color: '#FF5375'}}
					price.push(obj);
				} else {
				    price.push(item.price);
				}
				zoonName.push(item.zoonName);
			}
			
			var chartDom = document.getElementById('chart-container2');
			var myChart = echarts.init(chartDom);
			var option;
			
			option = {
					  tooltip: {
					    trigger: 'item',
					    axisPointer: { type: 'cross' }
					  },
					  xAxis: {
					    type: 'category',
					    data: zoonName
					  },
					  yAxis: {
						show: false,
					    type: 'value'
					  },
					  series: [
					    {
					      data: price,
					      type: 'bar'
					    }
					  ]
					};

					option && myChart.setOption(option);
		}
		

	});
		
	window.onload = function () {
        window.myChart = echarts.init(document.getElementById('chart-container2'));

        //graph resize
        $(window).on('resize', resize);
        function resize(){
            setTimeout(function(){
                window.myChart.resize();
            }, 100);
        }
    }
	
});

</script>
	<div class="scroll m-auto" style="width: 90%; height: 85%; overflow-y:scroll;">
		<div class="d-flex justify-content-between mb-3">
		<div class="card" style="width: 49%;"> 
			<div class="text-start sales ms-3 mt-3">| 오늘의 현황</div>
			<div class="d-flex justify-content-evenly mb-4 mt-2"> 
				<div class="d-flex box text-start p-2">
					<div>   
					<div class="salesicon"><i class="fa-solid fa-sack-dollar fa-2x"></i></div>
					<div class="data">${totalSales}</div>
					<div>총 매출액</div>
					</div>
				</div>
				<div class="d-flex box text-start p-2"> 
					<div>
					<div class="salesicon"><i class="fa-solid fa-road fa-2x"></i></div>
					<div class="data">${rentalCount}</div>	
					<div>이용건수</div> 
					</div>
				</div>
				<div class="d-flex box text-start p-2">
					<div>
					<div class="salesicon"><i class="fa-regular fa-user fa-2x"></i></div>
					<div class="data">${newCustomerCount}</div>	
					<div>신규 고객</div>
					</div>
				</div>
				<div class="d-flex box text-start p-2">
					<div>
					<div class="salesicon"><i class="fa-solid fa-hammer fa-2x"></i></div>
					<div class="data">${repairCount}&nbsp;<span class="repair border">수리 중</span></div>	
					<div>수리현황</div>
					</div> 
				</div>
				<div class="d-flex box text-start p-2">
					<div>
					<div class="salesicon"><i class="fa-solid fa-triangle-exclamation fa-2x"></i></div>
					<div class="data">${damageCount}</div>	 
					<div>파손현황</div>
					</div>
				</div>
			</div> 
		</div>
		
		<div class="card"  style="width: 49%">
	
		</div>
		</div>
		<div class="d-flex justify-content-between mb-3">
			<div class="card " style="width: 66%;">
				<div class="text-start sales ms-3 mt-3">| 대여소별 이용건수</div>
				<table class="table table-hover h-100 board-list">
					<thead>  
						<tr class="text-center">
							<th style="width: 10%">#</th> 
							<th style="width: 40%">대여소명</th>
							<th style="width: 30%">인기도</th> 
							<th style="width: 20%">이용건수</th>  
						</tr>
					</thead> 
					<tbody>
						<c:forEach var="dto" items="${usageRankList}" end="3">
							<tr class="text-center"> 
								<td>0${dto.usageRank}</td> 
								<td>${dto.name}</td> 
								<td>
									<c:if test="${dto.usageRank == 1}">
										<div class="progress">
										  <div class="progress-bar bg-point" role="progressbar" aria-label="Basic example" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</c:if>
									<c:if test="${dto.usageRank == 2}"> 
										<div class="progress">
										  <div class="progress-bar bg-point" role="progressbar" aria-label="Basic example" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</c:if>
									<c:if test="${dto.usageRank == 3}">
										<div class="progress">
										  <div class="progress-bar bg-point" role="progressbar" aria-label="Basic example" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</c:if>
									<c:if test="${dto.usageRank == 4}">
										<div class="progress">
										  <div class="progress-bar bg-point" role="progressbar" aria-label="Basic example" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
										</div> 
									</c:if>
								</td>
								<td>${dto.usageCount}건</td>
							</tr>
						</c:forEach> 
					</tbody>
			</table>
			</div>
		<div class="card " style="width: 32%;">
			<div class="text-start sales ms-3 mt-3">| 전일 시간대별 인원수</div>
			<div id="chart-container1" class="h-100 w-100"></div>
		</div>		
		</div>
		<div class="d-flex justify-content-between">
		<div class="card"  style="width: 32%">
			<div class="text-start sales ms-3 mt-3">| 구별 매출</div>
			<div id="chart-container2" class="h-100 w-100"></div>
		</div>
		<div class="card " style="width: 66%">
			<div class="text-start sales ms-3 mt-3">| 진행중인 결재</div>
				<table class="table table-hover h-100 board-list">
					<thead>  
						<tr class="text-center"> 
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
		</div> 
		</div>