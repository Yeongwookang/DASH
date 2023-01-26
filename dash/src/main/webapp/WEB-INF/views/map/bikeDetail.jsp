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
      let url = "${pageContext.request.contextPath}/map/"+tab+"/bikeDetail";
      location.href=url;
    });
});

</script>

<div>
   <div class="title mt-4">
      <span>따릉이 이용건수 기준</span>
   </div>
   <div class="m-auto mt-4"> 
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
                        <th style="width: 10%;">역사명</th>
                        <th style="width: 10%;">호선</th>
                        <th style="width: 10%;">분석 날짜</th>
                        <th style="width: 5%;">대여소 ID</th> 
                        <th style="width: 10%;">이용건수</th>
                        <th style="width: 10%;">사용시간(분)</th>
                        <th style="width: 10%;">이동거리</th> 
                     </tr>  
                  </thead>
                  
                  <tbody>
                     <c:forEach var="dto" items="${list}" varStatus="status">
                        <tr class="text-center">
                           <td>${status.index + 1}</td>  
                           <td>${dto.name}</td>
                           <td>${dto.line}</td>
                           <td>${dto.month}</td>
                           <td>${dto.station_id}</td>
                           <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${dto.total_count}" /></td>
                           <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${dto.total_min}" />분</td>
                           <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${dto.total_km}" />km</td>
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

