<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>

<script type="text/javascript">

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
			$("#content").html("<div id='title'>년별 매출 현황 : <br>" + yearData[0] + " ~ " + yearData[4] + "</div>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");
			  
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
					$("#content").html("<div id='title'>년별 매출 현황 : " + yearData[0] + " ~ " + yearData[4] + "</div>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");
					  
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
					$("#content").html("<div id='title'>년별 매출 현황 : <br>" + monthData[0] + " ~ " + monthData[11] + "</div>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");
					
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
					let graph = getDates();
					let x = [];
					for(item of getDates()){
						x.push(item.day);
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
					
					// $("#content").html("<div id='title'>년별 매출 현황 : " + monthData[0] + " ~ " + monthData[11] + "</div>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");
						
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
