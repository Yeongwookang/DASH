<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<div class="m-auto scroll" style="width: 90%; height:85%; overflow-y: scroll;">
	<div><h4>| 결재</h4></div>
	<div class="ps-5 pe-5 mt-4">
		<form name="approval" method="POST" action="${pageContext.request.contextPath}/approval/write">
			<table class="table">
				<tbody>
				<tr>
					<td class="w-25 text-center align-middle" scope="row">제 목</td>
					<td class="w-75">
						<input name="title" type="text"  class="form-control" value="${dto.title}">
					</td>
				</tr>
				<tr>
					<td class="w-25 text-center align-middle" scope="row">기 안 자</td>
					<td class="w-75">
						<c:if test="${mode == 'write' }">
							${sessionScope.employee.depName}&nbsp;${sessionScope.employee.name}
							<input name= "empNo" type="hidden" value="${sessionScope.employee.empNo}" >
						</c:if>
						<c:if test="${mode == 'update'}">
							 ${dto.depName}&nbsp;${dto.name}
							 <input name= "empNo" type="hidden" value="${dto.empNo}">
						 </c:if>
					</td>
				</tr>
				<tr>
					<td class="text-center align-middle" scope="row">타임라인</td>
					<td class="d-flex ">
						<input type="text" class="form-control" value="${dto.timeLine}" readonly>
						<button type="button" class="btn bg-sub bg-gradient ms-2"><i class="fa-solid fa-magnifying-glass"></i></button>
					</td>
				</tr>
				<tr>
					<td class="text-center align-middle" scope="row">참조 <button type="button" class="btn bg-sub bg-gradient ms-2" data-bs-toggle="modal" data-bs-target="#newApproval"><i class="fa-solid fa-plus" ></i></button></td>
					<td class="d-flex refList">
						<input type="text" class="form-control me-2" id="ref1name" value="${ref1.depName}&nbsp;${ref1.name}" readonly>
						<input type="text" class="form-control me-2" id="ref2name" value="${ref2.depName}&nbsp;${ref2.name}" readonly>
						<input type="text" class="form-control me-2" id="ref3name" value="${ref3.depName}&nbsp;${ref3.name}" readonly>
						<input type="hidden" name="ref1" id="ref1" value="${dto.ref1}" readonly>
						<input type="hidden" name="ref2" id="ref2" value="${dto.ref2}" readonly>
						<input type="hidden" name="ref3" id="ref3" value="${dto.ref3}" readonly>
						<input type="hidden" name="refcnt" id="refcnt" readonly>
					</td>
				</tr>
				</tbody>
			</table>
		<textarea name="content" id="ir1" cols="10" >${dto.content}</textarea>
		<div class="d-flex justify-content-end mt-4">
			<button class="btn bg-light bg-gradient me-2" type="button">저장</button>
			<button class="btn bg-sub bg-gradient" type="submit">결재</button>
		</div>
		</form>
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
       				<tr class="sendInfo"><td colspan="6"><h4 class=" text-center m-5 text-muted">" 검색이 필요합니다 "</h4></td></tr>
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
        <button type="button" class="btn bg-sub writeBtn">완료</button>
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
<script src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/translations/ko.js"></script>
<script>
	ClassicEditor.create(document.querySelector("#ir1"),{
		language: "ko"
	});
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
			$(".searched").remove();
			//리스트 등록
			let i =1;
			for(let item of data.empList){
				let empNo= item.empNo;
				let dep = item.depName;
				let name= item.name;
				let pos= item.posName;
				let rank = item.rankName;
				let team = item.teamName;
				
				let out = "<tr class='searched'>";
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
				out += "<td class='empNo' style='display:none;'>"+empNo+"</td>"
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
		$(".refList").children().remove();
		$(".refList").append('<input type="text" class="form-control me-2" id="ref1name" value="${ref1.depName}&nbsp;${ref1.name}" readonly><input type="text" class="form-control me-2" id="ref2name" value="${ref2.depName}&nbsp;${ref2.name}" readonly><input type="text" class="form-control me-2" id="ref3name" value="${ref3.depName}&nbsp;${ref3.name}" readonly><input type="hidden" name="ref1" id="ref1" value="${dto.ref1}" readonly><input type="hidden" name="ref2" id="ref2" value="${dto.ref2}" readonly><input type="hidden" name="ref3" id="ref3" value="${dto.ref3}" readonly><input type="hidden" name="refcnt" id="refcnt" readonly>');
		let i= 1;
		for(let item of $(".sendTo tr")){
			let dep= item.cells[0].textContent;
			let team= item.cells[1].textContent;
			let pos= item.cells[2].textContent;
			let name= item.cells[3].textContent;
			let empNo= item.cells[4].textContent;
			
			
			$("#ref"+i+"name").val(dep+" "+name);
			
			$("#ref"+i).attr("value",empNo);
			i++;
		}
		
		$("#refcnt").val($(".sendTo tr").length);
		$("#newApproval").modal('hide');
		
	});
	
	$(function(){
		const d = new Date();
		let y = d.getFullYear();
		let m = d.getMonth()+1;
		let day = d.getDate();
		
		let date= y+"-"+m+"-"+day;
		$(".today").val(date);
		
	});
	
	
	
</script>
