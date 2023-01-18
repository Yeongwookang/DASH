<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
function search(page){
	var index = 1;
	let condition = $("#condition").attr("selected",true).val();
	let keyword = $("#keyword").val();
	let query = "condition="+condition+"&keyword="+keyword+"&current_page="+page;
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
		
		//페이징 처리 
		$(".search-page").remove();
		let total_page= data.total_page;
		let paginate = "<nav class='search-page' aria-label='Page navigation'><ul class='pagination'>";
		for(let i=1; i<=total_page;i++){
			paginate += "<li class='page-item";
			if(page == i){
				paginate += " active"
			}
			paginate += "'><button type='button' class='page-link empSearchBtn' onclick='search("+i+")'>"+i+"</button></li>"	
		}
		paginate += "</ul></nav>"
		$(".paginate").append(paginate);

		$(".sendList").append("<input type='hidden' class='total_page' value='"+data.total_page+"' >");
		$(".sendList").append("<input type='hidden' class='current_page' value='"+data.current_page+"' >");
	}
	ajaxFun(url, "get", query, "JSON", fn);
};
</script>
<script type="text/javascript">
function write_document(){
	const f = document.approval;
	
	
	f.action = "${pageContext.request.contextPath}/approval/write"
	f.submit();
}
function update_document(){
	const f = document.approval;
	f.action = "${pageContext.request.contextPath}/approval/update"
	f.submit();
}
</script>
<div class="m-auto scroll card mt-5 mb-5 p-4" style="overflow-y: scroll;">
	<div class="fs-3 ps-4 mt-4"><span>| 결재</span></div>
	<div class="m-auto" style="width: 80%">
		<div class="ps-5 pe-5 mt-3">
		<form name="approval" method="POST"  enctype="multipart/form-data">			
			<div class="mb-2 pt-3 pb-3">
			<div class="d-flex align-items-center">
				<div class="w-25 p-2 text-white text-center bg-main fs-4" style="border-radius: 2rem 0 0 0 / 2rem 0 0 0">제목</div>
				<div class="w-75 fs-5 ms-3 me-3">
					<input name="title" type="text"  class="form-control" value="${dto.title}">
				</div>
			</div>
			<div class="d-flex align-items-center">
				<div class="w-25 p-2  text-white text-center bg-main fs-4">기안자</div>
				<div class="w-75 ms-3 me-3">
				<c:if test="${mode == 'write' }">
					${sessionScope.employee.depName}&nbsp;${sessionScope.employee.name}
					<input name= "empNo" type="hidden" value="${sessionScope.employee.empNo}" >
				</c:if>
				<c:if test="${mode == 'update'}">
					${dto.depName}&nbsp;${dto.name}
					<input name= "empNo" type="hidden" value="${dto.empNo}">
					<input name="signNum" type="hidden" value="${dto.signNum }">
				</c:if>
				</div>
			</div>
			
			<div class="d-flex align-items-center">
				<div class="w-25 p-2  text-white text-center bg-main fs-4">타임라인</div>
				<div class="d-flex w-75 ms-3 me-3">
					<input type="text" class="form-control" value="${dto.timeLine}" readonly>
					<button type="button" class="btn btn-main ms-2" data-bs-toggle="modal" data-bs-target="#timeLine" ><i class="fa-solid fa-magnifying-glass"></i></button>
				</div>
			</div>
			<div class="d-flex align-items-center">
				<div class="w-25 p-2  text-white text-center bg-main fs-4" style="border-radius: 0 0 0 2rem / 0 0 0 2rem">참 조</div>
				<div class="w-75 ms-3 me-3">
					<div class="d-flex refList">
						<input type="text" class="form-control me-2" id="ref1name" value="${ref1.depName}&nbsp;${ref1.name}" readonly>
						<input type="text" class="form-control me-2" id="ref2name" value="${ref2.depName}&nbsp;${ref2.name}" readonly>
						<input type="text" class="form-control me-1" id="ref3name" value="${ref3.depName}&nbsp;${ref3.name}" readonly>
						<input type="hidden" name="ref1" id="ref1" value="${dto.ref1}" readonly>
						<input type="hidden" name="ref2" id="ref2" value="${dto.ref2}" readonly>
						<input type="hidden" name="ref3" id="ref3" value="${dto.ref3}" readonly>
						<input type="hidden" name="refcnt" id="refcnt" value="${dto.max_state}" readonly>
						<button type="button" class="btn btn-main ms-2" data-bs-toggle="modal" data-bs-target="#empSearch" ><i class="fa-solid fa-plus"></i></button>
					</div>
				</div>
			</div>
			</div>		
			<textarea name="content" id="ir1" cols="10" >${dto.content}</textarea>
			
			<c:if test="${not empty fileList }">
			<div><h4>파일</h4></div>
			<c:forEach var="file" items="${fileList}" varStatus="status" >
			<div class=" d-flex form-control mb-2 justify-content-between">
				<div><button class="btn" type="button" onclick="location.href='${pageContext.request.contextPath}/approval/download/${file.fileNum}'"><i class="fa-solid fa-floppy-disk"></i> ${file.originalFilename} (${file.fileSize/1000} kb)</button></div> 
			<div><button class="btn" type="button" onclick="location.href='${pageContext.request.contextPath}/approval/deleteFile/${file.fileNum}?signNum=${dto.signNum}'"><i class="fa-solid fa-trash-can"></i></button></div>
			</div>
			</c:forEach>
			</c:if>
			<input class="form-control mt-3" type="file" name="addFiles" accept="approval/*" multiple="multiple" >
			
			<div class="d-flex justify-content-end mt-4">
				<c:if test="${mode =='update' }">
			<button class="btn btn-danger me-2" type="button" onclick="location.href='${pageContext.request.contextPath}/approval/delete/${dto.signNum}'">삭제</button>
			<button class="btn btn-sub bg-gradient" type="button" onclick="update_document();">수정</button>
			</c:if>
			<c:if test="${mode =='write' }">
			<button class="btn btn-main" type="button" onclick="write_document();">결재</button>
			</c:if>
				</div>
				</form>
		</div>
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
        		<div><span style="font-weight: bold">부서, 팀, 이름, 제목</span>으로 검색이 가능합니다.</div>
        	</div>
        	<div class="d-flex">
        	<select class="form-select me-2" id="condition">
	      		<option value="dep">부서</option>
	      		<option value="team">팀</option>
	      		<option value="name">이름</option>
	      		<option value="title">제목</option>
	      	</select>
        	<input class="form-control" id="keyword">
        	<button type="button" class="btn btn-main ms-2" ><i class="fa-solid fa-magnifying-glass"></i></button>
        	</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sub" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade text-center" id="empSearch" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="newApprovalLabel" aria-hidden="true">
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
	      	<button type="button" class="btn bg-sub bg-gradient ms-2 empSearchBtn" onclick="search(1);"><i class="fa-solid fa-magnifying-glass"></i></button>
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
       		<div class="paginate d-flex justify-content-center">
       			
       		</div>
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
				alert('요청 처리가 실패 했습니다.');
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
	var editor;
	ClassicEditor
	.create(document.querySelector("#ir1"),{
	    language: "ko"
	})
	.then( newEditor=>{editor=newEditor;})
	.catch(error=>{
	    console.log(error)
	});
</script>

<script type="text/javascript">	
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
