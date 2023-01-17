<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<div class="m-auto mt-5 mb-5">
	<div id="carouselExampleIndicators" class="carousel slide border mb-3 rounded" data-bs-ride="carousel" style="height: 10rem; background: #ffffff">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="..." class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="..." class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="..." class="d-block w-100" alt="...">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
		<div class="d-flex justify-content-between mb-3">
		<div class="card" style="width: 49%;"> 
			
		</div>
		
		<div class="card p-4"  style="width: 49%">
			<div class="d-flex align-items-end">
				<span style="font-weight: 700; font-size: 1.2rem;">${msg}</span>
				<span style="font-weight: 500; font-size: 1.1rem; ">&nbsp;&nbsp;${dayOfWeek}</span>
			</div>
			<div class="d-flex justify-content-between mt-3">
				<div class="border-end" style="width:47%">
					<div class="d-flex align-items-center">
						<div><span style="font-weight: bold;">출퇴근 정보</span></div>
						<div>
						<select class="form-select ms-3">
							<option>출근</option>
							<option>퇴근</option>
						</select>
						</div>
					</div>
					<div class="d-flex mt-3">
						<div><span style="font-weight: bold; color:#495057;">근무시간</span></div>
						<div><span style="color:#868e96">&nbsp;시간 / 시간</span></div>
					</div>
					<div class="d-flex mt-3">
						<div><span style="font-weight: bold;  color:#495057;">잔여근무가능시간</span></div>
						<div><span style="color:#868e96">&nbsp;시간</span></div>
					</div>
				</div>
				<div class="w-50"> 
					<div>
						<button type="button" class="btn bg-main btn-Point text-white" style="border: none;">출근</button>
						<button type="button" class="btn bg-main btn-Point text-white" style="border: none;">퇴근</button>
						<button type="button" class="btn btn-light">출퇴근현황</button>
					</div>
					<div class="d-flex">
						<div class="mt-3" style="font-weight: bold; color:#495057;">오늘 출근 시각 </div>
						<div id="clockOnTime"></div>
					</div>
					<div class="d-flex">
						<div class="mt-3" style="font-weight: bold; color:#495057;">오늘 퇴근 시각 </div>
						<div id="clockOffTime"></div>
					</div>
				</div>
			</div>
		</div>
		</div> 
		<div class="d-flex justify-content-between mb-3">
			<div class="card " style="width: 49%; height: 350px;"> 
				<div class="d-flex justify-content-between">
					<div class="text-start sales ms-3 mt-3">| 공지사항</div>
					<div class="me-4 mt-4"><a href="${pageContext.request.contextPath}/notice/main" class="underline text-reset gooo">바로가기 ></a></div>
				</div>
					<table class="table table-hover board-list-main m-auto" style="width: 90%"> 
						<thead>  
							<tr class="text-center">
								<th style="width: 10%">#</th> 
								<th style="width: 60%">제목</th>
								<th style="width: 30%">날짜</th>  
							</tr>
						</thead>
						<tbody> 
							<c:forEach var="dto" items="${listTop}" begin="0" end="1">
								<tr class="text-center"> 
									<td><span class="badge bg-danger">공지</span></td> 
									<td>
										<a href="${pageContext.request.contextPath}/notice/article?page=1&num=${dto.num}" class="text-reset underline">${dto.subject}</a>
									</td>
									<td class="communityDate">${dto.reg_date}</td>
								</tr>
							</c:forEach>
								
							<c:forEach var="dto" items="${list}" varStatus="status" begin="0" end="2">
								<tr class="text-center">  
									<td>${status.index + 1}</td>
									<td><a href="${pageContext.request.contextPath}/notice/article?page=1&num=${dto.num}" class="text-reset underline">${dto.subject}&nbsp;<c:if test="${dto.gap<1}"><span><img src="${pageContext.request.contextPath}/resources/images/new.png" style="width: 14px;"></span></c:if></a></td>
									<td class="communityDate">${dto.reg_date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			
			<div class="card " style="width: 49%; height: 350px;"> 
				
			</div>		
		</div>
		
		<div class="d-flex justify-content-between">
			<div class="card"  style="width: 49%">
				<div class="d-flex justify-content-between">
					<div class="text-start sales ms-3 mt-3">| 커뮤니티</div>
					<div class="me-4 mt-4"><a href="${pageContext.request.contextPath}/community/main" class="underline text-reset gooo">바로가기 ></a></div>
				</div>
				<table class="table table-hover board-list-main m-auto" style="width: 90%"> 
						<thead>  
							<tr class="text-center">
								<th style="width: 10%">#</th> 
								<th style="width: 60%">제목</th>
								<th style="width: 30%">날짜</th>  
							</tr>
						</thead> 
						<tbody>
							<c:forEach var="vo" items="${listCommunity}" varStatus="status" begin="0" end="4">
								<c:if test="${vo.open == 1}">
									<tr class="text-center">  
										<td class="categoryName">[${vo.categoryName}]</td>
										<c:choose>
											<c:when test="${sessionScope.employee.empNo==dto.empNo || sessionScope.employee.depNo == 1}">
													<td class="text-reset"> <a href="${pageContext.request.contextPath}/community/article?page=1&num=${vo.num}" class="underline communitySubject text-reset">${vo.subject}</a></td> 
													<td class="communityDate">${vo.reg_date}</td>	
											</c:when> 
											<c:otherwise>
												<td> 비공개 게시글입니다.&nbsp;<span class="lockIcon"><i class="fa-solid fa-lock"></i></span></td> 
												<td class="communityDate">${vo.reg_date}</td>
											</c:otherwise>
										</c:choose> 
									</tr>
								</c:if>
								<c:if test="${vo.open == 0}">
									<tr class="text-center">   
										<td class="categoryName">[${vo.categoryName}]</td>
										<td class="text-reset"> <a href="${pageContext.request.contextPath}/community/article?page=1&num=${vo.num}" class="underline communitySubject text-reset">${vo.subject}</a></td> 
										<td class="communityDate">${vo.reg_date}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
				</table>
			</div>
		
		<div class="card pb-3" style="width: 49%; height: 350px;">
			<div class="text-start sales ms-3 mt-3">| 진행중인 결재</div>
					<c:choose >
			<c:when test="${not empty myApprovalList}"> 
				<table class="table text-center table-hover m-auto board-list-main" style="width: 90%">
					<thead>
	        			<tr>
	        				<th>#</th>
	        				<th style="width: 45%">제목</th>
	        				<th style="width: 15%">부서 </th> 
	        				<th style="width: 10%">직급</th>
	        				<th style="width: 10%">기안자</th>
	        				<th style="width: 15%">상태</th>
	        			</tr>
        			</thead>
        			<tbody class="sendList">
        			<c:forEach items="${myApprovalList}" var="ap" varStatus="status">
        				<tr>
        					<th>${status.count}</th>
        					<td class="title">${ap.title}</td>
        					<td class="dep">${ap.depName}</td>
        					<td class="rank">${ap.rankName}</td>
        					<td class="name">${ap.name}</td>
        					<td>
        					<c:choose>
        						<c:when test="${ap.state == 0 }">기안</c:when>
        						<c:when test="${ap.state < ap.max_state && ap.state == 1 }">1차 승인</c:when>
        						<c:when test="${ap.state < ap.max_state && ap.state == 2 }">2차 승인</c:when>
        						<c:when test="${ap.state< ap.max_state }">결재 완료</c:when>
        						<c:otherwise>문의</c:otherwise>
        					</c:choose>
        					</td>
        					<td class="signNum" style="display: none">${ap.signNum}</td>
        				</tr>
        			</c:forEach>
        			</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<blockquote class="blockquote mt-5 mb-5 text-center text-muted"> 
			      <p>" ${sessionScope.employee.name}님이 작성한 결재가 없습니다 "</p>
			    </blockquote>
			</c:otherwise>
			</c:choose>
			
		</div>
	</div> 
</div>
<script type="text/javascript">
	$(".sendList").children().click(function(){
		let signNum = this.querySelector(".signNum").textContent;
		location.href="${pageContext.request.contextPath}/approval/read/"+signNum;
	});

</script>