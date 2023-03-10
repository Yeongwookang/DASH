<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data: query,
		dataType:dataType,
		success:function(data) {
			fn(data);
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

$(function(){
	$("#checkAll").click(function(){
		if($(this).is(":checked")) {
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);
		}
	
		});
	
	
	
	$("input[name=nums]").click(function() {
		var total = $("input[name=nums]").length;
		var checked = $("input[name=nums]:checked").length;
		
		if(total != checked) $("#chkAll").prop("checked", false);
		else $("#chkAll").prop("checked", true); 
	});
	
	
	
});
	



function searchList() {
	const f = document.searchForm;
	f.submit();
}

function sendModelrepairwait() {
	let chkrs = [];
	$("input:checkbox[name='nums']:checked").each(function(){
		chkrs.push($(this).attr("value"));
	});
	
	
	$("#exampleModal1").modal('hide');
	

	
	 let url = "${pageContext.request.contextPath}/kickmanage/repairwait";          
	 let obj2 = {val : chkrs};
	 const fn = function(data) {
		 console.log(data);
		 location.href = "${pageContext.request.contextPath}/kickmanage/main";
	};
	   
	ajaxFun(url, "get", obj2, "json", fn);        
    
}

function sendModelrepairing() {
	let chkrs = [];
	$("input:checkbox[name='nums']:checked").each(function(){
		chkrs.push($(this).attr("value"));
	});
	
	
	$("#exampleModal2").modal('hide');
	

	
	 let url = "${pageContext.request.contextPath}/kickmanage/repair";          
	 let obj2 = {val : chkrs};
	 const fn = function(data) {
		 console.log(data);
		 location.href = "${pageContext.request.contextPath}/kickmanage/main";
	};
	   
	ajaxFun(url, "get", obj2, "json", fn);        
    
}




function sendModelrepaircom() {
	let chkrs1 = [];
	$("input:checkbox[name='nums']:checked").each(function(){
		chkrs1.push($(this).attr("value"));
	});
	
	
	$("#exampleModal3").modal('hide');
	

	
	 let url = "${pageContext.request.contextPath}/kickmanage/repaircom";          
	 let obj3 = {val : chkrs1};
	 const fn = function(data) {
		 console.log(data);
		 location.href = "${pageContext.request.contextPath}/kickmanage/main";
	};
	   
	ajaxFun(url, "get", obj3, "json", fn);        
    
}


function sendModeldamage() {
		let chks = [];
    	$("input:checkbox[name='nums']:checked").each(function(){
    		chks.push($(this).attr("value"));
    	});
    	
    	
    	$("#exampleModal4").modal('hide');
    	
    
    	
    	 let url = "${pageContext.request.contextPath}/kickmanage/damage";          
    	 let obj = {val : chks};
    	 const fn = function(data) {
    		 console.log(data);
    		 location.href = "${pageContext.request.contextPath}/kickmanage/main";
		};
    	   
		ajaxFun(url, "get", obj, "json", fn);            
    	            
	
}


</script>


<div>
	<div class="title mt-4">
		<span>킥보드 관리</span>
	</div>
<div class="mt-4">
<div class="d-flex justify-content-between" >
	<div>
	<form name="searchForm" action="${pageContext.request.contextPath}/kickmanage/main" method="post">
	<div class="d-flex">				
		<div class="col-auto p-1">
			<select name="condition" class="form-select">
				<option value="other">::선택::</option>
				<option value="normal" ${condition=="normal"?"selected='selected'":""}>정상</option>
				<option value="repair" ${condition=="repair"?"selected='selected'":""}>수리</option>
				<option value="damage" ${condition=="damage"?"selected='selected'":""}>파손</option>
			</select>
		</div>
		<div class="col-auto p-1">
			<button type="button" class="btn btn-sub" onclick="searchList()"> <i class="bi bi-search"></i> </button>
		</div>
	</div>
	</form>
	</div>
	<div class="d-flex">
	<div class="dropdown">
  		<a class="btn btn-secondary dropdown-toggle btn-sub" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
      		 수리
  		</a>

		  <ul class="dropdown-menu">
		    <li><a class="dropdown-item" href=""  data-bs-toggle="modal"
					data-bs-target="#exampleModal1">신청</a></li>
		    <li><a class="dropdown-item" href="" data-bs-toggle="modal"
					data-bs-target="#exampleModal2">입고</a></li>
		    <li><a class="dropdown-item" href="" data-bs-toggle="modal"
					data-bs-target="#exampleModal3">완료</a></li>
		  </ul>
	</div>
	<div>
	<button type="button" class="btn btn-sub ms-2" data-bs-toggle="modal"
				data-bs-target="#exampleModal4">파손</button>
	</div>				
	</div>
</div>
	<div class="mt-4">
		<table class="table table-hover board-list">
			<thead class="bg-main text-white fs-5">
				<tr class="text-center">
					<th class="text-center"><input type="checkbox" id="checkAll" name="checkAll"></th>
					<th style="width: 20%">번호</th>
					<th style="width: 20%">이름</th>
					<th style="width: 20%">상태</th>
					<th style="width: 20%">수리상태</th>
					<th style="width: 20%">현황</th>
				</tr>
			</thead>

			<tbody class="kickboardList">
				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr>
						<td class="text-center"><input type="checkbox" name="nums" value="${dto.kNum}"></td>
						<td class="align-middle text-center">${dto.kNum}</td>
						<td class="align-middle text-center">${dto.name}</td>
						<td class="align-middle text-center">${dto.state}</td>
						<td class="align-middle text-center">${dto.repairstate}</td>
						<td class="align-middle text-center">${dto.condition}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="page-navigation">
			<div class="page-navigation paging mt-4 text-center">
				${dataCount == 0 ? "등록된 킥보드가 없습니다." : paging}</div>
		</div>
		
		<div class="me-2 d-flex justify-content-end">
			<button type="button" class="btn btn-sub text-center"  onclick="location.href='${pageContext.request.contextPath}/register/main3'">킥보드 등록</button>
		</div>
</div>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">킥보드 수리 신청</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form name="modelrepairForm" action="" method="post"
							class="row g-3">
							<div class="mt-0">
								<p class="form-control-plaintext">선택하신 킥보드를 수리신청하시겠습니까?</p>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sub"
							data-bs-dismiss="modal">돌아가기</button>
						<button type="button" class="btn btn-main"
							onclick="sendModelrepairwait();">확인</button>
					</div>
				</div>
			</div>
		</div>
      <div class="modal fade" id="exampleModal2" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">킥보드 입고 신청</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form name="modeldamageForm" action="" method="post"
							class="row g-3">
							<div class="mt-0">
								<p class="form-control-plaintext">선택하신 킥보드를 수리입고하시겠습니까?</p>
							</div>
							
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sub"
							data-bs-dismiss="modal">돌아가기</button>
						<button type="button" class="btn btn-main"
							onclick="sendModelrepairing();">확인</button>
					</div>
				</div>
			</div>
		</div>


					<div class="modal fade" id="exampleModal3" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">킥보드 수리완료 신청</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form name="modeldamageForm" action="" method="post"
							class="row g-3">
							<div class="mt-0">
								<p class="form-control-plaintext">선택하신 킥보드를 수리완료하시겠습니까?</p>
							</div>
							
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sub"
							data-bs-dismiss="modal">돌아가기</button>
						<button type="button" class="btn btn-main"
							onclick="sendModelrepaircom();">확인</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal4" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">킥보드 파손 신청</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form name="modeldamageForm" action="" method="post"
							class="row g-3">
						<div class="mt-0">
								<p class="form-control-plaintext">선택하신 킥보드를 파손신청하시겠습니까?</p>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sub"
							data-bs-dismiss="modal">돌아가기</button>
						<button type="button" class="damagekick btn btn-main"
							onclick="sendModeldamage();">확인</button>
					</div>
				</div>
			</div>
		</div>
				

	</div>
</div>