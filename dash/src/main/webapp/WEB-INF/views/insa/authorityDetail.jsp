<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h3 style="font-size: 18px; padding-top: 30px; padding-left: 20px;"><i class="fa-solid fa-angles-right"></i> 사원 정보</h3>
<table class="table td-border mx-auto my-10" style="width: 99%;">
	<tr>
		<td class="wp-15 text-center bg-sub">사원코드</td>
		<td class="wp-35 ps-5">${dto.empNo}</td>
		<td class="wp-15 text-center bg-sub">이름</td>
		<td class="wp-35 ps-5">${dto.name}</td>
	</tr>
	
	<tr>
		<td class="text-center bg-sub">계정 상태</td>
		<td colspan="3" class="ps-5">
			${dto.enabled==1?"활성":"잠금"}
			&nbsp;<span class="btn" onclick="employeeStateDetaileView();" style="cursor: pointer;"><i class="bi bi-plus-lg"></i> 자세히</span>
		</td>
	</tr>
</table>

<form id="deteailedEmployeeForm" name="deteailedEmployeeForm" method="post">
	<h3 style="font-size: 18px; padding-top: 30px; padding-left: 20px;"><i class="fa-solid fa-angles-right"></i> 상태 변경</h3>
	
	<table class="table td-border mx-auto">
		<tr>
			<td class="wp-15 text-center bg-sub">계정 상태</td> 
			<td class="ps-5">
				<select class="form-select" name="stateCode" id="stateCode" onchange="selectStateChange()">
					<option value="">상태 코드</option>
					<c:if test="${dto.enabled==0}">
						<option value="0">잠금 해제</option>
					</c:if>
					<option value="9">휴직</option>
					<option value="10">퇴사</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="pe-7 text-center bg-sub">메 모</td>
			<td class="ps-5">
				<input type="text" name="memo" id="memo" class="form-control" style="width: 100%;">
			</td>
		</tr>
	</table>
	
	<input type="hidden" name="empNo" value="${dto.empNo}">
	<input type="hidden" name="registerEmpNo" value="${sessionScope.employee.empNo}">
</form>

<div id="employeeStateDetaile" style="display: none; font-family: 'Pretendard-Regular';">
	<table class="table table-border mx-auto my-10">
		<thead>
			<tr style="height: 20px;">
				<th width="50%;" class="text-center">내용</th>
				<th width="20%;" class="text-center">담당자</th>
				<th width="30%;" class="text-center">등록일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="vo" items="${listState}">
				<tr style="height: 20px;">
					<td class="text-center">${vo.memo} (${vo.stateCode})</td>
					<td class="text-center">${vo.registerEmpNo}</td>
					<td class="text-center">${vo.reg_date}</td>
				</tr>
			</c:forEach>
	  
			<c:if test="${listState.size()==0}">
				<tr align="center" style="border: none;">
					<td colspan="3">등록된 정보가 없습니다.</td>
				</tr>  
			</c:if>
		</tbody>
	</table>  
</div>
