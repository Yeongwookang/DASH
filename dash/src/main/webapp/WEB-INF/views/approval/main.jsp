<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div>
	<div class="title mt-4">
		결재관리
	</div>
	
	<hr class="mt-4" style=" margin-bottom: 4rem; border: solid 1px;">
	<div class="mt-4 row">
		<div class="col-2" style="font-size: 1.2rem; font-weight: 700;">
			결재 대기 목록
		</div>
		
		<c:choose >
		<c:when test="${not empty approvalList}">
			<div class="col-10">
			<table class="table table-hover text-center m-0">
				<thead>
        			<tr class="bg-main bg-gradient text-white" style="height: 50px;">
        				<th>#</th>
        				<th style="width: 50%">제목</th>
        				<th style="width: 15%">부서 </th>
        				<th style="width: 10%">직급</th> 
        				<th style="width: 10%">기안자</th>
        				<th style="width: 15%">상태</th>
        			</tr>
       			</thead>
       			<tbody class="approvalList">
       			<c:forEach items="${approvalList}" var="ap" varStatus="status">
       				<tr onclick="location.href='${pageContext.request.contextPath}/approval/read/${ap.signNum}'">
       					<th>${status.count}</th>
       					<td>${ap.title}</td>
       					<td>${ap.depName}</td>
       					<td>${ap.rankName}</td>
       					<td>${ap.name}</td>
       					<td>
       					<c:choose>
       						<c:when test="${ap.state == 0 }">기안</c:when>
       						<c:when test="${ap.state < ap.max_state && ap.state == 1 }">1차 승인</c:when>
       						<c:when test="${ap.state < ap.max_state && ap.state == 2 }">2차 승인</c:when>
       						<c:when test="${ap.state< ap.max_state }">결재 완료</c:when>
       						<c:otherwise>문의</c:otherwise>
       					</c:choose>
       					</td>
       					<td class="signNum" style="display: none">${ap.signNum}</td>
       				</tr>
       			</c:forEach>
       			</tbody>
			</table>
			</div>
		</c:when>
		<c:otherwise>
			<div class="col-10">
			<div class="border">
			<blockquote class="blockquote mt-5 mb-5 text-center text-muted">
		      <p>" 결재 대기중인 목록이 없습니다 "</p>
		    </blockquote>
		    </div>
		    </div>
		</c:otherwise>
		</c:choose>
	</div>
	
	<hr style="margin-top: 4rem; margin-bottom: 4rem; border: solid 1px;">
		
	<div class="mt-4 row">
	<div class="col-2"  style="font-size: 1.2rem; font-weight: 700;" >
		${sessionScope.employee.name}님의 결재
	</div>
	<c:choose >
	<c:when test="${not empty myApprovalList}">
		<div class="col-10">
		<table class="table m-0 table-hover text-center">
			<thead>
       			<tr class="bg-main bg-gradient text-white" style="height: 50px;">
       				<th>#</th>
       				<th style="width: 50%">제목</th>
       				<th style="width: 15%">부서 </th> 
       				<th style="width: 10%">직급</th>
       				<th style="width: 10%">기안자</th>
       				<th style="width: 15%">상태</th>
       			</tr>
      			</thead>
      			<tbody class="myApprovalList">
      			<c:forEach items="${myApprovalList}" var="ap" varStatus="status">
      				<tr onclick="location.href='${pageContext.request.contextPath}/approval/read/${ap.signNum}'">
      					<th>${status.count}</th>
      					<td>${ap.title}</td>
      					<td>${ap.depName}</td>
      					<td>${ap.rankName}</td>
      					<td>${ap.name}</td>
      					<td>
      					<c:choose>
      						<c:when test="${ap.state == 0 }">기안</c:when>
      						<c:when test="${ap.state < ap.max_state && ap.state == 1 }">1차 승인</c:when>
      						<c:when test="${ap.state < ap.max_state && ap.state == 2 }">2차 승인</c:when>
      						<c:when test="${ap.state< ap.max_state }">결재 완료</c:when>
      						<c:otherwise>문의</c:otherwise>
      					</c:choose>
      					</td>
      					<td style="display: none">${ap.signNum}</td>
      				</tr>
      			</c:forEach>
      			</tbody>
		</table>
		<div class="mt-4">${paging}</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="col-10">
		<div class="border">
			<blockquote class="blockquote mt-5 mb-5 text-center text-muted">
		      <p>" ${sessionScope.employee.name}님이 작성한 결재가 없습니다 "</p>
		    </blockquote>
	    </div>
	    </div>
	</c:otherwise>
	</c:choose>
	</div>
	<hr style="margin-top: 4rem; border: solid 1px;">
			





<div class="mt-4 mb-4 d-flex justify-content-end">	
		<button class="btn btn-sub bg-gradient" type="button" onclick="location.href='${pageContext.request.contextPath}/approval/write'">신규 결재</button>
</div>
</div>


<script type="text/javascript">
	$(".sendList").children().click(function(){
		let signNum = this.querySelector(".signNum").textContent;
		location.href="${pageContext.request.contextPath}/approval/read/"+signNum;
	});
	
	$(function(){
		if(Number("${fn:length(approvalList)}")<5 && Number("${fn:length(approvalList)}>0") ){
			let size = 5-${fn:length(approvalList)};
			for(let i=0; i<size; i++){
				$(".approvalList").append("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
			}
		}
		
		if(Number("${fn:length(myApprovalList)}")<5 && Number("${fn:length(approvalList)}")>0){
			let size = 5-Number("${fn:length(myApprovalList)}");
			for(let i=0; i<size; i++){
				$(".myApprovalList").append("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
			}
		}
	});
	
	$(".searchTimeline").click(function(){
		let url = "${pageContext.request.contextPath}/approval/searchTimeline";
		let condition = $("#condition_tl").val;
		let keyword = $("#keyword_tl").val;
		let query = "condition="+condition+"&keyword="+keyword;
		
		const fn = function(data){
			for(let item of data.listTimeline){
				let tlNum = item.tlNum;
				let tlName = item.tlName;
				let tlState = item.state;
				let tlMax_state = item.max_state;
				let tlEmpNo = item.empNo;
				
				let out="<tr class='searched "+tlNum+"'>";
				out +="<td class='tlEmpNo'><input style='display:none' type='text' value="+empNo+"></td>";
				out +="<td class='tlState'>"+Math.round(tlState/tlMax_state)+"%</td>";
				out +="<td class='tlName'>"+tlName+"</td>";
				out +="</tr>"
				
				$(".timelineResult").append(out);	
				$(".searched ."+tlNum).click(function(){
					alert('메롱');
				});
			}
		};
		
		ajaxFun(url, "get", query, "JSON", fn);
	});
	

</script>
