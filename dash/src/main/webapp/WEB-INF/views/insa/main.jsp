<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
#btn1 {
	margin: 3px;
}
</style>

<script type="text/javascript">
	function employeeOk() {
		const f = document.mainForm;
		let str = [];

		str = f.empNo.value;
		if (!/^[0-9_]+$/i.test(str)) {
			alert("사원번호를 다시 입력 하세요. ");
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

		let url = "${pageContext.request.contextPath}/insa/main";
		let obj2 = [val : str];
		const fn = function (data) {
			console.log(data);
			location.href = "${pageContext.request.contextPath}/insa/main";
		}
		ajaxFun(url, "post", obj2, "json", fn)
		
	}

	function changeEmail() {
		const f = document.main;

		let str = f.selectEmail.value;
		if (str !== "direct") {
			f.email2.value = str;
			f.email2.readOnly = true;
			f.email1.focus();
		} else {
			f.email2.value = "";
			f.email2.readOnly = false;
			f.email1.focus();
		}
	}

	function changeDepNo() {
		const f = document.main;

		let str = f.deptNoselect.value;
		if (str !== "direct") {
			f.email2.value = str;
			f.email2.readOnly = true;
			f.email1.focus();
		} else {
			f.email2.value = "";
			f.email2.readOnly = false;
			f.email1.focus();
		}
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

	function changeList() {
		let categoryNum = $("#changeCategory").val();
		let employeeShow = $("#changeShowEmployee").val();

		const f = document.searchForm;
		f.categoryNum.value = categoryNum;
		f.employeeShow.value = employeeShow;
		searchList();
	}
</script>


<div class="row text-start fs-4 ml-2">
	<div class="justify-content-start">
		<span>| 사원관리</span>
		<div class="mt-1" style="float: right; padding-right: 5%">
			<button type="button" class="btn btn1 bg-sub" onclick="employeeOk();">${mode=="main"?"등록":"수정"}</button>
			<button type="button" class="btn btn1 bg-sub">저장</button>
			<button type="button" class="btn btn1 bg-sub">삭제</button>
			<input type="hidden" name=empNoValid id="empNoValid" value="false">
		</div>
	</div>
</div>

<div class="scroll m-auto" style="height: 80%; overflow-y: scroll;">
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
									aria-label="Default select example">
									<option selected>찾기</option>
									<option value="1" ${col=="empNo"?"selected='selected'":""}>사번</option>
									<option value="2" ${col=="name"?"selected='selected'":""}>이름</option>
									<option value="3" ${col=="depName"?"selected='selected'":""}>부서</option>
									<option value="4" ${col=="rankName"?"selected='selected'":""}>직급</option>
								</select>
							</div>
							<div class="col-auto">
								<input type="text" name="kw" value="${kw}"
									class="form-control form-select-sm"> <input
									type="hidden" name="size" value="${size}"> <input
									type="hidden" name="categoryNum" value="${categoryNum}">
								<input type="hidden" name="employeeShow" value="${employeeShow}">
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
								<tr>
									<td>${dto.empNo}</td>
									<td>${dto.name}</td>
									<td>${dto.deptNo}</td>
									<td>${dto.rankNo}</td>
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
					<form name="mainForm" method="post">
						<div class="d-flex justify-content-between">
							<div class="mt-2" style="width: 70%">

								<div class="d-flex justify-content-evenly">
									<div style="width: 45%">
										<div class="row g-2 mt-2">
											<label class="col-sm-3 col-form-label" for="depNoSelect">부서
											</label>
											<div class="col-sm-6">
												<select name="depNoSelect" id="depNoSelect"
													class="form-select form-select-sm" onchange="changeDepNo()"
													aria-label=".form-select-sm-5">
													<option selected>부서</option>
													<option value="1"
														${dto.depNo=="인사" ? "selected='selected'" : ""}>경영지원</option>
													<option value="2"
														${dto.depNo=="개발" ? "selected='selected'" : ""}>운영</option>
													<option value="3"
														${dto.depNo=="영업" ? "selected='selected'" : ""}>기획</option>
													<option value="4"
														${dto.depNo=="마케팅" ? "selected='selected'" : ""}>개발</option>

												</select>
											</div>
										</div>

										<div class="row g-2 mt-2">
											<label class="col-sm-3 col-form-label" for="selectPos">직책
											</label>
											<div class="col-sm-6">
												<select name="selectRank" id="selectPos"
													class="form-select form-select-sm" onchange="changePos()"
													aria-label=".form-select-sm-5">
													<option selected>직책</option>
													<option value="1"
														${dto.posNo=="팀장" ? "selected='selected'" : ""}>팀장</option>
													<option value="2"
														${dto.posNo=="실장" ? "selected='selected'" : ""}>실장</option>
													<option value="3"
														${dto.posNo=="본부장" ? "selected='selected'" : ""}>본부장</option>
													<option value="4"
														${dto.posNo=="파트장" ? "selected='selected'" : ""}>파트장</option>
													<option value="5"
														${dto.posNo=="매니저" ? "selected='selected'" : ""}>매니저</option>

												</select>
											</div>
										</div>


									</div>

									<div style="width: 55%">

										<div class="row g-2 mt-2">
											<label class="col-sm-3 col-form-label" for="selectTeam">팀
											</label>
											<div class="col-sm-5">
												<select name="selectTeam" id="selectTeam"
													class="form-select form-select-sm" onchange="changeTeam()"
													aria-label=".form-select-sm-5">
													<option selected>팀</option>
													<option value="1"
														${dto.team=="총괄" ? "selected='selected'" : ""}>총괄</option>
												</select>
											</div>
										</div>

										<div class="row g-2 mt-2">

											<label class="col-sm-3 col-form-label" for="selectRank">직급
											</label>
											<div class="col-sm-5">
												<select name="selectRank" id="selectRank"
													class="form-select form-select-sm" onchange="changeRank()"
													aria-label=".form-select-sm-5">
													<option selected>직급</option>
													<option value="1"
														${dto.rank=="사원" ? "selected='selected'" : ""}>사원</option>
													<option value="2"
														${dto.rank=="주임" ? "selected='selected'" : ""}>주임</option>
													<option value="3"
														${dto.rank=="대리" ? "selected='selected'" : ""}>대리</option>
													<option value="4"
														${dto.rank=="과장" ? "selected='selected'" : ""}>과장</option>
													<option value="5"
														${dto.rank=="차장" ? "selected='selected'" : ""}>차장</option>
													<option value="6"
														${dto.rank=="부장" ? "selected='selected'" : ""}>부장</option>
													<option value="7"
														${dto.rank=="이사" ? "selected='selected'" : ""}>이사</option>
													<option value="8"
														${dto.rank=="상무" ? "selected='selected'" : ""}>상무</option>
													<option value="9"
														${dto.rank=="전무" ? "selected='selected'" : ""}>전무</option>
													<option value="10"
														${dto.rank=="사장" ? "selected='selected'" : ""}>사장</option>

												</select>
											</div>
										</div>
									</div>
								</div>


								<div class="row g-2 mt-3">
									<div class="col-sm-15 input-group">
										<label class="col-sm-3 col-form-label" for="empNo">사&nbsp;&nbsp;&nbsp;번</label>
										<div class="col-sm-3">
											<input type="text" name="empNo" id="empNo"
												class="form-control" placeholder="사원번호">
										</div>
										<div class="col-3 ps-1">
											<c:if test="${mode=='main'}">
												<button type="button" class="btn btn-sm"
													onclick="empNoCheck();">사번중복검사</button>
											</c:if>
										</div>
									</div>
								</div>

								<div class="row g-2 mt-2">
									<div class="col-sm-15 input-group">
										<label class="col-sm-3 col-form-label" for="name">이&nbsp;&nbsp;&nbsp;름</label>
										<div class="col-sm-3">
											<input type="text" name="name" id="name" class="form-control"
												value="${dto.name}"
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
												class="form-control" value="${dto.birth}" placeholder="생년월일">
										</div>
									</div>
								</div>
							</div>


							<div class="mt-3" style="width: 30%">

								<a><img class="img-thumbnail"
									src="${pageContext.request.contextPath}/resources/images/profile2.png"></a>
								<div>
									<input class="col-auto" type="file" id="exampleInputFile">
								</div>

							</div>

						</div>


						<div class="row g-2 mt-3">
							<div class="col-sm-15 input-group">
								<label class="col-sm-2 col-form-label" for="email">이메일</label>
								<div class="col-sm-4">
									<input type="text" name="email1" class="form-control sm-6"
										maxlength="30" value="${dto.email1}">
								</div>
								<div>
									<span class="input-group-text p-1"
										style="border: none; background: none;">@</span>
								</div>
								<div class="col-sm-4">
									<input type="text" name="email2" class="form-control sm-6"
										maxlength="30" value="${dto.email2}">
								</div>
							</div>
						</div>


						<div class="row g-2 mt-4">
							<div class="col-sm-10 input-group">
								<label class="col-sm-2 col-form-label" for="tel">연락처</label>
								<div class="col-sm-3">
									<input type="text" name="tel1" class="form-control"
										maxlength="20" value="${dto.tel1}">
								</div>
								<div>
									<span class="input-group-text p-1"
										style="border: none; background: none;">-</span>
								</div>
								<div class="col-sm-3">
									<input type="text" name="tel2" class="form-control"
										maxlength="20" value="${dto.tel2}">
								</div>
								<div>
									<span class="input-group-text p-1"
										style="border: none; background: none;">-</span>
								</div>
								<div class="col-sm-3">
									<input type="text" name="tel3" class="form-control"
										maxlength="20" value="${dto.tel3}">
								</div>
							</div>

						</div>



						<div class="row g-3 mt-2">
							<label class="col-sm-2 col-form-label" for="startDate">입사일</label>
							<div class="col-sm-4">
								<input type="date" name="startDate" id="startDate"
									class="form-control" value="${dto.startDate}"
									placeholder="입사일">
							</div>
						</div>

						<div class="row g-3 mt-2">
							<label class="col-sm-2 col-form-label" for="endDate">퇴사일</label>
							<div class="col-sm-4">
								<input type="date" name="endDate" id="endDate"
									class="form-control" value="${dto.endDate}" placeholder="퇴사일">
							</div>
						</div>

						<div class="row g-3 mt-2">
							<label class="col-sm-2 col-form-label" for="zip">우편번호</label>
							<div class="col-sm-5">
								<div class="input-group">
									<input type="text" name="zip" id="zip" class="form-control"
										placeholder="우편번호" value="${dto.zip}" readonly="readonly">
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
										placeholder="기본 주소" value="${dto.addr1}" readonly="readonly">
								</div>
								<div style="margin-top: 5px;">
									<input type="text" name="addr2" id="addr2" class="form-control"
										placeholder="상세 주소" value="${dto.addr2}">
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
</script>