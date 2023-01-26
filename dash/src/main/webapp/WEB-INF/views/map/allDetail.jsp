<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.table .ellipsis {
   position: relative;
   min-width: 200px;
}
.table .ellipsis span {
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
   position: absolute;
   left: 9px;
   right: 9px;
   cursor: pointer;
}
.table .ellipsis:before {
   content: '';
   display: inline-block;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
$(function(){
   let menu = "${menuItem}";
   $("#tab-"+menu).addClass("active");
   
    $("button[role='tab']").on("click", function(e){
      const tab = $(this).attr("data-tab");
      let url = "${pageContext.request.contextPath}/map/"+tab+"/allDetail";
      location.href=url;
    });
});

</script>

<div>
   <div class="title mt-4">
      <span>종합 기준</span>
   </div>
   <div class="m-auto mt-4">
   	  <div class="box alert bg-sub" style="border-radius: 0 0 0 0 / 0 0 0 0">
   	  		DASH가 제공하는 종합 기준은 다음과 같습니다.<br>
   	  		* 지하철 유동인구가 많은 역 근처의 대여소는 킥보드 이용확률이 높기 때문에 지하철 승하차 인원 정보 활용<br> 
   	  		* 역 근처의 따릉이 대여소 중 이용건수가 높은 역일수록 킥보드 이용확률이 높기 때문에 따릉이 대여소 정보 활용<br>
   	  		* 출퇴근 시간에 킥보드를 이용하는 직장인들이 많기 때문에 종사자 수를 파악할 수 있는 구별 종사자 인원 정보 활용<br>
   	  		* 퍼스널 모빌리티 이용 나이대 중 20대가 가장 활발히 이용하기 때문에 대학생 수를 파악할 수 있는 구별 대학생 학령인구 정보 활용<br><br>
   	  		<span style="font-weight: bold;">지하철 승하차 총 인원 점수<span class="point">(40점)</span> + 역 근처의 따릉이 대여소 중 따릉이 이용건수 점수<span class="point">(40점)</span> + 구별 종사자 인원 점수<span class="point">(10점)</span> + 구별 대학생 인원 점수<span class="point">(10점)</span> = <span class="point">총점 100점</span></span> 
	  </div>
      <ul class="nav nav-tabs" id="myTab" role="tablist">
         <li class="nav-item" role="presentation">
            <button class="nav-link" id="tab-6" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="receive" aria-selected="true" data-tab="6" style="color: black;">6개월</button>
         </li>
         <li class="nav-item" role="presentation">
            <button class="nav-link" id="tab-3" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="send" aria-selected="true" data-tab="3" style="color: black;">3개월</button>
         </li>
         <li class="nav-item" role="presentation">
            <button class="nav-link" id="tab-1" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="send" aria-selected="true" data-tab="1" style="color: black;">1개월</button>
         </li>
      </ul>
         
      <div class="tab-content pt-2" id="nav-tabContent">
         <div class="tab-pane fade show active mt-3" id="nav-content" role="tabpanel" aria-labelledby="nav-tab-content">
         
               <table class="table table-hover msg-list-table">
                  <thead class="bg-main text-white">
                     <tr class="text-center">
                     	<th style="width: 5%;">순위</th> 
                        <th style="width: 15%;">역사명</th>
                        <th style="width: 10%;">호선</th>
                        <th style="width: 15%;">분석 날짜</th>
                        <th style="width: 10%;">유동인구</th>
                        <th style="width: 10%;">따릉이</th>
                        <th style="width: 10%;">구별 종사자</th>
                        <th style="width: 10%;">구별 대학생</th>
                        <th style="width: 10%;">총합</th>                   		
                     </tr>  
                  </thead>
                  
                  <tbody>
                     <c:forEach var="dto" items="${list}" varStatus="status">
                        <tr class="text-center">
                           <td>${status.index+1}</td> 
                           <td>${dto.name}</td>
                           <td>${dto.line}</td>
                           <td>${dto.month}</td>
                           <td>${dto.s1}</td>
                           <td>${dto.s2}</td>
                           <td>${dto.s3}</td>
                           <td>${dto.s4}</td>
                           <td><span class="point">${dto.sum}</span></td>                          
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>                 

               <div class="col text-end"> 
                  &nbsp;
               </div>
            </div>
         
         </div>
      </div>
</div>
