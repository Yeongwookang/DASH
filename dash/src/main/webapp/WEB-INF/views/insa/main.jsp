<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.thumbnail-viewer {
	cursor: pointer;
	border: 1px solid #ccc;
	width: 180px; 
	height: 210px;
	background-image: url("${pageContext.request.contextPath}/resources/images/profile2.png");
	position: relative;
	z-index: 9999;
	background-repeat : no-repeat;
	background-size : cover;
}

#btn1 {
	margin: 3px;
}
</style>

<script type="text/javascript">
	function employeeOk() {
		const f = document.mainSubmit;
		let str = [];

		str = f.empNo.value;
		if (!/^[0-9_]+$/i.test(str)) {
			alert("사원번호를 다시 입력 하세요.");
			f.empNo.focus();
			return;
		}
		
		let mode = "${mode}";
		if (mode === "employee" && f.empNoValid.value === "false") {
			str = "사원번호 중복 검사가 실행되지 않았습니다.";
			$("#empNo").parent().find(".help-block").html(str);
			f.empNo.focus();
			return;
		}
	
		str = f.pwd.value;
		if (!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) {
			alert("패스워드를 다시 입력 하세요. ");
			f.pwd.focus();
			return;
		}

		
		if (str !== f.pwd2.value) {
			alert("패스워드가 일치하지 않습니다. ");
			f.pwd.focus();
			return;
		}

		str = f.name.value;
		if (!/^[가-힣]{2,5}$/.test(str)) {
			alert("이름을 다시 입력하세요. ");
			f.name.focus();
			return;
		}

		str = f.birth.value;
		if (!str) {
			alert("생년월일를 입력하세요. ");
			f.birth.focus();
			return;
		}

		str = f.tel1.value;
		if (!str) {
			alert("전화번호를 입력하세요. ");
			f.tel1.focus();
			return;
		}

		str = f.tel2.value;
		if (!/^\d{3,4}$/.test(str)) {
			alert("숫자만 가능합니다. ");
			f.tel2.focus();
			return;
		}

		str = f.tel3.value;
		if (!/^\d{4}$/.test(str)) {
			alert("숫자만 가능합니다. ");
			f.tel3.focus();
			return;
		}

		str = f.email1.value.trim();
		if (!str) {
			alert("이메일을 입력하세요. ");
			f.email1.focus();
			return;
		}

		str = f.email2.value.trim();
		if (!str) {
			alert("이메일을 입력하세요. ");
			f.email2.focus();
			return;
		}

		f.action = "${pageContext.request.contextPath}/insa/${mode}";
		f.submit();

	}

	function empNoCheck() {
		// 아이디 중복 검사
		let empNo = $("#empNo").val();

		if (!/^[[0-9_]+$/i.test(empNo)) {
			let str = "아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.";
			$("#empNo").focus();
			$("#empNo").parent().find(".help-block").html(str);
			return;
		}

		let url = "${pageContext.request.contextPath}/main/empNoCheck";
		let query = "empNo=" + empNo;
		$.ajax({
			type : "POST",
			url : url,
			data : query,
			dataType : "json",
			success : function(data) {
				let passed = data.passed;
				alert(passed);
				if (passed === "true") {
					let str = "<span style='color:blue; font-weight: bold;'>"
							+ empNo + "</span> 해당 사원번호는 사용가능 합니다.";
					$(".empNo-box").find(".help-block").html(str);
					$("#empNoValid").val("true");
				} else {
					let str = "<span style='color:red; font-weight: bold;'>"
							+ empNo + "</span> 사원번호를 사용할 수 없습니다.";
					$(".empNo-box").find(".help-block").html(str);
					$("#empNo").val("");
					$("#empNoValid").val("false");
					$("#empNo").focus();
				}
			}
		});
	}

	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
</script>



<div class="card mt-5 mb-5 p-4 m-auto" style="width:70%">
	<div class="d-flex justify-content-between">
		<div class="text-start fs-4 ml-2 mb-4"><span>| 사원관리</span></div>
		<div class="pe-3">
			<button type="button" class="btn btn1 bg-sub" onclick="employeeOk();">${mode=="update"?"저장":"등록"}</button>
			<button type="button" class="btn btn1 bg-sub">삭제</button>
			<input type="hidden" name=empNoValid id="empNoValid" value="false">
		</div>
	</div>
	<div class="d-flex justify-content-evenly">
		<div class="mt-2 p-2" style="width: 38%">
			<div class="card">
				<div class="card-header bg-sub text-start">전체 사원 목록</div>
				<div class="card-body">
					<div class="row mt-1">
						<form class="row" name="searchForm"
							action="${pageContext.request.contextPath}/insa/main"
							method="post">
							<div class="col-auto">
								<select class="form-select form-select-sm"
									aria-label="Default select example" name="col">
									<option selected value="all">찾기</option>
									<option value="empNo" ${col=="empNo"?"selected='selected'":""}>사번</option>
									<option value="name" ${col=="name"?"selected='selected'":""}>이름</option>
									<option value="depName"
										${col=="depName"?"selected='selected'":""}>부서</option>
									<option value="rankName"
										${col=="rankName"?"selected='selected'":""}>직급</option>
								</select>
							</div>
							<div class="col-auto">
								<input type="text" name="kwd" value="${kwd}"
									class="form-control form-select-sm">
							</div>
							<div class="col-auto">
								<button type="submit" class="btn bg-sub btn-sm"
									onclick="searchList()">
									<i class="bi bi-search"></i>검색
								</button>
							</div>

							<div class="col-auto mt-3">
								<input type="checkbox" value="" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 퇴사자 제외
								</label>
							</div>
						</form>

					</div>

					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">사원번호</th>
								<th scope="col">이름</th>
								<th scope="col">부서</th>
								<th scope="col">직급</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr style="cursor: pointer;"
									onclick="location.href='${pageContext.request.contextPath}/insa/main?empNo=${dto.empNo}';">
									<td>${dto.empNo}</td>
									<td>${dto.name}</td>
									<td>${dto.depName}</td>
									<td>${dto.rankName}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</div>

		<div class="mt-2 p-2" style="width: 58%">

			<div class="card">
				<div class="card-header bg-sub text-start">기본정보</div>
				<div class="card-body">
					<form name="mainSubmit" method="post" enctype="multipart/form-data">
						<div class="d-flex justify-content-between">
							<div class="mt-2" style="width: 67%">
								<div class="d-flex justify-content-evenly">
									<div style="width: 45%">
										<div class="row g-2 mt-2">
											<label class="col-sm-3 col-form-label" for="depNo">부서
											</label>
											<div class="col-sm-6">
												<select name="depNo" id="depNo"
													class="form-select form-select-sm"
													aria-label=".form-select-sm-5">
													<option selected>부서</option>
													<option value="1"
														${emp.depNo=="1" ? "selected='selected'" : ""}>경영지원</option>
													<option value="2"
														${emp.depNo=="2" ? "selected='selected'" : ""}>운영</option>
													<option value="3"
														${emp.depNo=="3" ? "selected='selected'" : ""}>기획</option>
													<option value="4"
														${emp.depNo=="4" ? "selected='selected'" : ""}>개발</option>

												</select>
											</div>
										</div>

										<div class="row g-2 mt-2">
											<label class="col-sm-3 col-form-label" for="posNo">직책
											</label>
											<div class="col-sm-6">
												<select name="posNo" id="posNo"
													class="form-select form-select-sm"
													aria-label=".form-select-sm-5">
													<option selected>직책</option>
													<option value="1"
														${emp.posNo=="1" ? "selected='selected'" : ""}>팀장</option>
													<option value="2"
														${emp.posNo=="2" ? "selected='selected'" : ""}>실장</option>
													<option value="3"
														${emp.posNo=="3" ? "selected='selected'" : ""}>본부장</option>
													<option value="4"
														${emp.posNo=="4" ? "selected='selected'" : ""}>파트장</option>
													<option value="5"
														${emp.posNo=="5" ? "selected='selected'" : ""}>매니저</option>

												</select>
											</div>
										</div>


									</div>

									<div style="width: 55%">

										<div class="row g-2 mt-2">
											<label class="col-sm-3 col-form-label" for="teamNo">팀
											</label>
											<div class="col-sm-5">
												<select name="teamNo" id="teamNo"
													class="form-select form-select-sm"
													aria-label=".form-select-sm-5">
													<option selected>팀</option>
													<option value="1"
														${emp.teamNo=="1" ? "selected='selected'" : ""}>총괄</option>
												</select>
											</div>
										</div>

										<div class="row g-2 mt-2">

											<label class="col-sm-3 col-form-label" for="rankNo">직급
											</label>
											<div class="col-sm-5">
												<select name="rankNo" id="rankNo"
													class="form-select form-select-sm"
													aria-label=".form-select-sm-5">
													<option selected>직급</option>
													<option value="1"
														${emp.rankNo=="1" ? "selected='selected'" : ""}>사원</option>
													<option value="2"
														${emp.rankNo=="2" ? "selected='selected'" : ""}>주임</option>
													<option value="3"
														${emp.rankNo=="3" ? "selected='selected'" : ""}>대리</option>
													<option value="4"
														${emp.rankNo=="4" ? "selected='selected'" : ""}>과장</option>
													<option value="5"
														${emp.rankNo=="5" ? "selected='selected'" : ""}>차장</option>
													<option value="6"
														${emp.rankNo=="6" ? "selected='selected'" : ""}>부장</option>
													<option value="7"
														${emp.rankNo=="7" ? "selected='selected'" : ""}>이사</option>
													<option value="8"
														${emp.rankNo=="8" ? "selected='selected'" : ""}>상무</option>
													<option value="9"
														${emp.rankNo=="9" ? "selected='selected'" : ""}>전무</option>
													<option value="10"
														${emp.rankNo=="10" ? "selected='selected'" : ""}>사장</option>

												</select>
											</div>
										</div>
									</div>
								</div>


								<div class="row g-2 mt-3">
									<div class="col-sm-15 input-group">
										<label class="col-sm-3 col-form-label" for="empNo">사&nbsp;&nbsp;&nbsp;번</label>
										<div class="col-sm-5">
											<input type="text" name="empNo" id="empNo"
												value="${emp.empNo}" class="form-control" placeholder="사원번호">
										</div>
										<div class="col-3 ps-1">
											<c:if test="${mode=='main'}">
												<button type="button" class="btn btn-sm"
													onclick="empNoCheck();">중복검사</button>
											</c:if>
										</div>
									</div>
								</div>

								<div class="row g-2 mt-2">
									<div class="col-sm-15 input-group">
										<label class="col-sm-3 col-form-label" for="name">이&nbsp;&nbsp;&nbsp;름</label>
										<div class="col-sm-5">
											<input type="text" name="name" id="name" class="form-control"
												value="${emp.name}"
												${mode=="update" ? "readonly='readonly' ":""}
												placeholder="이름">
										</div>
									</div>
								</div>

								<div class="row g-2 mt-2">
									<div class="col-sm-12 input-group">
										<label class="col-sm-3 col-form-label" for="birth">생년월일</label>
										<div class="col-sm-5">
											<input type="date" name="birth" id="birth"
												class="form-control" value="${emp.birth}" placeholder="생년월일">
										</div>
									</div>
								</div>
							</div>


							<div class="mt-3" style="width: 33%">
								
								<div class="table-form">
									<div class="thumbnail-viewer img-thumbnail"></div>
									<label for="exampleInputFile"></label> 
									<input type="file" name="selectFile" accept="image/*" id="thumbnail" class="form-control" style="display: none;">
								</div>
							</div>

						</div>


						<div class="row g-2 mt-3">
							<div class="col-sm-15 input-group">
								<label class="col-sm-2 col-form-label" for="email">이메일</label>
								<div class="col-sm-4">
									<input type="text" name="email1" class="form-control sm-6"
										maxlength="30" value="${emp.email1}">
								</div>
								<div>
									<span class="input-group-text p-1"
										style="border: none; background: none;">@</span>
								</div>
								<div class="col-sm-4">
									<input type="text" name="email2" class="form-control sm-6"
										maxlength="30" value="${emp.email2}">
								</div>
							</div>
						</div>


						<div class="row g-2 mt-4">
							<div class="col-sm-10 input-group">
								<label class="col-sm-2 col-form-label" for="tel">연락처</label>
								<div class="col-sm-3">
									<input type="text" name="tel1" class="form-control"
										maxlength="20" value="${emp.tel1}">
								</div>
								<div>
									<span class="input-group-text p-1"
										style="border: none; background: none;">-</span>
								</div>
								<div class="col-sm-3">
									<input type="text" name="tel2" class="form-control"
										maxlength="20" value="${emp.tel2}">
								</div>
								<div>
									<span class="input-group-text p-1"
										style="border: none; background: none;">-</span>
								</div>
								<div class="col-sm-3">
									<input type="text" name="tel3" class="form-control"
										maxlength="20" value="${emp.tel3}">
								</div>
							</div>

						</div>


						<div class="row g-3 mt-2">
							<label class="col-sm-2 col-form-label" for="startDate">입사일</label>
							<div class="col-sm-4">
								<input type="date" name="startDate" id="startDate"
									class="form-control" value="${emp.startDate}" placeholder="입사일">
							</div>
						</div>

						<div class="row g-3 mt-2">
							<label class="col-sm-2 col-form-label" for="endDate">퇴사일</label>
							<div class="col-sm-4">
								<input type="date" name="endDate" id="endDate"
									class="form-control" value="${emp.endDate}" placeholder="퇴사일">
							</div>
						</div>

						<div class="row g-3 mt-2">
							<label class="col-sm-2 col-form-label" for="zip">우편번호</label>
							<div class="col-sm-5">
								<div class="input-group">
									<input type="text" name="zip" id="zip" class="form-control"
										placeholder="우편번호" value="${emp.zip}" readonly="readonly">
									<button class="btn btn-light" type="button"
										style="margin-left: 3px;" onclick="daumPostcode();">우편번호
										검색</button>
								</div>
							</div>
						</div>

						<div class="row g-3 mt-2">
							<label class="col-sm-2 col-form-label" for="addr1">주소</label>
							<div class="col-sm-10">
								<div>
									<input type="text" name="addr1" id="addr1" class="form-control"
										placeholder="기본 주소" value="${emp.addr1}" readonly="readonly">
								</div>
								<div style="margin-top: 5px;">
									<input type="text" name="addr2" id="addr2" class="form-control"
										placeholder="상세 주소" value="${emp.addr2}">
								</div>
							</div>
						</div>

						<div class="row mt-4">
							<label class="col-sm-2 col-form-label" for="pwd">비밀번호</label>
							<div class="col-sm-5">
								<input type="password" name="pwd" id="pwd" class="form-control"
									autocomplete="off" placeholder="비밀번호">
							</div>
						</div>

						<div class="row mt-2">
							<label class="col-sm-2 col-form-label" for="pwd2">비밀번호 확인</label>
							<div class="col-sm-5">
								<input type="password" name="pwd2" id="pwd2"
									class="form-control" autocomplete="off" placeholder="비밀번호 확인">
								<small class="form-control-plaintext">비밀번호를 한번 더 입력해주세요.</small>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function daumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullAddr = '';
						var extraAddr = '';

						if (data.userSelectedType === 'R') {
							fullAddr = data.roadAddress;

						} else {
							fullAddr = data.jibunAddress;
						}

						if (data.userSelectedType === 'R') {

							if (data.bname !== '') {
								extraAddr += data.bname;
							}

							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}

							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						document.getElementById('zip').value = data.zonecode;
						document.getElementById('addr1').value = fullAddr;

						document.getElementById('addr2').focus();
					}
				}).open();
	}

	$(function () {
		var img = "${dto.thumbnail}";
		if( img ) {
			img = "${pageContext.request.contextPath}/uploads/insa/"+img;
			$(".table-form .thumbnail-viewer").empty();
			$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
		}
		
			$(".table-form .thumbnail-viewer").click(function () {
				$("form[name=mainSubmit] input[name=selectFile]").trigger("click");
		});
			$("form[name=mainSubmit] input[name=selectFile]").change(function () {
				let file = this.files[0];
				if(! file){ //취소버튼눌렀을때 
					$(".table-form .thumbnail-viewer").empty();
					
			        if( img ){
			        	img = "${pageContext.request.contextPath}/uploads/insa/"+img;
			        } else {
			        	img = "${pageContext.request.contextPath}/resources/images/profile2.png";
			        }
			        $(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
			        
					return false;
				}
				
				if( ! file.type.match("image.*") ){
					this.focus();
					return false;
				}
				
				var reader = new FileReader();
				reader.onload = function (e) { // 파일의 내용을 다 읽었으면 
					$(".table-form .thumbnail-viewer").empty();
					$(".table-form .thumbnail-viewer").css("background-image", "url("+e.target.result+")");
					
				};
				reader.readAsDataURL ( file );
				
			});
	});
	
	
	$(function() {
		let img = "${dto.thumbnail}";
		if( img ) { // 수정인 경우
			img = "${pageContext.request.contextPath}/uploads/insa/" + img;
			$("table-form .thumbnail-viewer").empty();
			$("table-form .thumbnail-viewer").css("background-image", "url("+img+")");
		}
		
		$("table-form .img-viewer").click(function(){
			$("form[name=mainSubmit] input[name=selectFile]").trigger("click"); 
		});
		
		$("form[name=table-form] input[name=selectFile]").change(function(){
			let file=this.files[0];
			if(! file) {
				$("table-form .thumbnail-viewer").empty();
				if( img ) {
					img = "${pageContext.request.contextPath}/uploads/insa/" + img;
					$("table-form .thumbnail-viewer").css("background-image", "url("+img+")");
				} else {
					img = "${pageContext.request.contextPath}/resources/images/profile2.png";
					$("table-form .thumbnail-viewer").css("background-image", "url("+img+")");
				}
				return false;
			}
			
			if(! file.type.match("image.*")) {
				this.focus();
				return false;
			}
			
			let reader = new FileReader();
			reader.onload = function(e) {
				$("table-form .thumbnail-viewer").empty();
				$("table-form .thumbnail-viewer").css("background-image", "url("+e.target.result+")");
			}
			reader.readAsDataURL(file);
		});
	});

</script>