<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">
.dialog-receiver-list {
   height: 200px;
   overflow-y: scroll;
}
.dialog-receiver-list ul, .dialog-receiver-list li {
   list-style: none;
   padding: 0;
}

.receiver-user {
   color: #0d58ba;
   margin-right: 3px;
   cursor: pointer;
}
</style>
<script type="text/javascript">
function check() {
    const f = document.vacationForm;
	let str;
	
	if($("#forms-receiver-list input[name=empNo]").length === 0) {
	    alert("사원코드를 추가하세요.");
	    return;
	}
	
    str = f.gainQty.value.trim();
    if(!str) {
        alert("획득일수를 입력하세요.");
        f.subject.focus();
        return;
    }
    
    str = f.expireDate.value.trim();
    if(!str) {
        alert("만료일을 입력하세요.");
        f.expireDate.focus();
        return;
    }

    str = editor.getData().trim();
	if( !str || str === "<p><br></p>" ) {
		alert("사유를 입력하세요.");
		f.content.focus();
		return false;
	}

    f.action = "${pageContext.request.contextPath}/punching/${mode}";
    f.submit(); 
}
</script>
<script>
$(function(){
	   $(".btnReceiverDialog").click(function(){
	      $("#condition").val("name");
	      $("#keyword").val("");
	      $(".dialog-receiver-list ul").empty();
	      
	      $("#myDialogModal").modal("show");
	      s = '<li class="fs-4 text-muted p-4 text-center mt-5">'+ '" 검색이 필요합니다. "' + '</li>';
	      $(".dialog-receiver-list ul").append(s);
	   });
	   
	   // 대화상자 - 받는사람 검색 버튼
	   $(".btnReceiverFind").click(function(){
	      let condition = $("#condition").val();
	      let keyword = $("#keyword").val();
	      if(! keyword) {
	         $("#keyword").focus();
	         return false;
	      }
	      
	      listEmployee(condition, keyword);
	      
	   });
	   
	   function listEmployee(condition, keyword){
	      let url = "${pageContext.request.contextPath}/message/listEmployee"; 
	      let query = "condition="+condition+"&keyword="+encodeURIComponent(keyword);
	      
	      const fn = function(data){
	         $(".dialog-receiver-list ul").empty();
	         // console.log(data.listEmployee);
	         searchListEmployee(data);
	      };
	      ajaxFun(url, "get", query, "json", fn);
	   }
	   
	   function searchListEmployee(data) {
	      let s;
	      for(let i=0; i<data.listEmployee.length; i++) {
	         let empNo = data.listEmployee[i].empNo;
	         let name = data.listEmployee[i].name;
	         
	         s = "<li><input type='checkbox' class='form-check-input' data-empNo='"+empNo+"' title='"+empNo+"'> <span>"+ empNo + "&nbsp;" + name + "</span></li>";
	         $(".dialog-receiver-list ul").append(s);
	      }
	   }
	   
	   // 대화상자-받는 사람 추가 버튼
	   $(".btnAdd").click(function(){
	      let len1 = $(".dialog-receiver-list ul input[type=checkbox]:checked").length;
	      let len2 = $("#forms-receiver-list input[name=empNo]").length;
	      
	      if(len1 === 0) {
	         alert("추가할 사람을 먼저 선택하세요.");
	         return false;         
	      }
	      
	      if(len1 + len2 >= 2) {
	         alert("사원코드 선택은 1명만 가능합니다.");
	         return false;
	      }
	      
	      var b, empNo, name, s;

	      b = false;
	      $(".dialog-receiver-list ul input[type=checkbox]:checked").each(function(){
	         empNo = $(this).attr("data-empNo");
	         name = $(this).next("span").text();
	         
	         $("#forms-receiver-list input[name=empNo]").each(function(){
	            if($(this).val() === empNo) {
	               b = true;
	               return false;
	            }
	         });
	         
	         if(! b) {
	            s = "<span class='receiver-user btn border px-1 ps-2 pe-2' style='color:black'>"+name+" <i class='fa-solid fa-xmark' data-empNo='"+empNo+"'></i></span>";
	            $(".forms-receiver-name").append(s);
	            
	            s = "<input type='hidden' name='empNo' value='"+empNo+"'>";
	            $("#forms-receiver-list").append(s);
	         }
	      });
	      
	      $("#myDialogModal").modal("hide");
	   });
	   
	   $(".btnClose").click(function(){
	      $("#myDialogModal").modal("hide");
	   });
	   
	   $("body").on("click", ".fa-xmark", function(){
	      let empNo = $(this).attr("data-empNo");
	      
	      $(this).parent().remove();
	      $("#forms-receiver-list input[name=empNo]").each(function(){
	         let receiver = $(this).val();
	         if(empNo === receiver) {
	            $(this).remove();
	            return false;
	         }
	      });
	      
	   });

	});
</script>

<div>
	<div class="title mt-4">
		<span>특별휴가</span>
	</div>
	<div class="m-auto mt-4">
		<form name="vacationForm" method="post">
			<table class="table">
				<tr>
                     <td class="w-25 text-center align-middle" scope="row">사원코드</td>
                     <td class="w-75">
                        <div class="row"> 
                           <div class="col-auto pe-0">
                              <button type="button" class="btn btnReceiverDialog btn-main">+ 추가</button>
                           </div>
                           <div class="col">
                              <div class="forms-receiver-name"></div>
                           </div>
                        </div>
                     </td>
                </tr>
				<tr>
					<td class="w-25 text-center align-middle" scope="row">획득일수</td>
					<td class="w-75">
						<input name="gainQty" type="number" class="form-control" min="1" max="30" value="${dto.gainQty}"> 
					</td>
				</tr>
				<tr>
					<td class="w-25 text-center align-middle" scope="row">만료일</td>
					<td class="w-75">
						<input class="form-control" type="date" name="expireDate" value="${dto.expireDate}">
					</td>
				</tr>
				<tr>
					<td class="w-25 text-center align-middle" scope="row">사유</td>
					<td class="w-75">
						<textarea name="content" id="ir1" class="form-control" style="width: 95%; height: 270px;">${dto.content}</textarea>
					</td>
				</tr>
			
			</table>
			
			<table class="table table-borderless">
					<tr>
					<td class="text-center"> 
						<div class="mt-4 mb-4 d-flex justify-content-center">
							<div class="me-3">  
								<button class="btn btn-main text-white" type="button" onclick="check();">${mode=='update'?'수정':'등록'}&nbsp;<i class="bi bi-check-all"></i></button>
							</div> 
							<div class="me-3"> 
								<button class="btn btn-sub bg-gradient" type="reset">다시입력&nbsp;<i class="bi bi-arrow-clockwise"></i></button>
							</div>
							<div> 
								<button class="btn btn-sub bg-gradient" type="button" onclick="location.href='${pageContext.request.contextPath}/punching/main';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							</div>
							<div id="forms-receiver-list"></div>
						</div>
						<c:if test="${mode=='update'}">
							<input type="hidden" name="gainNum" value="${dto.gainNum}">
							<input type="hidden" name="page" value="${page}">
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<div class="modal fade" id="myDialogModal" tabindex="-1" 
      data-bs-backdrop="static" data-bs-keyboard="false"
      aria-labelledby="myDialogModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="myDialogModalLabel">사원코드</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
            <div class="row">
               <div class="col-auto p-1">
                  <select name="condition" id="condition" class="form-select">
                     <option value="name">이름</option>
                     <option value="e.empNo">사원번호</option>
                     <option value="depName">부서</option>
                     <option value="rankName">직급</option>
                     <option value="posName">직책</option>
                  </select>
               </div>
               <div class="col-auto p-1">
                  <input type="text" name="keyword" id="keyword" class="form-control">
               </div>
               <div class="col-auto p-1">
                  <button type="button" class="btn btn-sub btnReceiverFind"> <i class="bi bi-search"></i> </button>
               </div>            
            </div>
            <div class="row p-1">
               <div class="border p-1 dialog-receiver-list">
                  <ul>
         
                  </ul>
               </div>
            </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-main btnAdd">추가</button>
            <button type="button" class="btn btn-sub btnClose">닫기</button>
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
