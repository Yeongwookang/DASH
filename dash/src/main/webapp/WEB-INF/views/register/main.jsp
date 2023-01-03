<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<script type="text/javascript">




function sendOk() {
    const f = document.stationForm;
	let str;
	
    str = f.name.value.trim();
    if(!str) {
        alert("대여소명을 입력하세요. ");
        f.name.focus();
        return;
    }

    str = f.x_pos.value.trim();
    if(!str) {
        alert("경도를 입력하세요. ");
        f.x_pos.focus();
        return;
    }
    
    str = f.y_pos.value.trim();
    if(!str) {
        alert("위도를 입력하세요. ");
        f.y_pos.focus();
        return;
    }
    str = f.maxQty.value.trim();
    if(!str) {
        alert("최대 이용이 가능한 수량을 입력하세요. ");
        f.maxQty.focus();
        return;
    }
    str = f.zonName.value.trim();
    if(!str) {
        alert("지역명을 입력하세요. ");
        f.zonName.focus();
        return;
    }
    str = f.addr.value.trim();
    if(!str) {
        alert("주소를 입력하세요. ");
        f.addr.focus();
        return;
    }
   

    f.action = "${pageContext.request.contextPath}/register/write";
    f.submit();
}

function sendChOk() {
    const f = document.stationchForm;
	let str;
	
    str = f.name.value.trim();
    if(!str) {
        alert("충전소명을 입력하세요. ");
        f.name.focus();
        return;
    }

    str = f.x_pos.value.trim();
    if(!str) {
        alert("경도를 입력하세요. ");
        f.x_pos.focus();
        return;
    }
    
    str = f.y_pos.value.trim();
    if(!str) {
        alert("위도를 입력하세요. ");
        f.y_pos.focus();
        return;
    }
    str = f.leftQty.value.trim();
    if(!str) {
        alert("최대 이용가능한 수량을 입력하세요. ");
        f.leftQty.focus();
        return;
    }
   
    str = f.addr.value.trim();
    if(!str) {
        alert("주소를 입력하세요. ");
        f.addr.focus();
        return;
    }
   

    f.action = "${pageContext.request.contextPath}/register/chwrite";
    f.submit();
}



function sendkOk() {
    const f = document.stationkForm;
	let str;
	
    str = f.name.value.trim();
    if(!str) {
        alert("제품명을 입력하세요. ");
        f.name.focus();
        return;
    }

    str = f.x_pos.value.trim();
    if(!str) {
        alert("경도를 입력하세요. ");
        f.x_pos.focus();
        return;
    }
    
    str = f.y_pos.value.trim();
    if(!str) {
        alert("위도를 입력하세요. ");
        f.y_pos.focus();
        return;
    }

   

    f.action = "${pageContext.request.contextPath}/register/kwrite";
    f.submit();
}





</script>

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
				<button style="color: black;" class="nav-link" id="nav-kickboard-tab"
				    data-bs-toggle="tab" data-bs-target="#nav-kick" type="button" role="tab"
					aria-controls="nav-kickboard" aria-selected="false">킥보드 등록</button>
			</div>
		</nav>

		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
				aria-labelledby="nav-home-tab" tabindex="0">
				<div class="card">
					<div class="card-header bg-sub" style="height: 40px;"></div>
					<div class="card-body">
						<div class="body-main m-auto">
							<form name="stationForm" method="post">
								<table class="table  mt-5 text-center" style="font-size: 18px;">
									<tr>
										<td class="col-sm-2" style="background-color: #FFE1E1;"  scope="row">&nbsp;</td>
										<td style="background-color: #FFE1E1;">&nbsp;</td>
									</tr>
									
									<tr>
										<td class=" table-light col-sm-2" scope="row">대여소명</td>
										<td><input type="text" name="name" class="form-control"
											value="${dto.name}" placeholder="대여소명"></td>
									</tr>
									<tr>
										<td class="table-light col-sm-2" scope="row">경도</td>
										<td><input type="text" name="x_pos" class="form-control"
											value="${dto.x_pos}" placeholder="경도"></td>
									</tr>
									<tr>
										<td class="table-light col-sm-2" scope="row">위도</td>
										<td><input type="text" name="y_pos" class="form-control"
											value="${dto.y_pos}" placeholder="위도"></td>
									</tr>
									<tr>
										<td class=" table-light col-sm-2" scope="row">최대수량</td>
										<td><input type="text" name="maxQty" class="form-control"
											value="${dto.maxQty}" placeholder="최대수량"></td>
									</tr>
									<tr>
										<td class=" table-light col-sm-2" scope="row">지역구</td>
										<td><input type="text" name="zonName"
											class="form-control" value="${dto.zoonName}" placeholder="지역구"></td>
									</tr>
									<tr>
										<td class="table-light col-sm-2" scope="row">주소</td>
										<td><input type="text" name="addr" class="form-control"
											value="${dto.addr}" placeholder="주소"></td>
									</tr>
								</table>
								<table class="table table-borderless">
									<tr>
										<td class="text-center">
											<button type="button" class="btn text-bg-secondary"
												onclick="sendOk();">
												등록하기&nbsp;<i class="bi bi-check2"></i>
											</button>
											<button type="reset" class="btn btn-light">다시입력</button>
											<button type="button" class="btn btn-light"
												onclick="location.href='${pageContext.request.contextPath}/register/main';">
												등록취소&nbsp;<i class="bi bi-x"></i>
											</button>
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
						<div class="body-main m-auto">
							<form name="stationchForm" method="post">
								<table class="table  mt-5 text-center" style="font-size: 18px;">
									<tr>
										<td class="col-sm-2" style="background-color: #FFE1E1;"  scope="row">&nbsp;</td>
										<td style="background-color: #FFE1E1;">&nbsp;</td>
									</tr>
									
									<tr>
										<td class=" table-light col-sm-2" scope="row">충전소명</td>
										<td><input type="text" name="name" class="form-control"
											value="${dto.name}" placeholder="충전소명" ></td>
									</tr>
									<tr>
										<td class="table-light col-sm-2" scope="row">경도</td>
										<td><input type="text" name="x_pos" class="form-control"
											value="${dto.x_pos}"  placeholder="경도"></td>
									</tr>
									<tr>
										<td class="table-light col-sm-2" scope="row">위도</td>
										<td><input type="text" name="y_pos" class="form-control"
											value="${dto.y_pos}"  placeholder="위도"></td>
									</tr>
									<tr>
										<td class=" table-light col-sm-2" scope="row">충전 최대수량</td>
										<td><input type="text" name="leftQty"
											class="form-control" value="${dto.leftQty}"  placeholder="충전 최대수량"></td>
									</tr>
									<tr>
										<td class="table-light col-sm-2" scope="row">주소</td>
										<td><input type="text" name="addr" class="form-control"
											value="${dto.addr}"  placeholder="주소"></td>
									</tr>
									
								</table>
								<table class="table table-borderless">
									<tr>
										<td class="text-center">
											<button type="button" class="btn text-bg-secondary"
												onclick="sendChOk();">
												등록하기&nbsp;<i class="bi bi-check2"></i>
											</button>
											<button type="reset" class="btn btn-light">다시입력</button>
											<button type="button" class="btn btn-light"
												onclick="location.href='${pageContext.request.contextPath}/register/main';">
												등록취소&nbsp;<i class="bi bi-x"></i>
											</button>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="nav-kick" role="tabpanel"
				aria-labelledby="nav-kickboard-tab" tabindex="0">
				<div class="card">
					<div class="card-header bg-sub" style="height: 40px;"></div>
					<div class="card-body">
						<div class="body-main m-auto">
							<form name="stationkForm" method="post">
								<table class="table  mt-5 text-center" style="font-size: 18px;">
									<tr>
										<td class="col-sm-2" style="background-color: #FFE1E1;"  scope="row">&nbsp;</td>
										<td style="background-color: #FFE1E1;">&nbsp;</td>
									</tr>
									<tr>
										<td class=" table-light col-sm-2" scope="row">제품명</td>
										<td><input type="text" name="name" class="form-control"
											value="${dto.name}" placeholder="제품명"></td>
									</tr>
									<tr>
										<td class="table-light col-sm-2" scope="row">경도</td>
										<td><input type="text" name="x_pos" class="form-control"
											value="${dto.x_pos}" placeholder="경도"></td>
									</tr>
									<tr>
										<td class="table-light col-sm-2" scope="row">위도</td>
										<td><input type="text" name="y_pos" class="form-control"
											value="${dto.y_pos}" placeholder="위도"></td>
									</tr>
								</table>
								<table class="table table-borderless">
									<tr>
										<td class="text-center">
											<button type="button" class="btn text-bg-secondary"
												onclick="sendkOk();">
												등록하기&nbsp;<i class="bi bi-check2"></i>
											</button>
											<button type="reset" class="btn btn-light">다시입력</button>
											<button type="button" class="btn btn-light"
												onclick="location.href='${pageContext.request.contextPath}/register/main';">
												등록취소&nbsp;<i class="bi bi-x"></i>
											</button>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
