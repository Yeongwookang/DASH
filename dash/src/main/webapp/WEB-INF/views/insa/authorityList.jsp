<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
#employee-dialog {
	font-family: 'Pretendard-Regular';
}
</style>
<script type="text/javascript">

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status === 403) {
				location.href="${pageContext.request.contextPath}/employee/login";
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function searchList() {
	const f = document.searchForm;
	f.enabled.value=$("#selectEnabled").val();
	f.action = "${pageContext.request.contextPath}/insa/authority/list";
	f.submit();
}
	
function detailedEmployee(empNo) {
	let dlg = $("#employee-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 수정 " : function() {
		    	   updateOk(); 
		       },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  create: function(){
				$(".ui-dialog-titlebar-close").addClass("btn-close");
				$(".ui-dialog-buttonset").find("button").addClass("btn");
				$(".ui-dialog-buttonset").find("button").addClass("btn-main");
		  },
		  title: "사원 상세 정보",
		  height: 550,
		  width: 800,
		  close: function(event, ui) {
		  }
	});

	let url = "${pageContext.request.contextPath}/insa/authority/detail";
	let query = "empNo="+empNo;
	
	const fn = function(data){
		$('#employee-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);
}
	
function updateOk() {
	const f = document.deteailedEmployeeForm;
	
	if(! f.stateCode.value) {
		f.stateCode.focus();
		return;
	}
	if(! $.trim(f.memo.value)) {
		f.memo.focus();
		return;
	}
	
	let url = "${pageContext.request.contextPath}/insa/authority/updateEmployeeState";
	let query=$("#deteailedEmployeeForm").serialize();

	const fn = function(data){
		$("form input[name=page]").val("${page}");
		searchList();
	};
	ajaxFun(url, "post", query, "json", fn);
		
	$('#employee-dialog').dialog("close");
}

function employeeStateDetaileView() {
	$('#employeeStateDetaile').dialog({
		  modal: true,
		  minHeight: 100,
		  maxHeight: 450,
		  width: 750,
		  title: '계정 상태 상세',
		  close: function(event, ui) {
			   $(this).dialog("destroy"); // 이전 대화상자가 남아 있으므로 필요
		  }
	  });	
}

function selectStateChange() {
	const f = document.deteailedEmployeeForm;
	
	let s = f.stateCode.value;
	let txt = f.stateCode.options[f.stateCode.selectedIndex].text;
	
	f.memo.value = "";	
	if(! s) {
		return;
	}

	if(s!=="0") {
		f.memo.value = txt;
	}
	
	f.memo.focus();
}
</script>

<div>
	<div class="mt-4">
	<div class="d-flex justify-content-between">
		<div class="title"><span>권한 관리</span></div>
		
		<div>
			<select id="selectEnabled" class="form-select" onchange="searchList();" style="width: 150px;">
				<option value="" ${enabled=="" ? "selected='selected'":""}>계정 상태</option>
				<option value="0" ${enabled=="0" ? "selected='selected'":""}>잠금 계정</option>
				<option value="1" ${enabled=="1" ? "selected='selected'":""}>활성 계정</option>
			</select>
		</div>
	</div>
	<div class="m-auto mt-4" align="center"> 			 
		<table class="table table-hover board-list-authority">
			<thead class="bg-main text-white"> 
				<tr class="text-center" style="font-size:1.2rem; height: 50px;"> 
					<th width="15%;">사원코드</th>
					<th width="15%;">이름</th>
					<th width="20%;">등록일</th>
					<th width="20%;">수정일</th>
					<th width="20%;">최근 로그인</th>
					<th width="10%;">상태</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr class="hover text-center" onclick="detailedEmployee('${dto.empNo}');"> 
						<td>${dto.empNo}</td>
						<td>${dto.name}</td>
						<td>${dto.register_date}</td>
						<td>${dto.modify_date}</td>
						<td>${dto.last_login}</td>
						<td>${dto.enabled==1?"활성":"잠금"}</td> 
					</tr>
				</c:forEach>
			</tbody>
		</table>
				 
		<div class="page-navigation paging mt-4 text-center">
			${dataCount == 0 ? "등록된 사원이 없습니다." : paging}
		</div>
				
		<table class="table table-borderless mb-5">
			<tr>
				<td align="left" width="100">
					<button type="button" class="btn btn-sub" onclick="location.href='${pageContext.request.contextPath}/insa/authority/list';"><i class="bi bi-arrow-counterclockwise"></i></button>
				</td>
				<td align="center">
					<form name="searchForm" action="${pageContext.request.contextPath}/insa/authority/list" method="post">
						<div class="d-flex justify-content-center m-auto">
							<div class="p-1">
								<select name="condition" class="form-select">
									<option value="empNo"     ${condition=="empNo" ? "selected='selected'":""}>사원코드</option>
									<option value="name"   ${condition=="userName" ? "selected='selected'":""}>이름</option>
								</select>
							</div>
							<div class="p-1">
								<input type="text" name="keyword" class="form-control" value="${keyword}">
							</div>
							<div class="p-1">
								<button type="button" class="btn btn-sub" onclick="searchList()"> <i class="bi bi-search"></i> </button>
							</div>
						<input type="hidden" name="enabled" value="${enabled}">
						<input type="hidden" name="page" value="1">
						</div>
					</form>
				</td>
				<td align="right" width="100">&nbsp;</td>
			</tr>
		</table>
		</div>
	</div> 	
</div>


<div id="employee-dialog" style="display: none;"></div>
