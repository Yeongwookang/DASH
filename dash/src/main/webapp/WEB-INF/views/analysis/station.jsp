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
		$("#title").html("");
	} else if(value == "1"){  
		$(function(){
			let url = "${pageContext.request.contextPath}/analysis/userAge"; 
			
			$.getJSON(url, function(data){ 
				userAge(data);
				console.log(data); 
				
				function userAge(data){
					var chartDom = document.getElementById('main');
					var myChart = echarts.init(chartDom);
					var option;

					option = {
					  title: {
					    text: 'Stacked Line'
					  },
					  tooltip: {
					    trigger: 'axis'
					  },
					  legend: {
					    data: ['Email', 'Union Ads', 'Video Ads', 'Direct', 'Search Engine']
					  },
					  grid: {
					    left: '3%',
					    right: '4%',
					    bottom: '3%',
					    containLabel: true
					  },
					  toolbox: {
					    feature: {
					      saveAsImage: {}
					    }
					  },
					  xAxis: {
					    type: 'category',
					    boundaryGap: false,
					    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
					  },
					  yAxis: {
					    type: 'value'
					  },
					  series: [
					    {
					      name: 'Email',
					      type: 'line',
					      stack: 'Total',
					      data: [120, 132, 101, 134, 90, 230, 210]
					    },
					    {
					      name: 'Union Ads',
					      type: 'line',
					      stack: 'Total',
					      data: [220, 182, 191, 234, 290, 330, 310]
					    },
					    {
					      name: 'Video Ads',
					      type: 'line',
					      stack: 'Total',
					      data: [150, 232, 201, 154, 190, 330, 410]
					    },
					    {
					      name: 'Direct',
					      type: 'line',
					      stack: 'Total',
					      data: [320, 332, 301, 334, 390, 330, 320]
					    },
					    {
					      name: 'Search Engine',
					      type: 'line',
					      stack: 'Total',
					      data: [820, 932, 901, 934, 1290, 1330, 1320]
					    }
					  ]
					};

					option && myChart.setOption(option);
	
				}

			});
			
		});
	} else if(value == "2"){  
		$(function(){
			let url = "${pageContext.request.contextPath}/analysis/userGender"; 
			
			$.getJSON(url, function(data){ 
				userGender(data);
				console.log(data); 
				
				function userGender(data){
					var chartDom = document.getElementById('chartContainer');
					var myChart = echarts.init(chartDom);
					var option;
					
					$("#title").html("이용자 성별 통계");

					option = {
					  tooltip: {
					    trigger: 'item'
					  },
					  legend: {
					    orient: 'vertical',
					    left: 'left'
					  },
					  series: [
					    {
					      name: '이용자 성별 통계',
					      type: 'pie',
					      radius: '50%',
					      data: data.gender, 
					      emphasis: {
					        itemStyle: {
					          shadowBlur: 10,
					          shadowOffsetX: 0,
					          shadowColor: 'rgba(0, 0, 0, 0.5)'
					        }
					      }
					    }
					  ]
					};

					option && myChart.setOption(option);
	
				}

			});
			
		});
	} else if(value == "4"){  
		$(function(){
			let url = "${pageContext.request.contextPath}/analysis/userUseTime"; 
			
			$.getJSON(url, function(data){ 
				userGender(data);
				console.log(data); 
				
				function userGender(data){
					var chartDom = document.getElementById('chartContainer');
					var myChart = echarts.init(chartDom);
					var option;
					
					$("#title").html("이용자 시간대별 통계");

					option = {
					  tooltip: {
					    trigger: 'item'
					  },
					  legend: {
					    orient: 'vertical',
					    left: 'left'
					  },
					  series: [
					    {
					      name: '이용자 성별 통계',
					      type: 'pie',
					      radius: '50%',
					      data: [
						        { value: data.useTime.t0, name: '00 ~ 01' },
						        { value: data.useTime.t1, name: '01 ~ 02' },
						        { value: data.useTime.t2, name: '02 ~ 03' },
						        { value: data.useTime.t3, name: '03 ~ 04' },
						        { value: data.useTime.t4, name: '04 ~ 05' },
						        { value: data.useTime.t5, name: '05 ~ 06' },
						        { value: data.useTime.t6, name: '06 ~ 07' },
						        { value: data.useTime.t7, name: '07 ~ 08' },
						        { value: data.useTime.t8, name: '08 ~ 09' },
						        { value: data.useTime.t9, name: '09 ~ 10' },
						        { value: data.useTime.t10, name: '10 ~ 11' },
						        { value: data.useTime.t11, name: '11 ~ 12' },
						        { value: data.useTime.t12, name: '12 ~ 13' },
						        { value: data.useTime.t13, name: '13 ~ 14' },
						        { value: data.useTime.t14, name: '14 ~ 15' },
						        { value: data.useTime.t15, name: '15 ~ 16' },
						        { value: data.useTime.t16, name: '16 ~ 17' },
						        { value: data.useTime.t17, name: '17 ~ 18' },
						        { value: data.useTime.t18, name: '18 ~ 19' },
						        { value: data.useTime.t19, name: '19 ~ 20' },
						        { value: data.useTime.t20, name: '20 ~ 21' },
						        { value: data.useTime.t21, name: '21 ~ 22' },
						        { value: data.useTime.t22, name: '22 ~ 23' },
						        { value: data.useTime.t23, name: '23 ~ 24' },
						      ], 
					      emphasis: {
					        itemStyle: {
					          shadowBlur: 10,
					          shadowOffsetX: 0,
					          shadowColor: 'rgba(0, 0, 0, 0.5)'
					        }
					      }
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
		| 대여소별 통계
		</span>
	</div>
	<div>
	<form name="dateForm">
		<div class="d-flex justify-content-end"> 
			<select name="selectDate" id="selectDate" class="form-select" style="width: 10%">
				<option value="" ${selectDate==""?"selected='selected'":""}>선 택</option>
				<option value="1" ${selectDate=="1"?"selected='selected'":""}></option>  
				<option value="2" ${selectDate=="2"?"selected='selected'":""}>성별</option>
				<option value="3" ${selectDate=="3"?"selected='selected'":""}>이용건수</option>
				<option value="4" ${selectDate=="4"?"selected='selected'":""}>이용시간대</option>
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
