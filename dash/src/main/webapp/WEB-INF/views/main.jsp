<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">

function punchOn(){
	if(confirm("${sessionScope.employee.name}님 출근하시겠습니까?")){
		
		if("${todayPunch.punchOnTime}"==="-"){
			location.href='${pageContext.request.contextPath}/punching/punchOn';
		} else{
			alert('이미 출근했습니다.');
			return;
		}
	}
}

function punchOff(){
	if(confirm("${sessionScope.employee.name}님 퇴근하시겠습니까?"))
	{ 	
		let date = new Date("${todayPunch.punchOnTime}");
		date.setTime(date.getTime()+9*60*60*1000);
		
		if("${todayPunch.punchOnTime}"==="-"){
			alert('${sessionScope.employee.name}님은 출근하지 않았습니다.');
			return;
		}
		
		if((new Date()-date)>=0){
			if("${todayPunch.punchOffTime}"==="-"){
				location.href='${pageContext.request.contextPath}/punching/punchOff';
			} else{
				alert("${sessionScope.employee.name}님은 이미 퇴근했습니다.");
				return;
			}
		} else{
			alert("${sessionScope.employee.name}님은 아직은 퇴근할 수 없습니다.");
			return;
		}
	}
}
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/main.min.css">
	<div class="m-auto mb-5">
	<div id="carouselExampleIndicators" class="carousel slide border mb-4 rounded" data-bs-ride="carousel" style="height: 10rem; background: #ffffff">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="${pageContext.request.contextPath}/resources/images/002.png" class="d-block w-100" alt="..." style="height: 160px">
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/resources/images/001.png" class="d-block w-100" alt="..." style="height: 160px">
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/resources/images/003.png" class="d-block w-100" alt="..." style="height: 160px">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
		<div class="d-flex justify-content-between mb-3">
		<div style="width: 49%">
		<div class="card p-4 mb-4">
			<div class="d-flex justify-content-between align-items-center">
			<div class="d-flex align-items-end" >
				<span class="sales">${msg}</span>
			</div>
			<div>
				<button type="button" class="btn btn-main"  onclick="punchOn();">출근</button>
				<button type="button" class="btn btn-main" onclick="punchOff();">퇴근</button>
				<button type="button" class="btn btn-sub" data-bs-toggle="modal" data-bs-target="#attendance">출퇴근 현황</button>
			</div>
			</div>
			<div class="d-flex justify-content-between mt-4 m-auto w-100">
				<div class="border-end d-flex flex-column justify-content-center" style="width:47%">
					<div class="d-flex">
						<div style="font-weight: bold; color:#495057;">주간근무시간</div>
						<div style="color:#868e96">&nbsp;${attendance.weekAttend} 시간 / ${attendance.weekMax}시간</div>
					</div>
					<div class="d-flex mt-2">
						<div style="font-weight: bold;  color:#495057;">잔여근무시간&nbsp;</div>
						<div class="todayRemain"style="color:#868e96"></div>
					</div>
				</div>
				<div class="w-50 d-flex flex-column justify-content-center"> 	
					<div class="d-flex">
						<div class="me-2" style="font-weight: bold; color:#495057;">오늘 출근 시각 </div>
						<div id="clockOnTime">${todayPunch.punchOnTime}</div>
					</div>
					<div class="d-flex mt-2">
						<div class="me-2" style="font-weight: bold; color:#495057;">오늘 퇴근 시각 </div>
						<div id="clockOffTime">${todayPunch.punchOffTime}</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card p-4 mb-4">
		<div class="d-flex justify-content-between mb-4">
			<div class="text-start sales">연차현황</div>
			<button class="btn btn-sub" type="button" data-bs-toggle="modal" data-bs-target="#holidayHistory">기록</button>
		</div> 
			<div class="m-auto w-100">
				<div>
				<div>연차 (${punDto.leftQty}일 / ${punDto.totalQty}일)</div>
				<div class="progress">
				  <div class="progress-bar bg-main  progress-bar-striped progress-bar-animated" role="progressbar" id="dayoff" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
				</div>
				</div>
				<div class="mt-3">
					<div>특별휴가 (0일 / 0일)</div>
					<div class="progress">
					  <div class="progress-bar bg-main  progress-bar-striped progress-bar-animated" role="progressbar" id="specialVacation" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
			</div>
		</div>
			<div class="card p-4 mb-4 " > 
				<div class="d-flex justify-content-between mb-4">
					<div class="text-start sales">공지사항</div>
					<a href="${pageContext.request.contextPath}/notice/main" class="aTag">바로가기 ></a>
				</div>
					<c:choose>
					<c:when test="${empty listTop && empty list}">
							<blockquote class="blockquote mt-5 mb-5 text-center text-muted"> 
						      <p>" 공지사항이 없습니다 "</p>
						    </blockquote>
					</c:when>
					<c:otherwise>
						<table class="table table-hover board-list-main m-auto w-100" > 
							<thead>  
								<tr class="text-center">
									<th style="width: 10%">#</th> 
									<th style="width: 60%">제목</th>
									<th style="width: 30%">날짜</th>  
								</tr>
							</thead>
							<tbody> 
								<c:forEach var="dto" items="${listTop}" begin="0" end="1">
									<tr class="text-center"> 
										<td><span class="badge bg-danger">공지</span></td> 
										<td>
											<a href="${pageContext.request.contextPath}/notice/article?page=1&num=${dto.num}" class="text-reset underline">${dto.subject}</a>
										</td>
										<td class="communityDate">${dto.reg_date}</td>
									</tr>
								</c:forEach>	
								<c:forEach var="dto" items="${list}" varStatus="status" begin="0" end="2">
									<tr class="text-center">  
										<td>${status.index + 1}</td>
										<td><a href="${pageContext.request.contextPath}/notice/article?page=1&num=${dto.num}" class="text-reset underline">${dto.subject}&nbsp;<c:if test="${dto.gap<1}"><span><img src="${pageContext.request.contextPath}/resources/images/new.png" style="width: 14px;"></span></c:if></a></td>
										<td class="communityDate">${dto.reg_date}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="card p-4 mb-4">
			<div class="d-flex justify-content-between mb-4">
				<div class="text-start sales">진행중인 결재</div>
				<a href="${pageContext.request.contextPath}/approval/main?page=1" class="aTag">바로가기 ></a>
			</div>
					<c:choose >
					<c:when test="${not empty myApprovalList}"> 
						<table class="table text-center table-hover m-auto board-list-main w-100">
							<thead>
			        			<tr>
			        				<th>#</th>
			        				<th style="width: 43%">제목</th>
			        				<th style="width: 15%">부서 </th> 
			        				<th style="width: 10%">직급</th>
			        				<th style="width: 12%">기안자</th>
			        				<th style="width: 15%">상태</th>
			        			</tr>
		        			</thead>
		        			<tbody class="sendList">
		        			<c:forEach items="${myApprovalList}" var="ap" varStatus="status">
		        				<tr>
		        					<th>${status.count}</th>
		        					<td>${ap.title}</td>
		        					<td >${ap.depName}</td>
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
					</c:when>
					<c:otherwise>
						<blockquote class="blockquote mt-5 mb-5 text-center text-muted"> 
					      <p>" ${sessionScope.employee.name}님이 작성한 결재가 없습니다 "</p>
					    </blockquote>
					</c:otherwise>
					</c:choose>
					
				</div>
			</div>
			
			
			<div style="width:49%">
			<div class="card p-4 mb-4">
				<div class="text-start sales">일정</div> 
				<div class="mt-4">
					<div id="calendar"></div>
				</div>
			</div>		
			<div class="card p-4 mb-4" >
				<div class="d-flex justify-content-between mb-4">
					<div class="text-start sales">커뮤니티</div>
					<a href="${pageContext.request.contextPath}/community/main" class="aTag">바로가기 ></a>
				</div>
				<c:choose>
					<c:when test="${empty listCommunity}">
						<blockquote class="blockquote mt-5 mb-5 text-center text-muted"> 
					      <p>" 게시글이 없습니다 "</p>
					    </blockquote>
					</c:when>
					<c:otherwise>
						<table class="table table-hover board-list-main m-auto w-100"> 
								<thead>  
									<tr class="text-center">
										<th style="width: 20%">#</th> 
										<th style="width: 55%">제목</th>
										<th style="width: 25%">날짜</th>  
									</tr>
								</thead> 
								<tbody>
									<c:forEach var="vo" items="${listCommunity}" varStatus="status" begin="0" end="4">
										<c:if test="${vo.open == 1}">
											<tr class="text-center">  
												<td class="categoryName">[${vo.categoryName}]</td>
												<c:choose>
													<c:when test="${sessionScope.employee.empNo==dto.empNo || sessionScope.employee.depNo == 1}">
															<td class="text-reset"> <a href="${pageContext.request.contextPath}/community/article?page=1&num=${vo.num}" class="underline communitySubject text-reset">${vo.subject}</a></td> 
															<td class="communityDate">${vo.reg_date}</td>	
													</c:when> 
													<c:otherwise>
														<td> 비공개 게시글입니다.&nbsp;<span class="lockIcon"><i class="fa-solid fa-lock"></i></span></td> 
														<td class="communityDate">${vo.reg_date}</td>
													</c:otherwise>
												</c:choose> 
											</tr>
										</c:if>
										<c:if test="${vo.open == 0}">
											<tr class="text-center">   
												<td class="categoryName">[${vo.categoryName}]</td>
												<td class="text-reset"> <a href="${pageContext.request.contextPath}/community/article?page=1&num=${vo.num}" class="underline communitySubject text-reset">${vo.subject}</a></td> 
												<td class="communityDate">${vo.reg_date}</td>
											</tr>
										</c:if>
									</c:forEach> 
								</tbody>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
		
		
			
		
		
	</div> 
</div>

<!-- 일정 상세 보기 Modal -->
<div class="modal fade" id="myDialogModal" tabindex="-1" aria-labelledby="myDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myDialogModalLabel">일정 상세 보기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<table class="table">
					<tr>
						<td colspan="2" class="text-center align-middle">
							<p class="form-control-plaintext view-subject"></p>
						</td>
					</tr>
					<tr>
						<td class="table-light col-2 align-middle">일정분류</td>
						<td>
							<p class="form-control-plaintext view-category"></p>
						</td>
					</tr>

					<tr>
						<td class="table-light col-2 align-middle">날 짜</td>
						<td>
							<p class="form-control-plaintext view-period"></p>
						</td>
					</tr>

					<tr>
						<td class="table-light col-2 align-middle">일정반복</td>
						<td>
							<p class="form-control-plaintext view-repeat"></p>
						</td>
					</tr>

 					<tr>
						<td class="table-light col-2 align-middle">등록일</td>
						<td>
							<p class="form-control-plaintext view-reg_date"></p>
						</td>
					</tr>

 					<tr>
						<td class="table-light col-2 align-middle">메모</td>
						<td>
							<p class="form-control-plaintext view-memo"></p>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
	$(".sendList").children().click(function(){
		let signNum = this.querySelector(".signNum").textContent;
		location.href="${pageContext.request.contextPath}/approval/read/"+signNum;
	});
	
	$(function(){
		let date = new Date("${todayPunch.punchOnTime}");
		date.setTime(date.getTime()+9*60*60*1000);
		let hour = Math.floor((date - new Date())/1000/60/60);
		let min = Math.floor(((date - new Date())-hour*60*60*1000)/1000/60);
		
		if (isNaN(min)||hour<0){
			min ="-";
		}
		if (isNaN(hour)||hour<=0){
			hour="-";
		}
		
		
		let out = "&nbsp;"+hour+"&nbsp;시간&nbsp;"+min+"&nbsp;분";
		
		$(".todayRemain").append(out);
	});
	
	$(function(){
		let totalQty = Number("${punDto.totalQty}");
		let leftQty = Number("${punDto.leftQty}");
		let p = Math.round(leftQty/totalQty);
		
		$("#dayoff").attr("aria-valuenow",leftQty/totalQty*100);
		$("#dayoff").attr("style", "width:"+leftQty/totalQty*100+"%");
	});


</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/main.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/locales-all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/main.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dateUtil.js"></script>
<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status===403) {
				login();
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

var calendar = null;
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');

	calendar = new FullCalendar.Calendar(calendarEl, {
		headerToolbar: {
			left: 'prev,next',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
		},
		initialView: 'dayGridMonth', // 처음 화면에 출력할 뷰
		locale: 'ko',
		editable: true,
		navLinks: true,
		dayMaxEvents: true,
		events: function(info, successCallback, failureCallback) {
			var url="${pageContext.request.contextPath}/schedule/month";
			var startDay=info.startStr.substr(0, 10);
			var endDay=info.endStr.substr(0, 10);
            var query="start="+startDay+"&end="+endDay;
            
            var a = $(".category-list input:checkbox.category-item").length;
            var b = $(".category-list input:checkbox.category-item:checked").length;
            if(b != 0 && a != b) {
            	$('.category-list input:checkbox.category-item:checked').each(function() {
            		query += "&categorys=" + $(this).val();
            	});
            }
            
        	var fn = function(data){
        		// var events = eval(data.list);
        		// console.log(data.list);
        		successCallback(data.list);
        	};
        	
        	ajaxFun(url, "get", query, "json", fn);

		},
		selectable: true,
		selectMirror: true,
		select: function(info) {
			// 날짜의 셀을 선택하거나 드래그하면 일정 추가 화면으로 이동
			// console.log(info);
			insertSchedule(info.startStr, info.endStr, info.allDay);
			
			calendar.unselect(); // 현재 선택된 영역을 지움
		},
		eventClick: function(info) {
			// 일정 제목을 선택할 경우
			
			//  상세 일정 보기
			viewSchedule(info.event);
		},
		eventDrop: function(info) {
			// 일정을 드래그 한 경우
			
			// 수정하기
			updateDrag(info.event);
		},
		eventResize: function(info) {
			// 일정의 크기를 변경 한 경우
			
			// 수정하기
			updateDrag(info.event);
		},
		loading: function(bool) {
			// document.getElementById('scheduleLoading').style.display = bool ? 'block' : 'none';
		}
	});

	calendar.render();
});

//일정 상세 보기
function viewSchedule(calEvent) {
	$("#myDialogModal").modal("show");
	
	// console.log(calEvent);
	
	var num = calEvent.id;
	var title = calEvent.title;
	var color = calEvent.backgroundColor;
	// var start = calEvent.start;
	// var end = calEvent.end;
	var start = calEvent.startStr;
	var end = calEvent.endStr;
	var allDay = calEvent.allDay;

	var categoryNum = calEvent.extendedProps.categoryNum;
	if(! categoryNum) categoryNum = 0;
	var category = calEvent.extendedProps.category;
	if(! category) category = "설정하지 않음";
	
	var sday = calEvent.extendedProps.sday;
	var eday = calEvent.extendedProps.eday;
	var stime = calEvent.extendedProps.stime;
	var etime = calEvent.extendedProps.etime;
	
	var memo = calEvent.extendedProps.memo;
	if(! memo) memo = "";
	var reg_date = calEvent.extendedProps.reg_date;
	var repeat = calEvent.extendedProps.repeat;
	var repeat_cycle = calEvent.extendedProps.repeat_cycle;
	
	$(".btnScheduleUpdate").attr("data-num", num);
	$(".btnScheduleDelete").attr("data-num", num);
	
	var s;
	$(".view-subject").html(title);
	
	s = allDay ? "종일일정" : "시간일정";
	$(".view-category").html(category + ", " + s);
	
	s = sday;
	if( stime ) {
		s += " "+stime;
	}
	if( eday && allDay ) {
		eday = daysLater(eday, 0);
		if(sday < eday) {
			s += " ~ " + eday;
		}
	} else if( eday ) {
		s += " ~ " + eday;
	}
	if( etime ) s += " " + etime;
	$(".view-period").html(s);
	
	$(".view-reg_date").html(reg_date);
	
	s = repeat != 0 && repeat_cycle != 0 ? "반복일정, 반복주기 " + repeat_cycle + "년" : "반복안함";
	$(".view-repeat").html(s);
	
	$(".view-memo").html(memo);
}

$(function(){
	// 일정 수정 화면
	$(".btnScheduleUpdate").click(function(){
		var num = $(this).attr("data-num");
		location.href="${pageContext.request.contextPath}/schedule/update?num="+num;
	});

	// 일정 삭제
	$(".btnScheduleDelete").click(function(){
		if(! confirm("일정을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		var fn = function(data){
			var event = calendar.getEventById(num);
	        event.remove();
	        
	        $("#myDialogModal").modal("hide");
		};
		
		var num = $(this).attr("data-num");
		var query = "num="+num;
		var url = "${pageContext.request.contextPath}/schedule/delete";

		ajaxFun(url, "post", query, "json", fn);
	});
});

function searchList() {
	const f = document.dayoffSearchForm;
	
	f.submit();
}

</script>

<!-- 출퇴근 기록 Modal -->
<div class="modal fade" id="attendance" tabindex="-1" aria-labelledby="attendanceLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">출퇴근 기록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="alert bg-sub text-center" role="alert">
      		<div>출퇴근을 한 기록을 볼 수 있습니다.</div>
        	<div>출퇴근 기록은 <span style="font-weight: bold">출근, 퇴근의 필터와 날짜</span>로 검색할 수 있습니다.</div>
        </div>
         <div class="card mt-4 p-4">
	       	<div>
	 			<form name="dayoffSearchForm" action="${pageContext.request.contextPath}/" method="post">
		    		<div class="d-flex justify-content-center align-items-center pb-2 border-bottom ">
			     		<select class="form-select me-2" name="condition" style="width: 100px;">
			     			<option value="">선택</option>
			     			<option value="0" ${condition=="punchOn"?"selected='selected'":""}>출근</option>
			     			<option value="1" ${condition=="punchOff"?"selected='selected'":""}>퇴근</option>
			     		</select>
			     		<input class="form-control me-2" name="std" type="date" id="std"> 
			     		<span class="me-2">~</span>
			     		<input class="form-control me-2" name="end" type="date" id="end">
			     		<button class="btn btn-main" onclick="searchList()"><i class="fa-solid fa-magnifying-glass"></i></button>
		    		</div>
	     		</form>
	       		<div class="m-auto">
		       		<c:choose>
		       			<c:when test="${empty clockList}">
		       				<div class="fs-4 text-muted p-4 text-center"> " 내역이 없습니다. " </div>
		       			</c:when>
		       			<c:otherwise>
		       				<div class="mt-2">
		       					<table class="table hover-table text-center">
		       						<thead>
				       					<tr>
				       						<th>#</th>
				       						<th>일자</th>
				       						<th>구분</th>
				       					</tr>
			       					</thead>
			       					<tbody>
			       						<c:forEach items="${clockList}" var="dto" varStatus="status">
			       							<tr>
			       								<td>${status.count}</td>
			       								<td>${dto.clock_time}</td>
			       								<td>${dto.punch_kind}</td>
			       							</tr>
			       						</c:forEach>
		       						</tbody>
		       					</table>
		       				</div>
		       			</c:otherwise>
		       		</c:choose>
	       		</div>
	      	</div>
       </div>
        
        
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-main" data-bs-dismiss="modal">닫기</button>        
      </div>
    </div>
  </div>
</div>

<!-- 연차 기록 Modal -->
<div class="modal fade" id="holidayHistory" tabindex="-1" aria-labelledby="attendanceLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">연차 기록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<div class="alert bg-sub text-center" role="alert">
			<div>연차나 특별휴가를 얻고 사용한 기록을 볼 수 있습니다.</div>
			<div>연차 기록은 <span style="font-weight: bold">획득, 사용의 필터와 날짜</span>로 검색할 수 있습니다.</div>
		</div>

			<div class="d-flex justify-content-center align-items-center mt-4">
				<div class="rounded bg-main p-2 text-white" style="font-weight: bold">잔여 휴가</div>
				<div class="ms-3 me-3">10일</div>
				<div class="rounded bg-main p-2 text-white" style="font-weight: bold">전체 휴가</div>
				<div class="ms-3 me-3">20일</div>
				<div class="rounded bg-main p-2 text-white" style="font-weight: bold">사용 휴가</div>
				<div class="ms-3 me-3">30일</div>
			</div>
       <div class="card mt-4 p-4">
	       	<div>
	 			<form name="dayoffSearch" action="${pageContext.request.contextPath}/punching/dayoffSearch" method="POST">
		    		<div class="d-flex justify-content-center align-items-center pb-2 border-bottom ">
			     		<select class="form-select me-2" name="condition" style="width: 100px;">
			     			<option value="gain">획득</option>
			     			<option value="use">사용</option>
			     		</select>
			     		<input class="form-control me-2" name="startDate" type="date">
			     		<span class="me-2">~</span>
			     		<input class="form-control me-2" name="endDate" type="date">
			     		<button class="btn btn-main"><i class="fa-solid fa-magnifying-glass"></i></button>
		    		</div>
	     		</form>
	       		<div class="m-auto">
		       		<c:choose>
		       			<c:when test="${empty dayoffList}">
		       				<div class="fs-4 text-muted p-4 text-center"> " 내역이 없습니다. " </div>
		       			</c:when>
		       			<c:otherwise>
		       				<div class="mt-2">
		       					<table class="table hover-table">
		       						<thead>
				       					<tr>
				       						<th>#</th>
				       						<th style="width:50%">사유</th>
				       						<th>수량</th>
				       						<th>일자</th>
				       						<th>잔여 연차</th>
				       					</tr>
			       					</thead>
			       					<tbody>
			       						<c:forEach items="${dayoffList}" var="dto" varStatus="status">
			       							<tr>
			       								<td>${status.index}</td>
			       								<td>${dto.content}</td>
			       								<td>${dto.qty}</td>
			       								<td>${dto.date}</td>
			       								<td>${dto.leftQty}</td>
			       							</tr>
			       						</c:forEach>
		       						</tbody>
		       					</table>
		       				</div>
		       			</c:otherwise>
		       		</c:choose>
	       		</div>
	      	</div>
       </div>
       
       <div class="card mt-4 p-4">
	       	<div>
	 			<form name="svSearch" action="${pageContext.request.contextPath}/punching/svSearch" method="POST">
		    		<div class="d-flex justify-content-center align-items-center pb-2 border-bottom ">
			     		<select class="form-select me-2" name="condition" style="width: 100px;">
			     			<option value="gain">획득</option>
			     			<option value="use">사용</option>
			     		</select>
			     		<input class="form-control me-2" name="startDate" type="date">
			     		<span class="me-2">~</span>
			     		<input class="form-control me-2" name="endDate" type="date">
			     		<button class="btn btn-main"><i class="fa-solid fa-magnifying-glass"></i></button>
		    		</div>
	     		</form>
	       		<div class="m-auto">
		       		<c:choose>
		       			<c:when test="${empty svList}">
		       				<div class="fs-4 text-muted p-4 text-center"> " 내역이 없습니다. " </div>
		       			</c:when>
		       			<c:otherwise>
		       				<div class="mt-2">
		       					<table class="table hover-table">
		       						<thead>
				       					<tr>
				       						<th>#</th>
				       						<th style="width:50%">사유</th>
				       						<th>수량</th>
				       						<th>일자</th>
				       						<th>잔여 연차</th>
				       					</tr>
			       					</thead>
			       					<tbody>
			       						<c:forEach items="${specialVacationList}" var="sv" varStatus="sv_status">
			       							<tr>
			       								<td>${sv_status.index}</td>
			       								<td>${sv.content}</td>
			       								<td>${sv.qty}</td>
			       								<td>${sv.date}</td>
			       								<td>${sv.leftQty}</td>
			       							</tr>
			       						</c:forEach>
		       						</tbody>
		       					</table>
		       				</div>
		       			</c:otherwise>
		       		</c:choose>
	       		</div>
	      	</div>
       </div>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-main" data-bs-dismiss="modal">닫기</button>        
      </div>
    </div>
  </div>
</div>