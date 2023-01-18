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




<div class="card mt-5 mb-5 p-4 m-auto">
	<div class="text-start fs-4 mb-4 ">
		<span>| 대여소 등록</span>


						
						<form class="mt-4" id="stationForm" name="stationForm" method="post" enctype="multipart/form-data">
							<div class="d-flex justify-content-start">
								    <div class="table-form">
										<div class="img-viewer ms-3 me-4"></div>
											<input type="file" name="imageFilenameFile" id="imageFilenameFile" accept="image/*" class="form-control"
											style="display: None; ">
										
									</div>
								<table class="table text-center align-middle" style="font-size: 16px;">
									
									<tr>
										<td class=" col-sm-2" scope="row">대여소명</td>
										<td><input type="text" name="name" class="form-control"
											value="${dto.name}" placeholder="대여소명"></td>
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
										<td class="col-sm-2" scope="row">최대수량</td>
										<td><input type="text" name="maxQty" class="form-control"
											value="${dto.maxQty}" placeholder="최대수량"></td>
									</tr>
									<tr>
										<td class=" col-sm-2" scope="row">지역구</td>
										<td><input type="text" name="zoonName"
											class="form-control" value="${dto.zoonName}" placeholder="지역구"></td>
									</tr>
									<tr>
										<td class="col-sm-2" scope="row">주소</td>
										<td><input type="text" name="addr" class="form-control"
											value="${dto.addr}" placeholder="주소"></td>
									</tr>
								</table>
								</div>
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


