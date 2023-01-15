<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>

<script type="text/javascript">
$(function(){
	searchList();
});

function getDates(){
	var dateArray = [];
	let today = new Date();
	let y = today.getFullYear();
	let m = today.getMonth(); 
	
	let startDate = new Date(y, m, 1); 
	let endDate = new Date(y, m+1, 0); 
	
	while(startDate <= endDate) {
		startDate.toISOString().split('T')[0];
		
		let money = {
				day: startDate.getDate(),
				money: 0
		}
		dateArray.push(money);
		startDate.setDate(startDate.getDate() + 1);
	}
	
	return dateArray; 
}

function searchList() {
	const f = document.dateForm; 
	
	let value = f.selectDate.value;
	if(value == "1"){  
		
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
				$("#content").html("<div id='title'>년별 매출 현황  <br><br></div>년별 매출 현황은 현재 년도를 기준으로 하여 " 
						+ yearData[0] + "부터 " + yearData[4] + "까지의 5개년별 매출을 종합한 자료입니다. " + yearData[0] + "부터 " + yearData[2] + "까지의 매출은 존재하지 않았으나, " + yearData[3] + "에 " + moneyData[3].toLocaleString() + "원의 년 매출이 발생하였습니다.");
				  
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
			
	} else if(value == "2"){
		
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
				$("#content").html("<div id='title'>월별 매출 현황  <br><br></div>월별 매출 현황은 현재 월을 기준으로 하여 " 
						+ monthData[0] + "부터 " + monthData[11] + "까지의 12개월별 매출을 종합한 자료입니다. " + monthData[0] + "부터 " + monthData[8] + "까지의 매출은 존재하지 않았으나, " + monthData[9] + "에 " + moneyData[9].toLocaleString() + "원, " + monthData[10] + "에 " + moneyData[10].toLocaleString() + "원의 매출이 발생하였습니다.");
				  
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
			
	} else if(value == "3"){
		
		let url = "${pageContext.request.contextPath}/analysis/dayTotalMoney"; 
		
		$.getJSON(url, function(data){
			console.log(data);
			dayTotalMoney(data);
			
			function dayTotalMoney(data){
				let graph = getDates();
				let x = [];
				for(item of getDates()){
					x.push(item.day + "일");
				}
				
				for(item of graph){
					for(money of data.days){
						if(item.day == money.USEDATE.substring(6)){
							item.money = money.TOTALMONEY;
						}
					}
				}
				let series = []; 
				for(item of graph){
					series.push(item.money);
				}
				
				$("#content").html("<div id='title'>일별 매출 현황  <br><br></div>일별 매출 현황은 현재 월을 기준으로 하여 " 
						+ x[0] + "부터 " + x[x.length - 1] + "까지의 " + x[x.length - 1] + "일별 매출을 종합한 자료입니다. " + x[0] + "부터 " + x[x.length - 1] + "까지의 매출이 존재하지 않았습니다.");
				 	
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
				    data: x
				  },
				  yAxis: {
				    type: 'value'
				  },
				  series: [
				    {
				      data: series,
				      type: 'line'
				    }
				  ]
				};

				option && myChart.setOption(option);

			}
			

		});
			
	}
}




</script>


<div class=" card mt-5 mb-5 p-4 m-auto">
	<div class="text-start fs-4 mb-4">
		<span>
		| 매출 통계
		</span>
	</div>
	<div>
	<form name="dateForm">
		<div class="d-flex justify-content-end"> 
			<select name="selectDate" id="selectDate" class="form-select" style="width: 10%">
				<option value="1" ${selectDate=="1"?"selected='selected'":""}>년</option>  
				<option value="2" ${selectDate=="2"?"selected='selected'":""}>월</option>
				<option value="3" ${selectDate=="3"?"selected='selected'":""}>일</option>
			</select>
			<button type="button" class="btn button-main bg-gradient ms-2" onclick="searchList();"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div> 
	</form>
	</div>
	<div class="mt-4">  
		<div class="box-container d-flex">     
	   		<div id="chartContainer" class="box" style="width: 80%; height: 600px;"></div> 
	   		<div class="scroll mt-5" id="content" style="height: 600px; width: 20%; overflow-y:scroll;"></div>
		</div>
	</div>
</div> 
