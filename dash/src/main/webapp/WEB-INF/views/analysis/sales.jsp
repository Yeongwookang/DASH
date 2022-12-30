<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#chartContainer").html("<div class='none text-center mt-5'>데이터가 존재하지 않습니다.</div>"); 
});   

function searchList() {
	const f = document.dateForm; 
	
	let value = f.selectDate.value;
	if(value == ""){ 
		$("#chartContainer").html("<div class='none text-center mt-5'>데이터가 존재하지 않습니다.</div>"); 
	} else if(value == "1"){  
		$(function(){
			let url = "${pageContext.request.contextPath}/analysis/yearTotalMoney"; 
			
			$.getJSON(url, function(data){
				yearTotalMoney(data);
				
				function yearTotalMoney(data){
					let yearData = [];
					let moneyData = [];
					
					for(let item of data.years) {
						let y = item.USEDATE + '년'; 
				 
						let money = item.TOTALMONEY;
						
						yearData.push(y);
						moneyData.push(money); 
					}
					$("#title").html("년별 매출 현황 : " + yearData[0] + " ~ " + yearData[4]);
					 
					var chartDom = document.getElementById('chartContainer');
					var myChart = echarts.init(chartDom);
					var option; 
	
					option = {
					  tooltip: {
					    trigger: 'item',
					    axisPointer: { type: 'cross' } 
					  },
					  xAxis: {
					    type: 'category',
					    data: yearData
					  },
					  yAxis: {
					    type: 'value'
					  },
					  series: [
					    {
					      data: moneyData,
					      type: 'line'
					    }
					  ]
					};
	
					option && myChart.setOption(option);
	
				}
				
	
			});
			
		});
	} else if(value == "2"){
		$(function(){
			let url = "${pageContext.request.contextPath}/analysis/monthTotalMoney"; 
			
			$.getJSON(url, function(data){
				monthTotalMoney(data);
				
				function monthTotalMoney(data){
					let monthData = [];
					let moneyData = [];
					
					for(let item of data.months) {
						let m = parseInt(item.USEDATE.substring(4))+'월';
						let msg = m;
						
						let money = item.TOTALMONEY;
						
						monthData.push(msg);
						moneyData.push(money);
					}
					$("#title").html("월별 매출 현황 : " + monthData[0] + " ~ " + monthData[11]);
					
					var chartDom = document.getElementById('chartContainer');
					var myChart = echarts.init(chartDom);
					var option; 
	
					option = {
					  tooltip: {
					    trigger: 'item',
					    axisPointer: { type: 'cross' } 
					  },
					  xAxis: {
					    type: 'category',
					    data: monthData
					  },
					  yAxis: {
					    type: 'value'
					  },
					  series: [
					    {
					      data: moneyData,
					      type: 'line'
					    }
					  ]
					};
	
					option && myChart.setOption(option);
	
				}
				
	
			});
			
		});
	} else if(value == "3"){
		$(function(){
			let url = "${pageContext.request.contextPath}/analysis/dayTotalMoney"; 
			
			$.getJSON(url, function(data){
				console.log(data);
				dayTotalMoney(data);
				
				function dayTotalMoney(data){
					let dayData = [];
					let moneyData = [];
					
					dayData.length = data.lastDay;
					moneyData.length = data.lastDay;
					console.log(dayData);
					
					for(let item of data.days) {
						let day = parseInt(item.USEDATE.substring(6))+'일';
						let money = item.TOTALMONEY;
						
						dayData.push(day); 
						moneyData.push(money);
					}
					$("#title").html("월별 매출 현황 : " + dayData[0] + " ~ " + dayData[11]);
					
					var chartDom = document.getElementById('chartContainer');
					var myChart = echarts.init(chartDom);
					var option; 
	
					option = {
					  tooltip: {
					    trigger: 'item',
					    axisPointer: { type: 'cross' } 
					  },
					  xAxis: {
					    type: 'category',
					    data: dayData
					  },
					  yAxis: {
					    type: 'value'
					  },
					  series: [
					    {
					      data: moneyData,
					      type: 'line'
					    }
					  ]
					};
	
					option && myChart.setOption(option);
	
				}
				
	
			});
			
		});
	}
}




</script>


<div class="scroll m-auto" style="height: 85%; width:90%; overflow-y:scroll;">
	<div class="text-start fs-4 mb-4">
		<span>
		| 매출 통계
		</span>
	</div>
	<div>
	<form name="dateForm">
		<div class="d-flex justify-content-end"> 
			<select name="selectDate" id="selectDate" class="form-select" style="width: 10%">
				<option value="" ${selectDate==""?"selected='selected'":""}>선 택</option>
				<option value="1" ${selectDate=="1"?"selected='selected'":""}>년</option>  
				<option value="2" ${selectDate=="2"?"selected='selected'":""}>월</option>
				<option value="3" ${selectDate=="3"?"selected='selected'":""}>일</option>
			</select>
			<button type="button" class="btn button-main bg-gradient ms-2" onclick="searchList();"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div> 
	</form>
	</div>
	<div class="mt-4">
		<div class="box-container">
			<div id="title" class="text-center mt-3"></div>
	   		<div id="chartContainer" class="box" style="width: 100%; height: 700px;"></div>
		</div>
	</div>
</div> 
