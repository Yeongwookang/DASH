<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row d-flex flex-column ms-4 me-4" style="height: 95%">
	<div class="text-start fs-5 mb-5">  
		<span>| 통계</span>
	</div>
	<div>
	<form name="approval-search"  method="post">
		<div class="d-flex justify-content-end"> 
				<select name="selectTime" id="selectTime" class="form-select" onchange="changeTime();" style="width: 10%">
					<option value="">선 택</option>
					<option>년</option>  
					<option>월</option>
					<option>일</option>
				</select>
			<button type="button" class="btn bg-sub bg-gradient ms-2"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div>
	</form>
	</div>
	<div class="mt-4">
		<div class="card">
			<div class="card-body">
				<div id="chart-container"></div>
			</div>
		</div>
	</div>
</div> 
