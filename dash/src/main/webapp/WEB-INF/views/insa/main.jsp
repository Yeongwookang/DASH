<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.card {
	display: flex;
	justify-content: flex-end;
}
</style>

<div class="text-start fs-4 mb-4">
	<span>| 인사관리</span>
	<div>
		<div class="mt-2">
			<div class="card">
				<div class="card-header text-start">사원리스트</div>
				<div class="card-body">
					<blockquote class="blockquote mb-0">
						<p>전체 사원 리스트가 쫙 나옴</p>
					</blockquote>
				</div>
			</div>

			<div class="card">
				<div class="card-header text-start">기본정보</div>
				<div class="card-body">
					<blockquote class="blockquote mb-0">
						<form name="memberForm" method="post">
							<div class="row mb-3">
								<label class="col-sm-2 col-form-label" for="empNo">사원번호</label>
								<div class="col-sm-10">
									<input type="text" name="empNo" id="empNo" class="form-control"
										value="${dto.empNo}"
										${mode=="update" ? "readonly='readonly' ":""}
										placeholder="사원번호">
								</div>
							</div>


							<div class="row mb-3">
								<label class="col-sm-2 col-form-label" for="name">이름</label>
								<div class="col-sm-10">
									<input type="text" name="name" id="name" class="form-control"
										value="${dto.name}"
										${mode=="update" ? "readonly='readonly' ":""} placeholder="이름">
								</div>
							</div>

							<div class="row mb-3">
								<label class="col-sm-2 col-form-label" for="birth">생년월일</label>
								<div class="col-sm-10">
									<input type="date" name="birth" id="birth" class="form-control"
										value="${dto.birth}" placeholder="생년월일"> <small
										class="form-control-plaintext">생년월일은 2000-01-01 형식으로
										입력 합니다.</small>
								</div>
							</div>

							<div class="row mb-3">
								<label class="col-sm-2 col-form-label" for="selectEmail">이메일</label>
								<div class="col-sm-10 row">
									<div class="col-3 pe-0">
										<select name="selectEmail" id="selectEmail"
											class="form-select" onchange="changeEmail();">
											<option value="">선 택</option>
											<option value="naver.com"
												${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버
												메일</option>
											<option value="gmail.com"
												${dto.email2=="gmail.com" ? "selected='selected'" : ""}>지
												메일</option>
											<option value="hanmail.net"
												${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>한
												메일</option>
											<option value="hotmail.com"
												${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>핫
												메일</option>
											<option value="direct">직접입력</option>
										</select>
									</div>

									<div class="col input-group">
										<input type="text" name="email1" class="form-control"
											maxlength="30" value="${dto.email1}"> <span
											class="input-group-text p-1"
											style="border: none; background: none;">@</span> <input
											type="text" name="email2" class="form-control" maxlength="30"
											value="${dto.email2}" readonly="readonly">
									</div>

								</div>
							</div>

							<div class="row mb-3">
								<label class="col-sm-2 col-form-label" for="tel1">전화번호</label>
								<div class="col-sm-10 row">
									<div class="col-sm-3 pe-1">
										<input type="text" name="tel1" id="tel1" class="form-control"
											value="${dto.tel1}" maxlength="3">
									</div>
									<div class="col-sm-1 px-1" style="width: 2%;">
										<p class="form-control-plaintext text-center">-</p>
									</div>
									<div class="col-sm-3 px-1">
										<input type="text" name="tel2" id="tel2" class="form-control"
											value="${dto.tel2}" maxlength="4">
									</div>
									<div class="col-sm-1 px-1" style="width: 2%;">
										<p class="form-control-plaintext text-center">-</p>
									</div>
									<div class="col-sm-3 ps-1">
										<input type="text" name="tel3" id="tel3" class="form-control"
											value="${dto.tel3}" maxlength="4">
									</div>
								</div>
							</div>

							<div class="row mb-3">
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

							<div class="row mb-3">
								<label class="col-sm-2 col-form-label" for="addr1">주소</label>
								<div class="col-sm-10">
									<div>
										<input type="text" name="addr1" id="addr1"
											class="form-control" placeholder="기본 주소" value="${dto.addr1}"
											readonly="readonly">
									</div>
									<div style="margin-top: 5px;">
										<input type="text" name="addr2" id="addr2"
											class="form-control" placeholder="상세 주소" value="${dto.addr2}">
									</div>
								</div>
							</div>
						</form>


					</blockquote>
				</div>
			</div>
		</div>
	</div>
</div>


