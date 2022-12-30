<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>

<script type="text/javascript">


function searchList() {
	const f = document.stationForm; 
	
	let value1 = f.selectCondition.value;
	let stNum = f.selectStation.value;
	
	var target = document.getElementById("selectStation");
	let name = target.options[target.selectedIndex].text;
	
	if(value1 == "1"){
		
		$(function(){
			let url = "${pageContext.request.contextPath}/analysis/stationTotalMoney?stNum="+ stNum; 
			
			$.getJSON(url, function(data){ 
				stationTotalMoney(data);
				console.log(data); 
				
				function stationTotalMoney(data){
					var chartDom = document.getElementById('chartContainer');
					var myChart = echarts.init(chartDom);
					var option;
					
					$("#title").html(name + " : 년도별 통계");  

					var chartDom = document.getElementById('main');
					var myChart = echarts.init(chartDom);
					var option;

					option = {
					  xAxis: {
					    type: 'category',
					    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
					  },
					  yAxis: {
					    type: 'value'
					  },
					  series: [
					    {
					      data: [150, 230, 224, 218, 135, 147, 260],
					      type: 'line'
					    }
					  ]
					};

					option && myChart.setOption(option);

				}

			});
			
		});
	} else if(value1 == "4"){
		
		$(function(){
			let url = "${pageContext.request.contextPath}/analysis/stationAge?stNum="+ stNum; 
			
			$.getJSON(url, function(data){ 
				stationAge(data);
				console.log(data); 
				
				function stationAge(data){
					var chartDom = document.getElementById('chartContainer');
					var myChart = echarts.init(chartDom);
					var option;
					
					$("#title").html(name + " : 이용자 연령대 통계");  

					option = {
					  tooltip: {
					    trigger: 'item'
					  },
					  legend: {
					    top: '5%',
					    left: 'center'
					  },
					  series: [
					    {
					      name: '이용자 연령대',
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
					      data: data.stationAge
					    } 
					  ]
					};

					option && myChart.setOption(option);

	
				}

			});
			
		});
	} else if(value1 == "5"){ 
		
		$(function(){
			let url = "${pageContext.request.contextPath}/analysis/stationGender?stNum="+ stNum; 
			
			$.getJSON(url, function(data){ 
				stationGender(data);
				console.log(data); 
				
				function stationGender(data){
					var chartDom = document.getElementById('chartContainer');
					var myChart = echarts.init(chartDom);
					var option;
					
					$("#title").html(name + " : 이용자 성별 통계");  

					option = {
					  tooltip: {
					    trigger: 'item'
					  },
					  legend: {
					    top: '5%',
					    left: 'center'
					  },
					  series: [
					    {
					      name: '이용자 성별',
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
					      data: data.stationGender
					    } 
					  ]
					};

					option && myChart.setOption(option);

	
				}

			});
			
		});
	} else if(value1 == "6"){ 
		
		$(function(){
			let url = "${pageContext.request.contextPath}/analysis/stationUseTime?stNum="+ stNum; 
			
			$.getJSON(url, function(data){ 
				stationUseTime(data);
				console.log(data); 
				
				function stationUseTime(data){
					var chartDom = document.getElementById('chartContainer');
					var myChart = echarts.init(chartDom);
					var option;
					
					$("#title").html(name + " : 이용시간대별 통계");  

					option = {
					  tooltip: {
					    trigger: 'item'
					  },
					  legend: {
					    top: '5%',
					    left: 'center'
					  },
					  series: [
					    {
					      name: '이용시간대',
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
						        { value: data.stationUseTime.t0, name: '00 ~ 01' },
						        { value: data.stationUseTime.t1, name: '01 ~ 02' },
						        { value: data.stationUseTime.t2, name: '02 ~ 03' },
						        { value: data.stationUseTime.t3, name: '03 ~ 04' },
						        { value: data.stationUseTime.t4, name: '04 ~ 05' },
						        { value: data.stationUseTime.t5, name: '05 ~ 06' },
						        { value: data.stationUseTime.t6, name: '06 ~ 07' },
						        { value: data.stationUseTime.t7, name: '07 ~ 08' },
						        { value: data.stationUseTime.t8, name: '08 ~ 09' },
						        { value: data.stationUseTime.t9, name: '09 ~ 10' },
						        { value: data.stationUseTime.t10, name: '10 ~ 11' },
						        { value: data.stationUseTime.t11, name: '11 ~ 12' },
						        { value: data.stationUseTime.t12, name: '12 ~ 13' },
						        { value: data.stationUseTime.t13, name: '13 ~ 14' },
						        { value: data.stationUseTime.t14, name: '14 ~ 15' },
						        { value: data.stationUseTime.t15, name: '15 ~ 16' },
						        { value: data.stationUseTime.t16, name: '16 ~ 17' },
						        { value: data.stationUseTime.t17, name: '17 ~ 18' },
						        { value: data.stationUseTime.t18, name: '18 ~ 19' },
						        { value: data.stationUseTime.t19, name: '19 ~ 20' },
						        { value: data.stationUseTime.t20, name: '20 ~ 21' },
						        { value: data.stationUseTime.t21, name: '21 ~ 22' },
						        { value: data.stationUseTime.t22, name: '22 ~ 23' },
						        { value: data.stationUseTime.t23, name: '23 ~ 24' },
						      ]
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
	<form name="stationForm">
		<div class="d-flex justify-content-end">  
			<select name="selectCondition" id="selectCondition" class="form-select me-2" style="width: 10%">
				<option value="1" ${selectDate=="1"?"selected='selected'":""}>년</option>
				<option value="2" ${selectDate=="2"?"selected='selected'":""}>월</option>
				<option value="3" ${selectDate==""?"selected='selected'":""}>일</option>
				<option value="4" ${selectDate=="3"?"selected='selected'":""}>연령대</option>
				<option value="5" ${selectDate=="4"?"selected='selected'":""}>성별</option>
				<option value="6" ${selectDate=="5"?"selected='selected'":""}>이용시간대</option>
			</select>
			<select name="selectStation" id="selectStation" class="form-select" style="width: 20%">
				<c:forEach var="dto" items="${list}">
					<option value="${dto.stNum}" ${selectDate=="${dto.stNum}"?"selected='selected'":""}>${dto.name}</option>  
				</c:forEach>
			</select>
			<button type="button" class="btn button-main bg-gradient ms-2" onclick="searchList();"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div> 
	</form>
	</div>
	<div class="mt-4"> 
		<div class="box-container">
			<div id="title" class="text-center"></div>  
	   		<div id="chartContainer" class="box" style="width: 100%; height: 600px;"></div> 
		</div>
	</div>
</div> 
