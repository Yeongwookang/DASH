<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>

<script type="text/javascript">
$(function(){
	searchList();
});

function searchList() {
	const f = document.userForm; 
	
	let value = f.selectUser.value;
	if(value == "1"){  
		
		let url = "${pageContext.request.contextPath}/analysis/userAge"; 
		
		$.getJSON(url, function(data){ 
			userAge(data);
			console.log(data); 
			
			function userAge(data){
				let ageData = [];
				let valueData = [];
				
				for(item of data.age){
					ageData.push(item.name);
					valueData.push(item.value);
				}
				
				var chartDom = document.getElementById('chartContainer');
				var myChart = echarts.init(chartDom);
				var option;
				
				$("#content").html("<div id='title'>이용자 나이별  현황  <br><br></div>이용자 연령별 현황은 기존 이용자 정보를 기준으로 하여 " 
						+ ageData[0] + "부터 " + ageData[ageData.length - 1] + "까지의  각 연령대별 이용자 수를 종합한 자료입니다. " + ageData[0] + "과 " + ageData[1] + "이 각각 " + valueData[0] + "명으로 가장 많이 이용하고 있었습니다.");
				 
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
				      name: '이용자 나이별',
				      type: 'pie',
				      radius: '50%',
				      data: data.age, 
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

	} else if(value == "2"){  
		
		let url = "${pageContext.request.contextPath}/analysis/userGender"; 
		
		$.getJSON(url, function(data){ 
			userGender(data);
			console.log(data); 
			
			function userGender(data){
				let genderData = [];
				
				for(item of data.gender){
					genderData.push(item.value);
				}
				
				var chartDom = document.getElementById('chartContainer');
				var myChart = echarts.init(chartDom);
				var option;
				
				$("#content").html("<div id='title'>이용자 성별  현황  <br><br></div>이용자 성별 현황은 기존 이용자 정보를 기준으로 하여 M(남성)과 F(여성)의 이용자 수를 종합한 자료입니다. 총 이용자 중 M(남성)이 " 
						+ genderData[1] + "명을 기록했으며, F(여성)은 " + genderData[0] + "명으로 M(남성)이 조금 더 많이 이용하는 것으로 나타났습니다.");
				 
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
				      name: '이용자 성별',
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
			
	} else if(value == "3"){  
		let url = "${pageContext.request.contextPath}/analysis/userUseTime"; 
		
		$.getJSON(url, function(data){ 
			userUseTime(data);
			console.log(data); 
			
			function userUseTime(data){
				var chartDom = document.getElementById('chartContainer');
				var myChart = echarts.init(chartDom);
				var option;
				
				$("#content").html("<div id='title'>이용자 시간대별  현황  <br><br></div>이용시간대별 현황은 기존 이용자 정보와 이용기록을 기준으로 하여  종합한 자료입니다. 가장 많이 이용한 시간대는 12~13시, 14~15시, 17~18시로 각각" 
						+ data.useTime.t12 + "명을 기록했습니다.");
				 
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
				      name: '이용자 시간대별',
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
		
	}   
}

</script>


<div>
	<div class="d-flex justify-content-between mt-4">
		<div class="title">
		이용자 통계
		</div>
		<div>
		<form name="userForm">
			<div class="d-flex justify-content-end"> 
				<select name="selectUser" id="selectUser" class="form-select">
					<option value="1" ${selectDate=="1"?"selected='selected'":""}>나이</option>  
					<option value="2" ${selectDate=="2"?"selected='selected'":""}>성별</option>
					<option value="3" ${selectDate=="3"?"selected='selected'":""}>이용시간대</option>
				</select>
				<button type="button" class="btn btn-sub ms-2" onclick="searchList();"><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>   
		</form>
		</div>
	</div>
		
	<div class="mt-4">  
		<div class="box-container d-flex">     
	   		<div id="chartContainer" class="box" style="width: 80%; height: 600px;"></div> 
	   		<div class="scroll mt-5" id="content" style="height: 600px; width: 20%; overflow-y:scroll;"></div>
		</div>
	</div>
</div> 
