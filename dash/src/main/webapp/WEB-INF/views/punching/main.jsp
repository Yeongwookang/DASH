<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<div>
	<div class="title mt-4">
		<span>특별휴가 관리</span>
	</div>
	<div class="m-auto mt-4">
		<table class="table table-hover board-list">
			<thead class="bg-main text-white"> 
					<tr class="text-center" style="font-size:1.2rem; height: 50px;">  
						<th style="width: 10%">순번</th>
						<th style="width: 15%">사원번호</th> 
						<th style="width: 36%">사유</th> 
						<th style="width: 10%">획득일</th> 
						<th style="width: 10%">만료일</th>
					</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr class="text-center" style="height: 60px;">  
						<td class="align-middle">${dataCount - (page-1) * size - status.index}</td>
						<td class="align-middle">${dto.empNo}</td>
						<td class="align-middle">${dto.content}</td>
						<td class="align-middle date">${dto.gainDate}</td>
						<td class="align-middle date">${dto.expireDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>  
	
		<div class="page-navigation paging mt-4 text-center">
			${dataCount == 0 ? "등록된 특별휴가가 없습니다." : paging}
		</div>
		
		<table class="table table-borderless mb-5 mt-5">
			<tr>
				<td align="left" width="100">
					<button type="button" class="btn btn-sub" onclick="location.href='${pageContext.request.contextPath}/punching/main';"><i class="bi bi-arrow-counterclockwise"></i></button>
				</td>
				<td align="center">
					<form name="searchForm" action="${pageContext.request.contextPath}/punching/main" method="post">
						<div class="d-flex justify-content-center m-auto">
							<div class="p-1">
								<select name="condition" class="form-select">
									<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
									<option value="empNo" ${condition=="empNo"?"selected='selected'":""}>사원코드</option>
									<option value="gainDate" ${condition=="gainDate"?"selected='selected'":""}>획득일</option>
									<option value="expireDate" ${condition=="reg_date"?"selected='selected'":""}>만료일</option>
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
				</td>
				<td align="right" width="100">
					<button type="button" class="btn btn-sub" onclick="location.href='${pageContext.request.contextPath}/punching/write';">등록</button>
				</td>
			</tr>
		</table>
	</div>
</div>


