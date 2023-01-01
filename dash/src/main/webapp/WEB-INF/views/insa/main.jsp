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
	function memberOk() {
		const f = document.main;
		let str;

		str = f.empNo.value;
		if (!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) {
			alert("아이디를 다시 입력 하세요. ");
			f.userId.focus();
			return;
		}

		let mode = "${mode}";
		if (mode === "member" && f.empNoValid.value === "false") {
			str = "아이디 중복 검사가 실행되지 않았습니다.";
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

		f.action = "${pageContext.request.contextPath}/main/${mode}";
		f.submit();
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

		let str = f.selectDept.value;
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
		let userId = $("#empNo").val();

		if (!/^[a-z][a-z0-9_]{4,9}$/i.test(empNo)) {
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
</script>


<div class="row text-start fs-4 ml-2">
	<div class="justify-content-start">
		<span>| 사원관리</span>
		<div class="mt-1" style="float: right; padding-right: 5%">
			<button type="button" class="btn btn1 bg-sub">${mode=="member"?"등록":"수정"}</button>
			<button type="button" class="btn btn1 bg-sub">저장</button>
			<button type="button" class="btn btn1 bg-sub">삭제</button>
		</div>
	</div>
</div>

<div class="scroll m-auto" style="height: 80%; overflow-y: scroll;">
	<div class="d-flex justify-content-evenly">
		<div class="mt-2 p-2" style="width: 38%">
			<div class="card">
				<div class="card-header bg-sub text-start">전체 사원 목록</div>
				<div class="card-body">
					<div class="row g-3">
						<div class="col-auto">
							<select class="form-select" aria-label="Default select example">
								<option selected>찾기</option>
								<option value="1">사번</option>
								<option value="2">이름</option>
								<option value="3">부서</option>
								<option value="4">직급</option>
							</select>
						</div>
						<div class="col-auto">
							<input type="search" class="form-control" id="search">
						</div>
						<div class="col-auto">
							<button type="submit" class="btn bg-sub">
								<i class="bi bi-search"></i>검색
							</button>
						</div>

						<div class="col-auto mt-3">
							<input type="checkbox" value="" id="flexCheckDefault"> <label
								class="form-check-label" for="flexCheckDefault"> 퇴사자 제외
							</label>
						</div>
					</div>

					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">구분</th>
								<th scope="col">사원번호</th>
								<th scope="col">이름</th>
								<th scope="col">부서</th>
								<th scope="col">직급</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>980618</td>
								<td>조똥개</td>
								<td>영업</td>
								<td>사원</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>920425</td>
								<td>최시원</td>
								<td>인사</td>
								<td>과장</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>940214</td>
								<td>이다희</td>
								<td>마케팅</td>
								<td>차장</td>
							</tr>
							<tr>
								<th scope="row">4</th>
								<td>960321</td>
								<td>이개똥</td>
								<td>개발</td>
								<td>대리</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="mt-2 p-2" style="width: 58%">

			<div class="card">
				<div class="card-header bg-sub text-start">기본정보</div>
				<div class="card-body">
					<div class="d-flex justify-content-between">
						<div class="mt-2" style="width: 70%">

							<div class="d-flex justify-content-evenly">
								<div style="width: 45%">
									<div class="row g-2 mt-2">
										<label class="col-sm-3 col-form-label" for="selectDept">부서
										</label>
										<div class="col-sm-6">
											<select name="selectDept" id="selectDept"
												class="form-select form-select-sm" onchange="changeDepNo()"
												aria-label=".form-select-sm-5">
												<option selected>부서</option>
												<option value="1"
													${dto.department=="인사" ? "selected='selected'" : ""}>경영지원</option>
												<option value="2"
													${dto.department=="개발" ? "selected='selected'" : ""}>운영</option>
												<option value="3"
													${dto.department=="영업" ? "selected='selected'" : ""}>기획</option>
												<option value="4"
													${dto.department=="마케팅" ? "selected='selected'" : ""}>개발</option>

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
													${dto.pos=="팀장" ? "selected='selected'" : ""}>팀장</option>
												<option value="2"
													${dto.pos=="실장" ? "selected='selected'" : ""}>실장</option>
												<option value="3"
													${dto.pos=="본부장" ? "selected='selected'" : ""}>본부장</option>
												<option value="4"
													${dto.pos=="파트장" ? "selected='selected'" : ""}>파트장</option>
												<option value="5"
													${dto.pos=="매니저" ? "selected='selected'" : ""}>매니저</option>

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
									<label class="col-sm-2 col-form-label" for="empNo">사번</label>
									<div class="col-sm-3">
										<input type="text" name="empNo" id="empNo"
											class="form-control" placeholder="사원번호">
									</div>
									<div class="col-3 ps-1">
										<c:if test="${mode=='member'}">
											<button type="button" class="btn btn-sm"
												onclick="userIdCheck();">사번중복검사</button>
										</c:if>
									</div>
								</div>
							</div>

							<div class="row g-2 mt-2">
								<div class="col-sm-15 input-group">
									<label class="col-sm-2 col-form-label" for="name">이름</label>
									<div class="col-sm-3">
										<input type="text" name="name" id="name" class="form-control"
											value="${dto.userName}"
											${mode=="update" ? "readonly='readonly' ":""}
											placeholder="이름">
									</div>
								</div>
							</div>

							<div class="row g-2 mt-2">
								<div class="col-sm-15 input-group">
									<label class="col-sm-2 col-form-label" for="birth">생년월일</label>
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
								<label>dash.com</label>
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
								class="form-control" value="${dto.startDate}" placeholder="생년월일">
						</div>
					</div>

					<div class="row g-3 mt-2">
						<label class="col-sm-2 col-form-label" for="endDate">퇴사일</label>
						<div class="col-sm-4">
							<input type="date" name="endDate" id="endDate"
								class="form-control" value="${dto.endDate}" placeholder="퇴사일">
						</div>

						<div class="col-sm-1 mt-4">
							<input type="checkbox" value="" id="flexCheckDefault"> <label
								class="form-check-label" for="flexCheckDefault"> 퇴사 </label>
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
							<input type="password" name="pwd2" id="pwd2" class="form-control"
								autocomplete="off" placeholder="비밀번호 확인"> <small
								class="form-control-plaintext">비밀번호를 한번 더 입력해주세요.</small>
						</div>
					</div>
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