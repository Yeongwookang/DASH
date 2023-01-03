<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="scroll m-auto"
	style="height: 85%; width: 90%; overflow-y: scroll;">
	<div class="text-start fs-4 mb-4">
		<span>| 신규 등록</span>

		<nav class="mt-4" style="font-size: 17px;">
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<button style="color: black;" class="nav-link" id="nav-home-tab"
					data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
					role="tab" aria-controls="nav-home" aria-selected="true">
					대여소 등록</button>
				<button style="color: black;" class="nav-link" id="nav-profile-tab"
					data-bs-toggle="tab" data-bs-target="#nav-profile" type="button"
					role="tab" aria-controls="nav-profile" aria-selected="false">
					충전소 등록</button>
				<button style="color: black;" class="nav-link"
					id="nav-kickboard-tab" data-bs-toggle="tab"
					data-bs-target="#nav-kick" type="button" role="tab"
					aria-controls="nav-kickboard" aria-selected="false">킥보드
					등록</button>
			</div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
				aria-labelledby="nav-home-tab" tabindex="0">
				<div class="card text-center container row " style="float: none; margin: 100 auto;">
					<div class="card-header bg-sub" style="height: 40px;"></div>
					<div class="card-body">
					
					
					<div class="body-main">
		
			<form name="boardForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 write-form">
					<tr>
						<td class="table-light col-sm-2" scope="row">제 목</td>
						<td>
							<input type="text" name="subject" class="form-control" value="${dto.subject}">
						</td>
					</tr>
        
					<tr>
						<td class="table-light col-sm-2" scope="row">작성자명</td>
 						<td>
							<p class="form-control-plaintext">${sessionScope.member.userName}</p>
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2" scope="row">내 용</td>
						<td>
							<textarea name="content" id="content" class="form-control">${dto.content}</textarea>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
						<td> 
							<input type="file" name="selectFile" class="form-control">
						</td>
					</tr>
					
					<c:if test="${mode=='update'}">
						<tr>
							<td class="table-light col-sm-2" scope="row">첨부된파일</td>
							<td> 
								<p class="form-control-plaintext">
									<c:if test="${not empty dto.saveFilename}">
										<a href="javascript:deleteFile('${dto.num}');"><i class="bi bi-trash"></i></a>
										${dto.originalFilename}
									</c:if>
									&nbsp;
								</p>
							</td>
						</tr>
					</c:if>
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/bbs/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
								<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>

		
					</div>
				</div>



			</div>
			<div class="tab-pane fade" id="nav-profile" role="tabpanel"
				aria-labelledby="nav-profile-tab" tabindex="0">
						<div class="card">
					<div class="card-header bg-sub" style="height: 40px;"></div>
					<div class="card-body">
					
		
		
		
		
		
		
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
				
				</div>
				
		<div class="tab-pane fade" id="nav-kick" role="tabpanel"
				aria-labelledby="nav-kickboard-tab" tabindex="0">
						<div class="card">
					<div class="card-header bg-sub" style="height: 40px;" ></div>
					<div class="card-body">
					
		
		
		
		
		
		
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
				</div>		
			</div>
		</div>
	</div>


