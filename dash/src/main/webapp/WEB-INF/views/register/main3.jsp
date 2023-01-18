<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">

.table-form tr>td { vertical-align: middle; }
.table-form tr>td:first-child { text-align: center; }



.table-form3 .img-viewer3

{
	cursor: pointer;
	border: 1px solid #ccc;
	width: 359px;
	height: 300px;
	background-image: url("${pageContext.request.contextPath}/resources/images/kickboard.jpg"); 
	position: relative;
	z-index: 9999;
	background-repeat : no-repeat;
	background-size : cover;
}


</style>

<script type="text/javascript">

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




<div class="card mt-5 mb-5 p-4 m-auto">
	<div class="text-start fs-4 mb-4">
		<span>| 킥보드 등록</span>

						

							<form class="mt-4" name="stationkForm" id="stationkForm" method="post" enctype="multipart/form-data">
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
<script type="text/javascript">


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


