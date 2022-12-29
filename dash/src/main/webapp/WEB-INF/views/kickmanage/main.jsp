<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="scroll" style="width: 90%; height: 85%; overflow-y: scroll;">
	<div class="container">
		<div class="text-start fs-4 mb-4">
			<span>| 킥보드 관리</span>
		</div>

		<table class="table table-hover board-list">
			<thead class="table-light">
				<tr>
					<th style="width: 20%">번호</th>
					<th style="width: 20%">이름</th>
					<th style="width: 20%">상태</th>
					<th style="width: 20%">현황</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="dto" items="${list}"  varStatus="status">
					<tr>
						<td>${dto.kNum}</td>
						<td>${dto.name}</td>
						<td>${dto.state}</td>
						<td>${rlist[status.index].condition}</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>

	</div>
</div>