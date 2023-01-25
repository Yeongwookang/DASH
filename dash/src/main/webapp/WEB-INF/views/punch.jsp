<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:choose>
   <c:when test="${empty clockList}">
      <div class="fs-4 text-muted p-4 text-center"> " 내역이 없습니다. " </div>
   </c:when>
   <c:otherwise>
      <div class="mt-2">
         <table class="table hover-table text-center">
            <thead>
               <tr>
                  <th>#</th>
                  <th>일자</th>
                  <th>구분</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach items="${clockList}" var="dto" varStatus="status">
                  <tr>
                     <td>${status.index + 1}</td>
                     <td>${dto.clock_time}</td>
                     <td>${dto.punch_kind}</td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
      </div>
      
      <div class="page-navigation paging mt-4 text-center">
         ${dataCount == 0 ? "등록된 공지사항이 없습니다." : paging}
      </div> 
   </c:otherwise>
</c:choose>