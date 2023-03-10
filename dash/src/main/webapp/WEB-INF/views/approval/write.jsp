<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
function searchTimeline(page){
	let condition = $("#condition_tl").attr("selected",true).val();
	let keyword = $("#keyword_tl").val();
	let query = "condition="+condition+"&keyword="+keyword+"&current_page="+page;
	let url = "${pageContext.request.contextPath}/approval/timelineSearch";

	const fn_tl = function(data){
		$(".searched_tl").remove();
		//리스트 등록
		let i =1;
		for(let item of data.tlList){
			let tlName = item.tlName;
			let tlNum = item.tlNum;
			let reg_date = item.reg_date;
			let empNo = item.empNo;
			let name = item.name;
			let tlState = item.tlState;
			
			let out = "<tr class='searched_tl "+tlNum+"'>";
			out += "<td>"+i+"</td>";
			out += "<td class='tlNum' style='display:none;'>"+tlNum+"</td>";
			out += "<td class='tlName elipsis'>"+tlName+"</td>";
			out += "<td class='name'>"+name+"</td>";
			out += "<td class='empNo' style='display:none;'>"+empNo+"</td>";
			out += "<td class='state' style='display:none;'>"+tlState+"</td>";
			out += "<td class='reg_date'>"+reg_date+"</td>";
			out += "</tr>";
			
			$(".sendInfo_tl").remove();
			
			$(".sendList_tl").append(out);
			
			$("."+tlNum).click(function(){
				$("#tlNum").val(tlNum);
				$("#tlName").val(tlName);
				$("#timeLine").modal("hide");
			});
			i++;
			
		}
		
		//페이징 처리 
		$(".search-page_tl").remove();
		let total_page= data.total_page;
		let paginate = "<nav class='search-page_tl' aria-label='Page navigation'><ul class='pagination'>";
		for(let i=1; i<=total_page;i++){
			paginate += "<li class='page-item";
			if(page == i){
				paginate += " active"
			}
			paginate += "'><button type='button' class='page-link timelineSearchBtn' onclick='search("+i+")'>"+i+"</button></li>"	
		}
		paginate += "</ul></nav>"
		$(".paginate_tl").append(paginate);

		$(".sendList_tl").append("<input type='hidden' class='total_page' value='"+data.total_page+"' >");
		$(".sendList_tl").append("<input type='hidden' class='current_page' value='"+data.current_page+"' >");
	}
	ajaxFun(url, "get", query, "JSON", fn_tl);
};
</script>

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
	
	if(f.title.value.trim()==""){
		alert('제목이 없습니다.')
		f.title.focus();
		return;
	}
	
	if(f.refcnt.value.trim()==""){
		alert('참조한 인원이 없습니다.')
		f.refcnt.focus();
		return;
	}
	
	str = editor.getData().trim();
	if( !str || str === "<p><br></p>" ) {
		alert("내용을 입력하세요.");
		f.content.focus();
		return false;
	}
	
	f.action = "${pageContext.request.contextPath}/approval/write"
	f.submit();
}
function update_document(){
	const f = document.approval;
	
	if(f.title.value.trim()==""){
		alert('제목이 없습니다.')
		f.title.focus();
		return;
	}
	
	if(f.refcnt.value.trim()==""){
		alert('참조한 인원이 없습니다.')
		f.refcnt.focus();
		return;
	}
	
	str = editor.getData().trim();
	if( !str || str === "<p><br></p>" ) {
		alert("내용을 입력하세요.");
		f.content.focus();
		return false;
	}
	
	f.action = "${pageContext.request.contextPath}/approval/update"
	f.submit();
}
function normalMode(){
	$(".dayoffMode").remove();
}
function dayoffMode(){
	let out ="<div class='dayoffMode d-flex align-items-center'>";
	out += "<div class='p-2 text-white text-center bg-main fs-5 fw-bold' style='width:20%'>휴가</div>"
	out += "<div class='ms-4 d-flex align-items-center' style='width:80%'>";
	out += "<div class='me-2 w-25'><select class='form-select' name='vacationType'><option value='dayoff'>연차</option><option value='vacation'>특별휴가</option></select></div>"
	out += "<input class='form-control' type='date' name='startDate'>";
	out += "<span class='ms-2 me-2'>~</span><input class='form-control' type='date' name='endDate'>";
	out += "</div>";
	out += "</div>";
	$(".form-box").append(out);
}

$(function(){
	$("#type").change(function(){
		if($("#type option:selected").val() == "dayoff"){
			dayoffMode();
		} else {
			normalMode();
		}
	});
	
});
</script>
<div>
<form name="approval" method="POST"  enctype="multipart/form-data">			
	<div class="d-flex justify-content-between align-items-center mt-4">
		<div class="title">
			<span>결재 작성</span>
		</div>
		<div>
			<select name="type" id="type" class="form-select">
				<option value="normal">일반결재</option>
				<option value="bill">비용처리</option>
				<option value="dayoff">휴가사용</option>
			</select>
		</div>
	</div>	
	<div class="mt-4">
			<div class="mb-3 form-box">
				<div class="d-flex align-items-center">
					<div class="p-2 text-white text-center bg-main fs-5" style="font-weight: bold; width:20%">제목</div>
					<div class="ms-4" style="width: 80%">
						<input name="title" type="text"  class="form-control" value="${dto.title}">
					</div>
				</div>
				<div class="d-flex align-items-center">
					<div class="p-2 text-white text-center bg-main fs-5" style="font-weight: bold; width:20%">기안자</div>
					<div class="ms-4" style="width: 80%">
					<c:if test="${mode == 'write' }">
						${sessionScope.employee.depName}&nbsp;${sessionScope.employee.name}
						<input name= "empNo" type="hidden" value="${sessionScope.employee.empNo}" >
					</c:if>
					<c:if test="${mode == 'update'}">
						${dto.depName}&nbsp;${dto.name}
						<input name= "empNo" type="hidden" value="${dto.empNo}">
						<input name="signNum" type="hidden" value="${dto.signNum}">
					</c:if>
					</div>
				</div>
				
				<div class="d-flex align-items-center">
					<div class="p-2 text-white text-center bg-main fs-5" style=" font-weight: bold; width:20%">타임라인</div>
					<div class="d-flex ms-4" style="width: 80%">
						<input type="text" class="form-control me-2" name="tlName" id="tlName" value="${tldto.tlName}" readonly>
						<button type="button" class="btn btn-main " data-bs-toggle="modal" data-bs-target="#timeLine" ><i class="fa-solid fa-magnifying-glass"></i></button>
						<input type="hidden" name="tlNum" id="tlNum" value="${tldto.tlNum}" readonly>
					</div>
				</div>
				<div class="d-flex align-items-center justify-content-between">
					<div class="p-2 text-white text-center bg-main fs-5" style="font-weight: bold; width:20%">참조</div>
					<div class="ms-4" style="width: 80%">
						<div class="d-flex refList">
							<input type="text" class="form-control me-2" id="ref1name" value="${ref1.depName}&nbsp;${ref1.name}" readonly>
							<input type="text" class="form-control me-2" id="ref2name" value="${ref2.depName}&nbsp;${ref2.name}" readonly>
							<input type="text" class="form-control me-2" id="ref3name" value="${ref3.depName}&nbsp;${ref3.name}" readonly>
							<input type="hidden" name="ref1" id="ref1" value="${dto.ref1}" readonly>
							<input type="hidden" name="ref2" id="ref2" value="${dto.ref2}" readonly>
							<input type="hidden" name="ref3" id="ref3" value="${dto.ref3}" readonly>
							<input type="hidden" name="refcnt" id="refcnt" value="${dto.max_state}" readonly>
							<button type="button" class="btn btn-main " data-bs-toggle="modal" data-bs-target="#empSearch" ><i class="fa-solid fa-plus"></i></button>
						</div>
					</div>
				</div>
			</div>		
			
			<div class="mt-4">
				<textarea name="content" id="ir1" cols="10" >${dto.content}</textarea>
			</div>

			
			<c:if test="${not empty fileList }">
			<div class="mt-4">
			<div><h4>파일</h4></div>
			<c:forEach var="file" items="${fileList}" varStatus="status" >
			<div class=" d-flex form-control mb-2 justify-content-between">
				<div><button class="btn" type="button" onclick="location.href='${pageContext.request.contextPath}/approval/download/${file.fileNum}'"><i class="fa-solid fa-floppy-disk"></i> ${file.originalFilename} (${file.fileSize/1000} kb)</button></div> 
			<div><button class="btn" type="button" onclick="location.href='${pageContext.request.contextPath}/approval/deleteFile/${file.fileNum}?signNum=${dto.signNum}'"><i class="fa-solid fa-trash-can"></i></button></div>
			</div>
			</c:forEach>
			</div>
			</c:if>
			<div class="mt-4">
				<input class="form-control" type="file" name="addFiles" accept="approval/*" multiple="multiple" style="border-radius: 0 0 0 0/ 0 0 0 0">
			</div>
			
			<div class="d-flex justify-content-end mt-4">
				<c:if test="${mode =='update' }">
			<button class="btn btn-danger me-2" type="button" onclick="location.href='${pageContext.request.contextPath}/approval/delete/${dto.signNum}'">삭제</button>
			<button class="btn btn-sub bg-gradient" type="button" onclick="update_document();">수정</button>
			</c:if>
			<c:if test="${mode =='write' }">
			<button class="btn btn-main" type="button" onclick="write_document();">결재</button>
			</c:if>
				</div>
		</div>
	</form>
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
        
        	<div class="alert bg-sub text-center" role="alert">
        		<div>타임라인이란, </div>
        		<div><span style="font-weight: bold">여러 결재를 하나로 묶어 시간순으로 배열하는 것</span>을 의미합니다.</div>
        		<div>프로젝트 단위의 결재를 처리하는데 용이하며,</div>
        		<div><span style="font-weight: bold">부서, 팀, 이름, 제목</span>으로 검색이 가능합니다.</div>
        	</div>
        	<div class="d-flex">
        	<select class="form-select me-2" id="condition_tl">
	      		<option value="dep">부서</option>
	      		<option value="team">팀</option>
	      		<option value="name">이름</option>
	      		<option value="tlName">제목</option>
	      	</select>
        	<input class="form-control" id="keyword_tl">
        	<button type="button" class="btn btn-sub ms-2" id="searchTimeline" onclick="searchTimeline(1);" ><i class="fa-solid fa-magnifying-glass"></i></button>
        	</div>
       
      <div class="form-control mt-4">
       		<table class="table table-hover text-center mt-2">
       			<thead>
        			<tr>
        				<th style="width: 5%">#</th>
        				<th style="width: 45%">타임라인명</th>
	       				<th style="width: 15%">관리자</th>
	       				<th style="width: 35%">생성일</th>
        			</tr>
       			</thead>
       			<tbody class="sendList_tl">
       				<tr class="sendInfo_tl"><td colspan="6"><h4 class=" text-center m-5 text-muted">" 검색이 필요합니다 "</h4></td></tr>
       			</tbody>
       		</table>
       		<div class="paginate_tl d-flex justify-content-center">
       			
       		</div>
       	</div>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sub" data-bs-dismiss="modal">닫기</button>
      </div>
      </div>
    </div>
  </div>


<!-- Modal -->
<div class="modal fade text-center" id="empSearch" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="empSearchLabel" aria-hidden="true">
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
	      	<button type="button" class="btn btn-sub ms-2 empSearchBtn" onclick="search(1);"><i class="fa-solid fa-magnifying-glass"></i></button>
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
        <button type="button" class="btn btn-sub" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-main writeBtn">완료</button>
      </div>
    </div>
  </div>
</div>

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
		$("#empSearch").modal("hide");
		
	});
	
	$(function(){
		const d = new Date();
		let y = d.getFullYear();
		let m = d.getMonth()+1;
		let day = d.getDate();
		
		let date= y+"-"+m+"-"+day;
		$(".today").val(date);
		if("${mode}" == "write"){
			$("#refcnt").attr("value",'0');
			$("#state").attr("value",'0');
			$("#max_state").attr("value",'0');
			$("#tlNum").attr("value",'0');
		}	
		
		
	});
	
</script>
