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

<div class="row text-start fs-4 ml-2">
	<div class="justify-content-start">
		<span>| 사원관리</span>
		<div class="mt-1" style="float: right; padding-right: 5%">
			<button type="button" class="btn btn1 bg-sub">등록</button>
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

		<div class="mt-2 p-2" style="width: 56%">
			<div class="card">
				<div class="card-header bg-sub text-start">기본정보</div>
				<div class="card-body">
					<div class="d-flex justify-content-between">
						<div class="mt-2" style="width: 70%">
							<div class="row g-2">
								<label class="col-sm-3 col-form-label" for="dept">부서</label>
								<div class="col-sm-5">
									<select class="form-select form-select-sm"
										aria-label=".form-select-sm-5">
										<option selected>부서</option>
										<option value="1">인사</option>
										<option value="2">개발</option>
										<option value="3">영업</option>
										<option value="4">마케팅</option>
										<option value="5">고객지원</option>
										<option value="6">연구개발</option>
									</select>
								</div>
							</div>

							<div class="row g-2 mt-2">

								<label class="col-sm-3 col-form-label" for="">직급</label>
								<div class="col-sm-5">
									<select class="form-select form-select-sm"
										aria-label=".form-select-sm-5">
										<option selected>직급</option>
										<option value="1">사원</option>
										<option value="2">주임</option>
										<option value="3">대리</option>
										<option value="4">과장</option>
										<option value="5">차장</option>
										<option value="6">부장</option>
									</select>
								</div>
							</div>

							<div class="row g-2 mt-2">
								<label class="col-sm-3 col-form-label" for="num">사번</label>
								<div class="col-sm-5">
									<input type="text" name="num" id="num" class="form-control"
										placeholder="사번">
								</div>
							</div>

							<div class="row g-2 mt-2">
								<label class="col-sm-3 col-form-label" for="name">이름</label>
								<div class="col-sm-5">
									<input type="text" name="name" id="name" class="form-control"
										placeholder="이름">
								</div>
							</div>

							<div class="row g-2 mt-2">
								<label class="col-sm-3 col-form-label" for="birth">생년월일</label>
								<div class="col-sm-5">
									<input type="date" name="birth" id="birth" class="form-control"
										value="${dto.birth}" placeholder="생년월일">
								</div>
							</div>
						</div>

						<div class="mt-3" style="width: 40%">
							<div class="d-flex justify-content-center">
								<a><img class="img-thumbnail"
									src="${pageContext.request.contextPath}/resources/images/profile2.png"></a>
							</div>
							<div>
								<input class="col-auto" type="file" id="exampleInputFile">
							</div>
						</div>

					</div>

					<div class="row g-2 mt-4">
						<label class="col-sm-2 col-form-label" for="email">이메일</label>
						<div class="col input-group">
							<input type="text" name="email1" class="form-control"
								maxlength="30" value="${dto.email1}"> <span
								class="input-group-text p-1"
								style="border: none; background: none;">@</span> <input
								type="text" name="email2" class="form-control" maxlength="30"
								value="${dto.email2}" readonly="readonly">
						</div>

					</div>

					<div class="row g-2 mt-4">
						<label class="col-sm-2 col-form-label" for="tel">연락처</label>
						<div class="col-sm-10 input-group">
							<div class="col-sm-3">
								<input type="text" name="tel1" class="form-control"
									maxlength="30" value="${dto.tel1}">
							</div>
							<div>
								<span class="input-group-text p-1"
									style="border: none; background: none;">-</span>
							</div>
							<div class="col-sm-3">
								<input type="text" name="tel2" class="form-control"
									maxlength="30" value="${dto.tel2}">
							</div>
							<div>
								<span class="input-group-text p-1"
									style="border: none; background: none;">-</span>
							</div>
							<div class="col-sm-3">
								<input type="text" name="tel3" class="form-control"
									maxlength="30" value="${dto.tel3}">
							</div>
						</div>

					</div>








					<div class="row g-3 mt-2">
						<label class="col-sm-2 col-form-label" for="startDate">입사일</label>
						<div class="col-sm-3">
							<input type="date" name="startDate" id="startDate"
								class="form-control" value="${dto.startDate}" placeholder="생년월일">
						</div>

						<label class="col-sm-2 col-form-label" for="endDate">퇴사일</label>
						<div class="col-sm-3">
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



				</div>
			</div>
		</div>
	</div>
</div>


