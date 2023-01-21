<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">

.table-form tr>td { vertical-align: middle; }
.table-form tr>td:first-child { text-align: center; }


.table-form .img-viewer { 
	cursor: pointer;  
	border: 1px solid #ccc;
	width: 359px;
	height: 335px;
	background-image: url("${pageContext.request.contextPath}/resources/images/station.jpg");
	position: relative;
	z-index: 9999;
	background-repeat : no-repeat;
	background-size : cover;
}


</style>

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
    str = f.zoonName.value.trim();
    if(!str) {
        alert("지역명을 입력하세요. ");
        f.zoonName.focus();
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



</script>




<div style="margin-top: 5rem; margin-bottom: 5rem;">
	<div class="title mt-4">
		<span>대여소 등록</span>
	</div>
	<form class="mt-4" id="stationForm" name="stationForm" method="post" enctype="multipart/form-data">
		<table class="table text-center w-100" style="font-size: 16px;">
			<tr>
				<td rowspan="6" style="width:359px; padding: 0;"><div class="table-form">
			<div class="img-viewer"></div>
				<input type="file" name="imageFilenameFile" id="imageFilenameFile" accept="image/*" class="form-control"
				style="display: None; ">
		</div></td>
				<td >대여소명</td>
				<td><input type="text" name="name" class="form-control"
					value="${dto.name}" placeholder="대여소명"></td>
			</tr>
			<tr>
				<td >경도</td>
				<td><input type="text" name="x_pos" class="form-control"
					value="${dto.x_pos}" placeholder="경도"></td>
			</tr>
			<tr>
				<td >위도</td>
				<td><input type="text" name="y_pos" class="form-control"
					value="${dto.y_pos}" placeholder="위도"></td>
			</tr>
			<tr>
				<td >최대수량</td>
				<td><input type="text" name="maxQty" class="form-control"
					value="${dto.maxQty}" placeholder="최대수량"></td>
			</tr>
			<tr>
				<td class=" col-sm-2" scope="row">지역구</td>
				<td><input type="text" name="zoonName"
					class="form-control" value="${dto.zoonName}" placeholder="지역구"></td>
			</tr>
			<tr>
				<td >주소</td>
				<td><input type="text" name="addr" class="form-control"
					value="${dto.addr}" placeholder="주소"></td>
			</tr>
		</table>
	</form>
	
	<div class="d-flex justify-content-center mt-4">
		<button type="button" class="btn btn-main me-2" onclick="sendOk();">
			등록하기&nbsp;<i class="bi bi-check2"></i>
		</button>
		<button type="reset" class="btn btn-sub me-2">다시입력</button>
		<button type="button" class="btn btn-sub" 
			onclick="location.href='${pageContext.request.contextPath}/stationmanage/main';">
			등록취소&nbsp;<i class="bi bi-x"></i>
		</button>
	</div>
</div>


<script type="text/javascript">

$(function(){

	$(".table-form .img-viewer").click(function(){
		$("#imageFilenameFile").trigger("click");
	});
	
	$("#imageFilenameFile").change(function(){
		let file = this.files[0];
		
		
		if(! file) {
			$(".table-form .img-viewer").empty();
			
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/photo/"+img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/insertimage.png";
			}
			$(".table-form .img-viewer").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) { 
			$(".table-form .img-viewer").empty();
			$(".table-form .img-viewer").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL( file );
	});



});


</script>


