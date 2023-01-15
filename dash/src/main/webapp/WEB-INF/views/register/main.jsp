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
	background-image: url("${pageContext.request.contextPath}/resources/images/insertimage.png");
	position: relative;
	z-index: 9999;
	background-repeat : no-repeat;
	background-size : cover;
}

.table-form1 .img-viewer1

{
	cursor: pointer;
	border: 1px solid #ccc;
	width: 359px;
	height: 324px;
	background-image: url("${pageContext.request.contextPath}/resources/images/insertimage.png");
	position: relative;
	z-index: 9999;
	background-repeat : no-repeat;
	background-size : cover;
}


.table-form3 .img-viewer3

{
	cursor: pointer;
	border: 1px solid #ccc;
	width: 359px;
	height: 300px;
	background-image: url("${pageContext.request.contextPath}/resources/images/insertimage.png");
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




<div class="card mt-5 mb-5 p-4 m-auto"
	style="width: 70%;">
	<div class="text-start fs-4 mb-4">
		<span>| 신규 등록</span>

		<nav class="mt-4" style="font-size: 17px;">
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<button style="color: black;" class="nav-link active" id="nav-home-tab"
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

		<div class="tab-content mt-5" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
				aria-labelledby="nav-home-tab" tabindex="0">
						
						<form  id="stationForm" name="stationForm" method="post" enctype="multipart/form-data">
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
			<div class="tab-pane fade" id="nav-profile" role="tabpanel"
				aria-labelledby="nav-profile-tab" tabindex="1">
							<form name="stationchForm"  id="stationchForm" method="post" enctype="multipart/form-data">
								<div class="d-flex justify-content-start">
								  <div class="table-form1">
										<div class="img-viewer1 ms-3 me-4"></div>
											 <input type="file"
											name="imageFilenameFile" id="imageFilenameFile1" accept="image/*" class="form-control"
											style="display: none;">
								</div>
								<table class="table text-center align-middle" style="font-size: 16px; height: 325px;">	
									<tr>
										<td class="col-sm-2" scope="row">충전소명</td>
										<td><input type="text" name="name" class="form-control"
											value="${dto.name}" placeholder="충전소명" ></td>
									</tr>
									<tr>
										<td class="col-sm-2" scope="row">경도</td>
										<td><input type="text" name="x_pos" class="form-control"
											value="${dto.x_pos}"  placeholder="경도"></td>
									</tr>
									<tr>
										<td class="col-sm-2" scope="row">위도</td>
										<td><input type="text" name="y_pos" class="form-control"
											value="${dto.y_pos}"  placeholder="위도"></td>
									</tr>
									<tr>
										<td class="col-sm-2" scope="row">충전 최대수량</td>
										<td><input type="text" name="LEFTQTY"
											class="form-control" value="${dto.LEFTQTY}"  placeholder="충전 최대수량"></td>
									</tr>
									<tr>
										<td class="col-sm-2" scope="row">주소</td>
										<td><input type="text" name="addr" class="form-control"
											value="${dto.addr}"  placeholder="주소"></td>
									</tr>
								</table>
								</div>
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
			<div class="tab-pane fade" id="nav-kick" role="tabpanel"
				aria-labelledby="nav-kickboard-tab" tabindex="2">
							<form name="stationkForm" id="stationkForm" method="post" enctype="multipart/form-data">
							<div class="d-flex justify-content-start">
							  <div class="table-form3">
										<div class="img-viewer3 ms-3 me-4"></div>
											 <input type="file"
											name="imageFilenameFile" id="imageFilenameFile3" accept="image/*" class="form-control"
											style="display: None;">
								</div>
								<table class="table text-center align-middle" style="font-size: 16px; height: 300px; ">
									<tr>
										<td class="col-sm-2" scope="row">제품명</td>
										<td><input type="text" name="name" class="form-control"
											value="${dto.name}" placeholder="제품명"></td>
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
								</table>
								</div>
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


$(function(){

	$(".table-form1 .img-viewer1").click(function(){
		$("#imageFilenameFile1").trigger("click");
	});
	
	$("#imageFilenameFile1").change(function(){
		let file = this.files[0];
	
		if(! file) {
			$(".table-form1 .img-viewer1").empty();
			
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/photo/"+img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/insertimage.png";
			}
			$(".table-form1 .img-viewer1").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) { 
			$(".table-form1 .img-viewer1").empty();
			$(".table-form1 .img-viewer1").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL( file );
	});

});

$(function(){

	$(".table-form3 .img-viewer3").click(function(){
		$("#imageFilenameFile3").trigger("click");
	});
	
	$("#imageFilenameFile3").change(function(){
		let file = this.files[0];
		
		
		if(! file) {
			$(".table-form3 .img-viewer3").empty();
			
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/photo/"+img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/insertimage.png";
			}
			$(".table-form3 .img-viewer3").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) { 
			$(".table-form3 .img-viewer3").empty();
			$(".table-form3 .img-viewer3").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL( file );
	});

});


</script>


