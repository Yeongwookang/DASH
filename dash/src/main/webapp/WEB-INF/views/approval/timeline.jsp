<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div>
	<div class="d-flex justify-content-between mt-4">
		<div class="title">
			타임라인 관리
		</div>

		<form class="d-flex align-items-center" name="timelineSearch">
			<div class="me-2">
			<select class="form-select" name="condition">
				<option value="dep">부서</option>
				<option value="name">이름</option>
				<option value="empNo">사번</option>
			</select>
			</div>
			<div class=" me-2">
			<input type="text" class="form-control" name="keyword">
			</div>
			<div>
			<button type="button" class="btn btn-main searchTimeline" ><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>
		</form>
	</div>
	
	<hr class="mt-4 mb-4" style="border: solid 1px;">
	<div class="mt-4">
		<div class="alert bg-sub text-center" role="alert">
        		<div>타임라인이란, <span style="font-weight: bold">여러 결재를 하나로 묶어 관리하는 것</span>을 의미합니다.</div>
        		<div>프로젝트 단위의 결재를 처리하는데 용이하며, </div>
        		<div>타임라인은 <span style="font-weight: bold">이름과 관리자</span>로 검색이 가능합니다.</div>
        </div>
		<div class="d-flex justify-content-between mt-4" style="height: 700px;">
			<div class="card h-100" style="width:34%;">
				<div class="card-header bg-main bg-gradient text-white sales">타임라인</div>
				<div class="ms-2 me-2 scroll" style="overflow-y:scroll;">
					<table class="table table-hover text-center">
						<thead>
							<tr>
								<th>#</th>
								<th style="width:70%;">이름</th>
								<th>관리자</th>
							</tr>
						</thead>
						<tbody class="timelineList">
							<c:choose>
							<c:when test="${not empty timelineList}">
								<c:forEach items="${timelineList}" var="tl" varStatus="status">
									<tr class="searched" onclick="readTimeline(${tl.tlNum});">
										<td>${status.count}</td>
										<td>${tl.tlName}</td>
										<td>${tl.name}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
							<tr class="empty-line"><td></td><td></td><td></td></tr>
							<tr class="empty-line"><td></td><td></td><td></td></tr>
							<tr class="empty-line"><td></td><td></td><td></td></tr>
							<tr class="empty-line"><td></td><td></td><td></td></tr>
							<tr class="empty-line"><td></td><td></td><td></td></tr>
							<tr class="empty-line"><td></td><td></td><td></td></tr>
							<tr class="empty-line"><td></td><td></td><td></td></tr>
							<tr class="empty-line"><td></td><td></td><td></td></tr>
							<tr class="empty-line"><td></td><td></td><td></td></tr>
							</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<div class="card" style="width:64%">
				<div class="card-header bg-main bg-gradient text-white sales">내용</div>
				<div class="ms-2 me-2 scroll" style="overflow-y:scroll;">
				<table class="table table-hover text-center">
					<tr>
						<td class="fw-bold" style="width:10%">번호</td>
						<td style="width:10%" id="tlNum"></td>
						<td class="fw-bold" style="width:10%">제목</td>
						<td colspan="4" id="tlName"></td>
					</tr>
					<tr>
					
						<td class="fw-bold" style="width:10%">진행률</td>
						<td style="width:20%">
						<div class="progress">
						  <div id="progress" class="bg-main progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						</td>
						
						<td class="fw-bold" style="width:10%">등록일</td>
						<td id="reg_date"></td>
						
						<td class="fw-bold" style="width:10%">관리자</td>
						<td style="width:20%" id="admin"></td>
						<td style="width:10%">
						<div class="dropdown admin-dropdown" style="display:none">
						  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
						   <i class="fa-solid fa-gear"></i>
						  </button>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
						    <li><button class="dropdown-item" type="button">삭제</button></li>
						    <li><button class="dropdown-item" type="button">관리자 위임</button></li>
						  </ul>
						</div>
							
						</td>
					</tr>
				</table>
				
				<div class="ps-3 pe-3" style="min-height: 20rem;" id="content"></div>
				
				<div>
				<table class="table table-hover text-center border-top">
				<tr class="text-start"><td class="ps-3 fw-bold">하위 문서</td></tr>
				<tr><td>
				<div class="d-flex justify-content-evenly text-center mt-4 mb-4" id="subDocument">
					<div >
					<div class="bg-sub bg-gradient p-2 fw-bold rounded">기안</div>
					<div style="max-width: 9rem">
						<ul class="list-group" >
							<li class="list-group-item list-group-item-action elipsis"> 1단계 문서 asdasdasd </li>
						</ul>
					</div>
					</div>
					
					<div>
					<div  class="bg-sub bg-gradient p-2 fw-bold  rounded">1차결재</div>
					<div style="max-width: 9rem">
						<ul class="list-group" >
							<li class="list-group-item list-group-item-action elipsis"> 1단계 문서 asdasdasd </li>
						</ul>
					</div>
					</div>
					
					<div>
					<div class="bg-sub bg-gradient p-2 fw-bold rounded">2차결재</div>
					<div style="max-width: 9rem">
						<ul class="list-group" >
							<li class="list-group-item list-group-item-action elipsis"> 1단계 문서 asdasdasd </li>
						</ul>
					</div>
					</div>
					
					<div>
					<div class="bg-sub bg-gradient p-2 fw-bold rounded">결재완료</div>
					<div style="max-width: 9rem">
						<ul class="list-group" >
							<li class="list-group-item list-group-item-action elipsis"> 1단계 문서 asdasdasd </li>
						</ul>
					</div>
					</div>
					
				</div>
				</td></tr>
				</table></div>	
				</div>
			</div>
		</div>
	</div>
	<hr class="mt-4 mb-4" style="border: solid 1px;">
			
	<div class="d-flex justify-content-end">	
			<button class="btn btn-sub bg-gradient" type="button" data-bs-toggle="modal" data-bs-target="#timeLine">신규 등록</button>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="timeLine" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="timeLineLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-main bg-gradient sales text-white">
        <h5 class="modal-title" id="staticBackdropLabel">타임라인 생성</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
        	<form name="insertTimeline">
        		<table class="table table-hover">
        			<tr>
        				<th style="width:20%">제목</th>
        				<td colspan="3"><input type="text" name="tlName" class="form-control"></td>
        			</tr>
        			<tr>
        				<th style="width:20%">총 단계</th>
        				<td style="width:30%">
	        				<select class="form-select" name="max_state">
			        			<option>1</option>
			        			<option>2</option>
			        			<option>3</option>
			        		</select>
		        		</td>
        				<th style="width:20%">관리자명</th>
        				<td style="width:30%">
        					<input type="text" value="${sessionScope.employee.name}" class="form-control" readonly>
        				</td>
        				<td style="display:none;">
	        				<input type="hidden" name="empNo" value="${sessionScope.employee.empNo}" readonly>
	        			</td>
        			</tr>
        			<tr>
        				<th colspan="4">내용</th>
        			</tr>
        			<tr>
        				<td colspan="4"><textarea name="content" rows="10" class="form-control"></textarea></td>
        			</tr>
        		</table>
        	</form>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sub" data-bs-dismiss="modal">취소</button>
      	<button type="button" class="btn btn-main timelineReg">등록</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
	function readTimeline(tlNum){
		let url ="${pageContext.request.contextPath}/approval/readTimeline";
		let query="tlNum="+tlNum;
		
		const fn=function(data){
			$(".readContent").remove();
			$("#progress").attr("style","width:0%;");
			$("#progress").attr("aria-valuenow","0");
			$("#admin").attr("data-empNo","");
			
			let item = data.dto;
			
			$("#progress").attr("style","");
			$("#progress").attr("aria-valuenow","");
			$("#admin").append("<div class='readContent'>"+item.name+"</div>");
			$("#admin").attr("data-empNo",item.empNo);
			$("#tlName").append("<div class='readContent'>"+item.tlName+"</div>");
			$("#tlNum").append("<div class='readContent'>"+item.tlNum+"</div>");
			$("#content").append("<div class='readContent'>"+item.content+"</div>");
			$("#reg_date").append("<div class='readContent'>"+item.reg_date+"</div>")
		};
		
		ajaxFun(url, "GET", query, "JSON", fn);
		
	}
</script>
<script type="text/javascript">
	$(function(){
		let num= Number("${fn:length(approvalList)}");
		if(num<5 && num>0 ){
			let size = 5-num;
			for(let i=0; i<size; i++){
				$(".approvalList").append("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
			}
		}
		
		let myNum = Number("${fn:length(myApprovalList)}");
		if(myNum<5 && myNum>0){
			let size = 5-myNum;
			for(let i=0; i<size; i++){
				$(".myApprovalList").append("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
			}
		}
	});
	
	
	
	$(".timelineReg").click(function(){
		const f = document.insertTimeline;
		
		if(f.tlName.value===''){
			alert('타임라인 제목을 기입해주세요.');
			f.tlName.focus();
			return;
		}
		
		if(f.content.value===''){
			alert('이름을 기입해주세요.');
			f.tlName.focus();
			return;
		}
		
		
		f.action="${pageContext.request.contextPath}/approval/timelineInsert";
		f.method="POST";
		f.submit();
		
	});
	
	$(".searchTimeline").click(function(){
		const f1 = document.timelineSearch;
		let condition=f1.condition.value;
		let keyword=f1.keyword.value;
		let url = "${pageContext.request.contextPath}/approval/timelineSearch";
		let query ="condition="+condition+"&keyword="+keyword+"&page=1";
		
		const fn = function(data){
			$(".searched").remove();
			
			for(const [index, item] of data.tlList.entries()){
				let out= "<tr class='searched' onclick='readTimeline("+item.tlNum+")'>";
				out+= "<td>"+Number(index+1)+"</td>";
				out+= "<td>"+item.tlName+"</td>";
				out+= "<td>"+item.name+"</td>";
				out+= "</tr>";
				
				$(".timelineList").append(out);
			}
		};
		
		ajaxFun(url, "GET", query, "JSON", fn);
	});
	

</script>
