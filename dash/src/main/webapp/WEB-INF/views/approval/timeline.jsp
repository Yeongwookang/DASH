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

		<form class="d-flex align-items-center">
			<div class="me-2">
			<select class="form-select">
				<option>이름</option>
				<option>관리자</option>
			</select>
			</div>
			<div class=" me-2">
			<input type="text" class="form-control">
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
						<tbody>
							<tr><td></td><td></td><td></td></tr>
							<tr><td></td><td></td><td></td></tr>
							<tr><td></td><td></td><td></td></tr>
							<tr><td></td><td></td><td></td></tr>
							<tr><td></td><td></td><td></td></tr>
							<tr><td></td><td></td><td></td></tr>
							<tr><td></td><td></td><td></td></tr>
							<tr><td></td><td></td><td></td></tr>
							<tr><td></td><td></td><td></td></tr>
							<tr><td></td><td></td><td></td></tr>
							<tr><td></td><td></td><td></td></tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="card" style="width:64%">
				<div class="card-header bg-main bg-gradient text-white sales">내용</div>
				<div class="ms-2 me-2 scroll" style="overflow-y:scroll;">
				<table class="table table-hover text-center">
					<tr>
						<td style="width:10%">제목</td>
						<td colspan="4"></td>
					</tr>
					<tr>
						<td>진행률</td>
						<td style="width:50%">
						<div class="progress">
						  <div class="bg-main  progress-bar-striped progress-bar-animated" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						</td>
						<td style="width:10%">관리자</td>
						<td style="width:20%" data-empNo=""></td>
						<td style="width:10%">
							<i class="fa-solid fa-gear"></i>
						</td>
					</tr>
				</table>
				
				<div class="ps-3 pe-3" style="min-height: 20rem;"> 내용</div>
				
				<div>
				<table class="table table-hover text-center">
				<tr><td>하위 문서</td></tr>
				<tr><td>
				<div class="d-flex justify-content-evenly text-center">
					<div>
					<div class="bg-sub bg-gradient p-2">기안</div>
					<div style="max-width: 9rem">
						<ul class="list-group" >
							<li class="list-group-item list-group-item-action elipsis"> 1단계 문서 asdasdasd </li>
						</ul>
					</div>
					</div>
					
					<div>
					<div>1차결재</div>
					<div style="max-width: 9rem">
						<ul class="list-group" >
							<li class="list-group-item list-group-item-action elipsis"> 1단계 문서 asdasdasd </li>
						</ul>
					</div>
					</div>
					
					<div>
					<div>2차결재</div>
					<div style="max-width: 9rem">
						<ul class="list-group" >
							<li class="list-group-item list-group-item-action elipsis"> 1단계 문서 asdasdasd </li>
						</ul>
					</div>
					</div>
					
					<div>
					<div>결재완료</div>
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
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">타임라인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
        	<div class="alert bg-sub text-center" role="alert">
        		<div>타임라인이란, </div>
        		<div><span style="font-weight: bold">여러 결재를 하나로 묶어 시간순으로 배열하는 것</span>을 의미합니다.</div>
        		<div>프로젝트 단위의 결재를 처리하는데 용이하며,</div>
        		<div><span style="font-weight: bold">제목, 관리자명, 사번</span>으로 검색이 가능합니다.</div>
        	</div>
        	<div class="d-flex">
        	<select class="form-select me-2" id="condition_tl">
	      		<option value="title">제목</option>
	      		<option value="empNo">사번</option>
	      		<option value="name">관리자명</option>
	      	</select>
        	<input class="form-control" id="keyword_tl">
        	<button type="button" class="btn btn-main ms-2 searchTimeline" ><i class="fa-solid fa-magnifying-glass"></i></button>
        	</div>
        	<div class="mt-4">
        		<table class="table hover-table text-center">
        			<thead>
        				<tr>
        					<th>#</th>
        					<th style="width:60%">타임라인명</th>
        					<th>진행률</th>
        					<th>관리자</th>
        				</tr>
        			</thead>
        			<tbody class="timeLineResult">
        			</tbody>
        		
        		</table>
        	
        	</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sub" data-bs-dismiss="modal">취소</button>
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
		if(${fn:length(approvalList)}<5 && ${fn:length(approvalList)}>0 ){
			let size = 5-${fn:length(approvalList)};
			for(let i=0; i<size; i++){
				$(".approvalList").append("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
			}
		}
		
		if(${fn:length(myApprovalList)}<5 && ${fn:length(approvalList)}>0){
			let size = 5-${fn:length(myApprovalList)};
			for(let i=0; i<size; i++){
				$(".myApprovalList").append("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
			}
		}
	});
	
	$(".searchTimeline").click(function){
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
	}
	

</script>
