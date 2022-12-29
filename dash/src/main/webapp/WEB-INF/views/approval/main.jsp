<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="scroll m-auto" style="height: 85%; width:90%; overflow-y:scroll;">
	<div class="text-start fs-4 mb-4">
		<span>| 결재</span>
	</div>
	<div>
	<form name="approval-search"  method="post" action="${pageContext.request.contextPath}/approval/main">
		<div class="d-flex justify-content-center align-items-center">
			<input name="s_date" class="form-control me-2" type="date">
			<span>~</span>
			<input name="e_date" class="form-control ms-2 today" type="date"> 
			<button type="button" class="btn bg-sub bg-gradient ms-2"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div>
	</form>
	</div>
	<div class="mt-4">
		<div class="card">
			<div class="card-header bg-sub bg-gradient text-start">
				<blockquote class="blockquote mb-0">
			      <p>결재 대기 목록</p>
			    </blockquote>
			</div>
			<div class="card-body">
			<c:choose >
			<c:when test="${not empty approvalList}">
				<table class="table">
					<thead>
	        			<tr>
	        				<th>#</th>
	        				<th style="width: 50%">제목</th>
	        				<th>직급 </th> 
	        				<th>기안자</th>
	        				<th>상태</th>
	        			</tr>
        			</thead>
        			<tbody class="sendList">
        			<c:forEach items="${approvalList}" var="ap" varStatus="status">
        				<tr>
        					<th>${status.count}</th>
        					<td class="title">${ap.title}</td>
        					<td class="position">${ap.posName}</td>
        					<td class="name">${ap.name}</td>
        					<td class="state">${ap.state}</td>
        				</tr>
        			</c:forEach>
        			</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<blockquote class="blockquote mt-5 mb-5 text-center">
			      <p>" 결재 대기중인 목록이 없습니다 "</p>
			    </blockquote>
			</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
	<div class="mt-4">
		<div class="card">
			<div class="card-header bg-sub bg-gradient text-start">
				<blockquote class="blockquote mb-0">
			      <p>${sessionScope.employee.name}님의 결재</p>
			    </blockquote>
			</div>
			<div class="card-body">
				<c:choose >
			<c:when test="${not empty myApprovalList}">
				<table class="table">
					<thead>
	        			<tr>
	        				<th>#</th>
	        				<th style="width: 50%">제목</th>
	        				<th>직급 </th> 
	        				<th>기안자</th>
	        				<th>상태</th>
	        			</tr>
        			</thead>
        			<tbody class="sendList">
        			<c:forEach items="${myApprovalList}" var="ap" varStatus="status">
        				<tr>
        					<th>${status.count}</th>
        					<td class="title">${ap.title}</td>
        					<td class="position">${ap.posName}</td>
        					<td class="name">${ap.name}</td>
        					<td class="state">${ap.state}</td>
        				</tr>
        			</c:forEach>
        			</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<blockquote class="blockquote mt-5 mb-5 text-center">
			      <p>" ${sessionScope.employee.name}님이 작성한 결재가 없습니다 "</p>
			    </blockquote>
			</c:otherwise>
			</c:choose>
			</div>		
		</div>
	</div>
	<div class="mt-4 mb-4 d-flex justify-content-end">
		<div>
			<button class="btn bg-sub bg-gradient" type="button" data-bs-toggle="modal" data-bs-target="#newApproval">신규 결재</button>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade text-center" id="newApproval" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="newApprovalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">참조자 설정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="flex-container">
        <div class="alert bg-sub text-center" role="alert">
        	<div>결재 문서의 참조자를 설정해주세요.</div><div> 참조자는 최대 3명까지 가능합니다.</div>
        </div>
      	<div class="d-flex form-control">
	      	<select class="form-select" id="condition">
	      		<option value="dep">부서</option>
	      		<option value="rank">직급</option>
	      		<option value="team">팀</option>
	      		<option value="pos">직책</option>
	      		<option value="name">이름</option>
	      	</select>
	      	<input type="text" id="keyword" class="form-control ms-2">
	      	<button type="button" class="btn bg-sub bg-gradient ms-2 empSearchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
      	</div>
		<div class="form-control mt-4">
       		<table class="table table-hover mt-2">
       			<thead>
        			<tr>
        				<th style="width: 5%">#</th>
        				<th style="width: 20%">부서</th>
	       				<th style="width: 20%">팀</th>
	       				<th style="width: 35%">직책</th>
	       				<th style="width: 15%">이름</th>
        			</tr>
       			</thead>
       			<tbody class="sendList">
       				<tr class="sendInfo"><td colspan="6"><h4 class=" text-center m-5 text-muted">" 검색을 실시해주세요 "</h4></td></tr>
       			</tbody>
       		</table>
       		<div class="paginate"></div>
       	</div>

        <div class="form-control mt-4">
        	<table class="table table-hover mt-2">
        		<thead>
	       			<tr>
	       				<th style="width: 20%">부서</th>
	       				<th style="width: 25%">팀</th>
	       				<th style="width: 35%">직책</th>
	       				<th style="width: 15%">이름</th>
	       			</tr>
     			</thead>
     			<tbody class="sendTo">
     				<tr class="sendToInfo"><td colspan="5"><h4 class=" text-center m-5 text-muted">" 검색결과 클릭 "</h4></td></tr>
     			</tbody>
        	</table>
        </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn bg-sub writeBtn">글쓰기</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
			console.log(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}
</script>
<script type="text/javascript">	
	
	var index = 1;
	$(".empSearchBtn").click(function(){
		let condition = $("#condition").attr("selected",true).val();
		let keyword = $("#keyword").val();
		let page = 1;
		
		let query = "condition="+condition+"&keyword="+keyword+"&page="+page;
		let url = "${pageContext.request.contextPath}/approval/empSearch";
		
		
		const fn = function(data){
			
			//리스트 등록
			let i =1;
			for(let item of data.empList){
				let empNo= item.empNo;
				let dep = item.depName;
				let name= item.name;
				let pos= item.posName;
				let rank = item.rankName;
				let team = item.teamName;
				
				let out = "<tr>";
				out += "<td>"+i+"</td>";
				out += "<td class='dep'>"+ dep + "</td>";
				out += "<td class='team'>"+ team + "</td>";
				out += "<td class='pos'>"+ pos + "</td>";
				out += "<td class='name'>"+ name + "</td>";
				out += "<td class='empNo' style='display:none;'>"+empNo+"</td>"
				out += "</tr>";
				
				$(".sendInfo").remove();
				$(".sendList").append(out);
					
				i++;
				
			}
			
			//이벤트 등록
			$(".sendList").children().click(function(){
				
				if(index>3){
					alert('3명까지 지정이 가능합니다.');
					return;
				}
				
				let pos = this.querySelector(".pos").textContent;
				let dep = this.querySelector(".dep").textContent;
				let team = this.querySelector(".team").textContent;
				let name = this.querySelector(".name").textContent;
				let empNo = this.querySelector(".empNo").textContent;
				
				
				if($(".sendTo").children().hasClass(empNo)===true){
					alert('이미 참조한 대상입니다.');
					return;
				}
				
				let out = "<tr class='"+empNo+"'>";
				out += "<td class='dep'>"+ dep + "</td>";
				out += "<td class='team'>"+ team + "</td>";
				out += "<td class='pos'>"+ pos + "</td>";
				out += "<td class='name'>"+ name + "</td>";
				out += "</tr>";
				
				index++;
				
				$(".sendToInfo").remove();
				$(".sendTo").append(out);
				$(".sendTo").children().click(function(e){
					this.remove();
					e.stopImmediatePropagation();
					index--;
				});
			});
		}
		
		
		ajaxFun(url, "get", query, "JSON", fn);
		
	});
	
	$(".writeBtn").click(function(){
		
		let query = "";
		
		for(let i = 0; i < $(".sendTo").children().length; i++){
			query += "ref"+(i+1);
			query += $('.sendTo').children()[i].querySelector('.empNo').textContent;
		}
		
		console.log(query);
		
		
		$.ajax({
			contentType: "application/json",
			type:"POST",
			data:JSON.stringify(sendTo),
			url:"${pageContext.request.contextPath}/approval/write",
			success:function(data){
				console.log(data);
			},
			error:function(jqXHR, status, error){
				console.log('error');
			}
		});
		
	});
	
	$(function(){
		let date = new Date().toISOString().substr(0, 10);
		$(".today").val(date);
	});
	
	
</script>