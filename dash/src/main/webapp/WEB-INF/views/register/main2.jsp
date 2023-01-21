<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">

.table-form tr>td { vertical-align: middle; }
.table-form tr>td:first-child { text-align: center; }




.table-form1 .img-viewer1

{
	cursor: pointer;
	border: 1px solid #ccc;
	width: 359px;
	height: 324px;
	background-image: url("${pageContext.request.contextPath}/resources/images/chargingStation.jpg");
	position: relative;
	z-index: 9999;
	background-repeat : no-repeat;
	background-size : cover;
}


</style>

<script type="text/javascript">


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
    str = f.LEFTQTY.value.trim();
    if(!str) {
        alert("최대 충전이 가능한 수량을 입력하세요. ");
        f.LEFTQTY.focus();
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

</script>




<div style="margin-top: 5rem;  margin-bottom: 5rem;">
	<div class="title mt-4">
		<span>충전소 등록</span>
	</div>


<form class="mt-4" name="stationchForm" id="stationchForm" method="post"
	enctype="multipart/form-data">
		<table class="table text-center align-middle"
			style="font-size: 16px; height: 325px;">
		<tr>
			<td rowspan="6" style="width:359px; padding: 0;">
			<div class="table-form1">
		<div class="img-viewer1"></div>
		<input type="file" name="imageFilenameFile" id="imageFilenameFile1"
			accept="image/*" class="form-control" style="display: none;">
			</div></td>
			<td class="col-sm-2" scope="row">충전소명</td>
			<td><input type="text" name="name" class="form-control"
				value="${dto.name}" placeholder="충전소명"></td>
		</tr>
		<tr>
			<td class="col-sm-2" scope="row">경도</td>
			<td><input type="text" name="x_pos" class="form-control"
				value="${dto.x_pos}" placeholder="경도"></td>
		</tr>
		<tr>
			<td class="col-sm-2" scope="row">위도</td>
			<td><input type="text" name="y_pos" class="form-control"
				value="${dto.y_pos}" placeholder="위도"></td>
		</tr>
		<tr>
			<td class="col-sm-2" scope="row">충전 최대수량</td>
			<td><input type="text" name="LEFTQTY" class="form-control"
				value="${dto.LEFTQTY}" placeholder="충전 최대수량"></td>
		</tr>
		<tr>
			<td class="col-sm-2" scope="row">주소</td>
			<td><input type="text" name="addr" class="form-control"
				value="${dto.addr}" placeholder="주소"></td>
		</tr>
	</table>
		</form>
<table class="table table-borderless">
	<tr>
		<td class="text-center">
			<button type="button" class="btn btn-main"
				onclick="sendChOk();">
				등록하기&nbsp;<i class="bi bi-check2"></i>
			</button>
			<button type="reset" class="btn btn-sub">다시입력</button>
			<button type="button" class="btn btn-sub"
				onclick="location.href='${pageContext.request.contextPath}/stationmanage/main';">
							등록취소&nbsp;<i class="bi bi-x"></i>
						</button>
					</td>
				</tr>
			</table>
</div>



<script type="text/javascript">
	$(function() {

		$(".table-form1 .img-viewer1").click(function() {
			$("#imageFilenameFile1").trigger("click");
		});

		$("#imageFilenameFile1")
				.change(
						function() {
							let file = this.files[0];

							if (!file) {
								$(".table-form1 .img-viewer1").empty();

								if (img) {
									img = "${pageContext.request.contextPath}/uploads/photo/"
											+ img;
								} else {
									img = "${pageContext.request.contextPath}/resources/images/insertimage.png";
								}
								$(".table-form1 .img-viewer1").css(
										"background-image", "url(" + img + ")");

								return false;
							}

							if (!file.type.match("image.*")) {
								this.focus();
								return false;
							}

							var reader = new FileReader();
							reader.onload = function(e) {
								$(".table-form1 .img-viewer1").empty();
								$(".table-form1 .img-viewer1").css(
										"background-image",
										"url(" + e.target.result + ")");
							};
							reader.readAsDataURL(file);
						});

	});
</script>


