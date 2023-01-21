<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>

<script type="text/javascript">
$(function(){
	let url = "${pageContext.request.contextPath}/analysis/userAgeTime"; 
	
	$.getJSON(url, function(data){
		userAgeTime(data);
		console.log(data);
		
		function userAgeTime(data){
			let ageData = [];
			let t0Data = [];
			let t1Data = [];
			let t2Data = [];
			let t3Data = [];
			let t4Data = [];
			let t5Data = [];
			let t6Data = [];
			let t7Data = [];
			let t8Data = [];
			let t9Data = [];
			let t10Data = [];
			let t11Data = [];
			let t12Data = [];
			let t13Data = [];
			let t14Data = [];
			let t15Data = [];
			let t16Data = [];
			let t17Data = [];
			let t18Data = [];
			let t19Data = [];
			let t20Data = [];
			let t21Data = [];
			let t22Data = [];
			let t23Data = [];
			
			for(let item of data.userAgeTime) { 
				let age = item.age; 
				
				ageData.push(age);
				t0Data.push(item.t0); 
				t1Data.push(item.t1); 
				t2Data.push(item.t2); 
				t3Data.push(item.t3); 
				t4Data.push(item.t4); 
				t5Data.push(item.t5); 
				t6Data.push(item.t6); 
				t7Data.push(item.t7); 
				t8Data.push(item.t8);
				t9Data.push(item.t9); 
				t10Data.push(item.t10); 
				t11Data.push(item.t11); 
				t12Data.push(item.t12); 
				t13Data.push(item.t13); 
				t14Data.push(item.t14); 
				t15Data.push(item.t15);
				t16Data.push(item.t16); 
				t17Data.push(item.t17); 
				t18Data.push(item.t18); 
				t19Data.push(item.t19); 
				t20Data.push(item.t20); 
				t21Data.push(item.t21); 
				t22Data.push(item.t22); 
				t23Data.push(item.t23); 
				
			}
			
		 
			var chartDom = document.getElementById('chart-container');
			var myChart = echarts.init(chartDom);
			var option;

			option = {
			  tooltip: {
			    trigger: 'axis'
			  },
			  legend: {
			    data: ageData
			  },
			  grid: {
			    left: '3%',
			    right: '4%',
			    bottom: '3%',
			    containLabel: true
			  },
			  xAxis: {
			    type: 'category',
			    boundaryGap: false,
			    data: ['12 ~ 01', '01 ~ 02', '02 ~ 03', '03 ~ 04', '04 ~ 05', '05 ~ 06', '06 ~ 07', '06 ~ 07', '07 ~ 08', '08 ~ 09', '09 ~ 10', '10 ~ 11', 
			    	'11 ~ 12', '12 ~ 13', '13 ~ 14', '14 ~ 15', '15 ~ 16', '16 ~ 17', '17 ~ 18', '18 ~ 19', '19 ~ 20', '20 ~ 21', '21 ~ 22', '23 ~ 24']
			  },
			  yAxis: {
			    type: 'value'
			  },
			  series: [
			    {
			      name: ageData[0],
			      type: 'line',
			      stack: 'Total',
			      data: [t0Data[0], t1Data[0], t2Data[0], t3Data[0], t4Data[0], t5Data[0], t6Data[0], t7Data[0], t8Data[0], t9Data[0], t10Data[0],
			    	  t11Data[0], t12Data[0], t13Data[0], t14Data[0], t15Data[0], t16Data[0], t17Data[0], t18Data[0], t19Data[0], t20Data[0], t21Data[0], t22Data[0], t23Data[0]]
			    },
			    {
			      name: ageData[1],
			      type: 'line',
			      stack: 'Total',
			      data: [t0Data[1], t1Data[1], t2Data[1], t3Data[1], t4Data[1], t5Data[1], t6Data[1], t7Data[1], t8Data[1], t9Data[1], t10Data[1],
			    	  t11Data[1], t12Data[1], t13Data[1], t14Data[1], t15Data[1], t16Data[1], t17Data[1], t18Data[1], t19Data[1], t20Data[1], t21Data[1], t22Data[1], t23Data[1]]
			    },
			    {
			      name: ageData[2],
			      type: 'line',
			      stack: 'Total',
			      data: [t0Data[2], t1Data[2], t2Data[2], t3Data[2], t4Data[2], t5Data[2], t6Data[2], t7Data[2], t8Data[2], t9Data[2], t10Data[2],
			    	  t11Data[2], t12Data[2], t13Data[2], t14Data[2], t15Data[2], t16Data[2], t17Data[2], t18Data[2], t19Data[2], t20Data[2], t21Data[2], t22Data[2], t23Data[2]]
			    },
			    {
			      name: ageData[3],
			      type: 'line',
			      stack: 'Total',
			      data: [t0Data[3], t1Data[3], t2Data[3], t3Data[3], t4Data[3], t5Data[3], t6Data[3], t7Data[3], t8Data[3], t9Data[3], t10Data[3],
			    	  t11Data[3], t12Data[3], t13Data[3], t14Data[3], t15Data[3], t16Data[3], t17Data[3], t18Data[3], t19Data[3], t20Data[3], t21Data[3], t22Data[3], t23Data[3]]
			    },
			    {
			      name: ageData[4],
			      type: 'line',
			      stack: 'Total',
			      data: [t0Data[4], t1Data[4], t2Data[4], t3Data[4], t4Data[4], t5Data[4], t6Data[4], t7Data[4], t8Data[4], t9Data[4], t10Data[4],
			    	  t11Data[4], t12Data[4], t13Data[4], t14Data[4], t15Data[4], t16Data[4], t17Data[4], t18Data[4], t19Data[4], t20Data[4], t21Data[4], t22Data[4], t23Data[4]]
			    },
			    {
			      name: ageData[5],
			      type: 'line',
			      stack: 'Total',
			      data: [t0Data[5], t1Data[5], t2Data[5], t3Data[5], t4Data[5], t5Data[5], t6Data[5], t7Data[5], t8Data[5], t9Data[5], t10Data[5],
			    	  t11Data[5], t12Data[5], t13Data[5], t14Data[5], t15Data[5], t16Data[5], t17Data[5], t18Data[5], t19Data[5], t20Data[5], t21Data[5], t22Data[5], t23Data[5]]
			    }
			  ]
			};

			option && myChart.setOption(option);

		}
		

	});
	
});

$(function(){
	let url = "${pageContext.request.contextPath}/analysis/zoonUsageCountAnalysis";
	
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

$(function(){
	let url = "${pageContext.request.contextPath}/analysis/zoonSalesAnalysis";
	
	$.getJSON(url, function(data){
		console.log(data);
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

<div style="margin-top: 5rem;  margin-bottom: 5rem;">
	<div class="title mt-4">
		<span>통계</span>
	</div>
		<div class="mt-4">
		<div class="d-flex justify-content-between"> 
			<div class="card p-4" style="width: 30%;">
				<img src="${pageContext.request.contextPath}/resources/images/sales.png" class="card-img-top" alt="..." style="opacity: 0.5; height: 220px;">
				<div class="card-body p-0 mt-3" style="height: 180px;">
					<h5 class="card-title">매출 통계</h5> 
					<p class="card-text" style="font-size: 15px;">매출 통계는, 이용기록의 금액을 기준으로 전체 년·월·일 매출 통계를 제공하는 서비스입니다.</p>
					<a href="${pageContext.request.contextPath}/analysis/sales" class="aTag">바로가기 ></a>
				</div> 
			</div>
			
			<div class="card p-4" style="width: 30%;">  
				<img src="${pageContext.request.contextPath}/resources/images/user.jpg" class="card-img-top" alt="..." style="opacity: 0.5; height: 220px;">
				<div class="card-body p-0 mt-3" style="height: 180px;">
					<h5 class="card-title">이용자 통계</h5>
					<p class="card-text" style="font-size: 15px;">이용자 통계는, 이용자의 기본 정보와 이용기록을 기준으로 전체 연령대·성별·이용시간별 통계를 제공하는 서비스입니다.</p>
					<a href="${pageContext.request.contextPath}/analysis/user" class="aTag">바로가기 ></a>
				</div>
			</div>
			
			<div class="card p-4" style="width: 30%;">
				<img src="${pageContext.request.contextPath}/resources/images/station.jpg" class="card-img-top" alt="..." style="opacity: 0.5; height: 220px;">
				<div class="card-body p-0 mt-3" style="height: 180px;">
					<h5 class="card-title">대여소별 통계</h5>
					<p class="card-text" style="font-size: 15px;">대여소별 통계는, 이용자의 기본 정보와 이용기록을 기준으로 대여소별  매출과 이용자 통계를 제공하는 서비스입니다.</p>
					<a href="${pageContext.request.contextPath}/analysis/station" class="aTag">바로가기 ></a> 
				</div>
			</div>
		</div>
	<br><br> 
	<div class="d-flex justify-content-between">
		<div class="card p-4" style="width: 49%;">
			<div class="text-start sales">전일 시간대별 인원수</div>
			<div id="chart-container1" style="height: 300px;"></div>
		</div>	
		<div class="card p-4"  style="width: 49%">
			<div class="text-start sales">구별 매출</div>
			<div id="chart-container2" style="height: 300px;"></div>
		</div>
	</div>
	<br>
	<div class="d-flex justify-content-between mb-3">
		<div class="card mt-3  p-4" style="width: 100%;">
			<div class="mb-4 text-start sales">연령대별 이용시간대</div>
			<div id="chart-container" style="width: 100%; height: 500px;"></div>
		</div>	
	</div>
	<br>
	<div class="d-flex justify-content-between mb-3">
		<div class="card p-4" style="width: 32%;"> 
			<div class="mb-4 text-start sales">이용건수 Top 5</div>
			<table class="table table-hover m-0 board-list">
			<thead>  
				<tr class="text-center">
					<th style="width: 10%">#</th> 
					<th style="width: 40%">대여소명</th>
					<th style="width: 30%">이용건수</th> 
				</tr>
			</thead> 
			<tbody>
				<c:forEach var="dto" items="${rankTopCount}" end="4">
				<tr class="text-center"> 
					<td>0${dto.usageRank}</td> 
				<td class="stationName">${dto.name}</td> 
				<td>${dto.usageCount}건</td>
				</tr>
				</c:forEach> 
			</tbody>
			</table> 
		</div>
		<br>
		<div class="card  p-4" style="width: 32%;"> 
			<div class="mb-4 text-start sales">이용금액 Top 5</div>	
			<table class="table table-hover m-0 board-list">
				<thead>  
					<tr class="text-center">
						<th style="width: 10%">#</th> 
						<th style="width: 40%">대여소명</th>
						<th style="width: 30%">이용금액</th> 
					</tr>
				</thead> 
				<tbody>
					<c:forEach var="dto" items="${rankTopPrice}" end="4">
						<tr class="text-center"> 
							<td>0${dto.usageRank}</td> 
						<td class="stationName">${dto.name}</td> 
						<td><fmt:formatNumber value="${dto.price}" pattern="#,###"/>원</td> 
						</tr>
					</c:forEach> 
				</tbody>
			</table> 
		</div>
		<br>
		<div class="card  p-4" style="width: 32%;">  
			<div class="mb-4 text-start sales">이동거리 Top 5 [대여 기준]</div>
			<table class="table table-hover m-0 board-list">
				<thead>  
					<tr class="text-center">
						<th style="width: 10%">#</th> 
						<th style="width: 40%">대여소명</th>
						<th style="width: 30%">이동거리</th> 
					</tr>
				</thead> 
				<tbody>
					<c:forEach var="dto" items="${rankTopDistance}" end="4">
						<tr class="text-center"> 
							<td>0${dto.usageRank}</td> 
							<td class="stationName">${dto.name}</td> 
							<td>${dto.distance}km</td>
						</tr>
					</c:forEach> 
				</tbody>
			</table> 
		</div>
	</div>
	<br>
	<div class="mb-3">
		<div class="card  p-4"> 
		<div class="mb-4 text-start sales">이용시간 Top 5</div> 
		<table class="table table-hover m-0 board-list">
			<thead>  
				<tr class="text-center">
					<th style="width: 10%">#</th> 
					<th style="width: 30%">출발 대여소명</th>
					<th style="width: 10%"></th>
					<th style="width: 30%">도착 대여소명</th>
					<th style="width: 20%">이용시간</th> 
				</tr>
			</thead> 
			<tbody>
				<c:forEach var="dto" items="${rankTopUseTime}" end="4" varStatus="status">
					<tr class="text-center"> 
						<td>0${dto.usageRank}</td> 
						<td class="stationName">${dto.startName}</td>  
						<td class="arrow"><i class="fa-solid fa-arrow-right"></i></td>
						<td class="stationName">${dto.endName}</td> 
						<td>${dto.usetime}분</td>
					</tr> 
				</c:forEach>
			</tbody>
		</table> 
		</div>
	</div>
</div>
</div>