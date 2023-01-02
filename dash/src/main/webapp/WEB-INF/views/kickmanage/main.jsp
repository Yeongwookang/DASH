<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
	const f = document.kickboardForm; 
	
	let value = f.kickboard.value;
	
	
	let url = "${pageContext.request.contextPath}/kickmanage/filterkickboard?value="+ value; 
	
	
	
}

function sendModelrepair() {
	var f = document.modelrepairForm;
    var str;
    
    str = f.kNum.value();
   
    if(!str){
    	f.kNum.focus();
    	return;
    }
    
    f.action = "${pageContext.request.contextPath}/kickmanage/repair"; 
    f.submit();
    
}


function sendModeldamage() {
	var f = document.modeldamageForm;
    var str;
    
    str = f.kNum.value;
   
    if(!str){
    	f.kNum.focus();
 
    	return;
    }
    
    f.action = "${pageContext.request.contextPath}/kickmanage/damage";
    f.submit();
}



</script>


<div class="scroll m-auto"
	style="width: 90%; height: 85%; overflow-y: scroll;">
	<div class="text-start fs-4 mb-4">
		<span>| 킥보드 관리</span>
	</div>

	<div class="col text-end ms-4 d-inline">
		<button type="button" class="btn bg-sub" data-bs-toggle="modal"
			data-bs-target="#exampleModal1">수리신청</button>
	</div>
	
	<div class="col text-end ms-4 d-inline">
		<button type="button" class="btn bg-sub" data-bs-toggle="modal"
			data-bs-target="#exampleModal3">수리완료신청</button>
	</div>
	<div class="col text-end ms-4 d-inline">
		<button type="button" class="btn bg-sub" data-bs-toggle="modal"
			data-bs-target="#exampleModal2">파손신청</button>
	</div>

	<div class="mt-4">
		<table class="table table-hover board-list">
			<thead class="bg-sub">
				<tr class="text-center">
					<th class="text-center"><input type="checkbox" id="checkAll" name="checkAll"></th>
					<th style="width: 20%">번호</th>
					<th style="width: 20%">이름</th>
					<th style="width: 20%">상태</th>
					<th style="width: 20%">현황</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr>
						<td class="text-center"><input type="checkbox" name="nums" value="${dto.kNum}"></td>
						<td class="align-middle text-center">${dto.kNum}</td>
						<td class="align-middle text-center">${dto.name}</td>
						<td class="align-middle text-center">${dto.state}</td>
						<td class="align-middle text-center">${rlist[status.index].condition}</td>
						
					</tr>
				</c:forEach>

			</tbody>
		</table>

		<div class="page-navigation"></div>
		<div class="col-6 text-center ms-3 d-inline">
			<form name="kickboardForm">
				<div class="col-auto p-1">
					<select name="kickboard" class="form-select" style="width: 20%">
						<option value="" ${condition==""?"selected='selected'":""}>선택</option>
						<option value="damage"
							${condition=="damage"?"selected='selected'":""}>파손</option>

						<option value="repair"
							${condition=="repair"?"selected='selected'":""}>수리중</option>
						<option value="complete"
							${condition=="complete"?"selected='selected'":""}>수리완료</option>
					</select>
					<button type="button" class="btn btn-light d-inline"
						onclick="searchList()">
						<i class="bi bi-search"></i>
					</button>
				</div>
			</form>
		</div>


		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">킥보드 수리  신청</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form name="modelrepairForm" action="" method="post"
							class="row g-3">
							<div class="mt-0">

								<p class="form-control-plaintext">수리 신청할 제품번호 작성</p>
							</div>
							<div class="mt-0">
								<input type="text" name="kNum" class="form-control"
									placeholder="제품번호">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn"
							data-bs-dismiss="modal">돌아가기</button>
						<button type="button" class="btn bg-sub"
							onclick="sendModelrepair();">확인</button>
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

								<p class="form-control-plaintext">수리완료 신청할 제품번호 작성</p>
							</div>
							<div class="mt-0">
								<input type="text" name="kNum" class="form-control"
									placeholder="제품번호">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn"
							data-bs-dismiss="modal">돌아가기</button>
						<button type="button" class="btn bg-sub"
							onclick="sendModeldamage();">확인</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" tabindex="-1"
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

								<p class="form-control-plaintext">선파손 신청할 제품번호 작성</p>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn"
							data-bs-dismiss="modal">돌아가기</button>
						<button type="button" class="damagekick btn bg-sub"
							onclick="sendModeldamage();">확인</button>
					</div>
				</div>
			</div>
		</div>
				

	</div>
</div>