<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.table .ellipsis {
   position: relative;
   min-width: 200px;
}
.table .ellipsis span {
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
   position: absolute;
   left: 9px;
   right: 9px;
   cursor: pointer;
}
.table .ellipsis:before {
   content: '';
   display: inline-block;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
$(function(){
   let menu = "${menuItem}";
   $("#tab-"+menu).addClass("active");
   
    $("button[role='tab']").on("click", function(e){
      const tab = $(this).attr("data-tab");
      let url = "${pageContext.request.contextPath}/message/"+tab+"/main";
      location.href=url;
    });
});

function searchList() {
   const f = document.searchForm;
   f.submit();
}

$(function() {
    $("#chkAll").click(function() {
      if($(this).is(":checked")) {
         $("input[name=nums]").prop("checked", true);
        } else {
         $("input[name=nums]").prop("checked", false);
        }
    });
 
    $(".btnDelete").click(function(){
      let cnt = $("input[name=nums]:checked").length;

      if (cnt === 0) {
         alert("삭제할 쪽지를 먼저 선택하세요.");
         return;
      }
         
      if(confirm("선택한 쪽지를 삭제하시겠습니까 ? ")) {
         const f = document.listForm;
         f.action = "${pageContext.request.contextPath}/message/${menuItem}/delete";
         f.submit();
      }
   });
});
</script>

<div>
   <div class="title mt-4">
      <span>쪽지</span>
   </div>
   <div class="m-auto mt-4"> 
      <ul class="nav nav-tabs" id="myTab" role="tablist">
         <li class="nav-item" role="presentation">
            <button class="nav-link" id="tab-receive" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="receive" aria-selected="true" data-tab="receive" style="color: black;">받은 쪽지함</button>
         </li>
         <li class="nav-item" role="presentation">
            <button class="nav-link" id="tab-send" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="send" aria-selected="true" data-tab="send" style="color: black;">보낸 쪽지함</button>
         </li>
      </ul>
         
      <div class="tab-content pt-2" id="nav-tabContent">
         <div class="tab-pane fade show active mt-3" id="nav-content" role="tabpanel" aria-labelledby="nav-tab-content">
         
            <table class="table table-borderless mb-0">
               <tr>
                  <td align="left" width="50%">
                     <button type="button" class="btn btnDelete p-1" title="삭제"><i class="fa-regular fa-trash-can"></i></button>
                  </td>
                  <td align="right">
                     <button type="button" class="btn btn-sub" onclick="javascript:location.href='${pageContext.request.contextPath}/message/write';">쪽지 작성</button>
                  </td>
               </tr>
            </table>
            
            <form name="listForm" method="post">
               <table class="table table-hover msg-list-table">
                  <thead class="bg-main text-white">
                     <tr class="text-center">
                        <th style="width: 5%;"><input type="checkbox" name="chkAll" id="chkAll" class="form-check-input"></th>
                        <th style="width: 30%;" class="text-center">내용</th>
                        <th style="width: 10%;">${menuItem=="receive"?"발신자":"수신자"}</th>
                        <th style="width: 25%;">발신 날짜</th>
                        <th style="width: 25%;">수신 날짜</th> 
                     </tr>  
                  </thead>
                  
                  <tbody>
                     <c:forEach var="dto" items="${list}">
                        <tr class="text-center">
                           <td><input type="checkbox" name="nums" value="${dto.num}" class="form-check-input"></td>
                           <td class="left ellipsis">
                              <span>
                                 <a href="${articleUrl}&num=${dto.num}" class="text-reset">${dto.content}</a>
                              </span>
                           </td>
                           <td>${menuItem=="receive"?dto.senderName:dto.receiverName}</td>
                           <td>${dto.sendDay}</td>
                           <td>${dto.identifyDay}</td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
               
               <input type="hidden" name="page" value="${page}">
               <input type="hidden" name="condition" value="${condition}">
               <input type="hidden" name="keyword" value="${keyword}">                  
            </form>
            
            <div class="page-navigation paging mt-4 mb-4 text-center">
               ${dataCount == 0 ? "쪽지가 없습니다." : paging}
            </div>            
         
            <div class="row board-list-footer">
               <div class="col text-start">
                  <button type="button" class="btn btn-sub" onclick="location.href='${pageContext.request.contextPath}/message/${menuItem}/main';"><i class="bi bi-arrow-counterclockwise"></i></button>
               </div>
               <div class="col-6 text-center">
                  <form class="row" name="searchForm" action="${pageContext.request.contextPath}/message/${menuItem}/main" method="post">
                     <div class="d-flex justify-content-center m-auto">         
                        <div class="p-1">
                           <select name="condition" class="form-select">
                              <option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
                              <c:choose>
                                 <c:when test="${menuItem=='receive'}">
                                    <option value="senderName" ${condition=="senderName"?"selected='selected'":""}>발신자</option>
                                    <option value="senderEmpNo" ${condition=="senderName"?"selected='selected'":""}>사원코드</option>
                                    <option value="sendDay" ${condition=="sendDay"?"selected='selected'":""}>수신 날짜</option>
                                 </c:when>
                                 <c:otherwise>
                                    <option value="receiverName" ${condition=="receiverName"?"selected='selected'":""}>수신자</option>
                                    <option value="receiverEmpNo" ${condition=="receiverId"?"selected='selected'":""}>사원코드</option>
                                    <option value="sendDay" ${condition=="sendDay"?"selected='selected'":""}>발신 날짜</option>
                                 </c:otherwise>
                              </c:choose>
                           </select>
                        </div>
                        <div class="p-1">
                           <input type="text" name="keyword" value="${keyword}" class="form-control">
                        </div>
                        <div class="p-1">
                           <button type="button" class="btn btn-sub" onclick="searchList()"> <i class="bi bi-search"></i> </button>
                        </div>
                     </div>
                     
                  </form>
               </div>
               <div class="col text-end"> 
                  &nbsp;
               </div>
            </div>
         
         </div>
      </div>

   </div>
</div>
