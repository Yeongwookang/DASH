<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">

.map { width:700px; height:450px; border: 1px solid #777; }
.maps { width:700px; height:450px; border: 1px solid #777; }

.marker-info { cursor: pointer; font-size: 11px; font-weight: 600; font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif; line-height: 1.5; padding: 5px; }

.overlaybox { position: absolute; left: 0; bottom: 40px; width: 300px; height: 130px; margin-left: -144px;text-align: left; overflow: hidden; font-size: 12px; font-family: 'Malgun Gothic', dotum, '돋움', sans-serif; line-height: 1.5; }
.overlaybox * { padding: 0;margin: 0; }
.overlaybox .overlay-info { width: 298px; height: 118px; border-radius: 5px; border-bottom: 2px solid #ccc; border-right: 1px solid #ccc; overflow: hidden; background: #fff; }
.overlaybox .overlay-info:nth-child(1) { border: 0; box-shadow: 0px 1px 2px #888; }
.overlay-info .overlay-title { padding: 5px 0 0 10px; height: 30px; background: #f8f9fa; border-bottom: 1px solid #ddd; font-size: 13px; font-weight: bold; }
.overlay-info .close { position: absolute; top: 10px; right: 10px; color: #888; width: 17px; height: 17px; background: url('${pageContext.request.contextPath}/resources/images/close_icon.png'); background-repeat: no-repeat; }
.overlay-info .close:hover { cursor: pointer; }
.overlay-info .overlay-body { position: relative; overflow: hidden; }
.overlay-info .desc { position: relative; margin: 13px 0 0 90px; height: 75px; }
.desc div { padding 3px; }
.desc .ellipsis { overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
.desc .other { font-size: 11px; color: #888; margin-top: -2px; }
.overlay-info .img { position: absolute; top: 6px; left: 5px; width: 73px; height: 71px; border: 1px solid #ddd; color: #888; overflow: hidden; }
.overlay-info:after { content: '';position: absolute; margin-left: -16px; left: 50%; bottom: 0; width: 22px; height: 12px; background: url('${pageContext.request.contextPath}/resources/images/vertex_white.png'); }
.overlay-info .link { color: #333; }
.overlay-info .link:hover { color: #5085BB; }
</style>

<script type="text/javascript">
$(function(){
	
    $("button[role='tab']").on("click", function(e){
		const tab = $(this).attr("aria-controls");
    	if(tab === "nav-profile") {
    		var url = "${pageContext.request.contextPath}/chargestation/main";
    		location.href=url;
    	}
    });
});
</script>

<div class="m-auto card mt-5 mb-5 p-4">
	<div class="text-start fs-3 mb-4 ps-4">
		<span>| 충전소·대여소 현황</span>
	</div>

	<nav>
		<div class="nav nav-tabs" id="nav-tab" role="tablist">
			<button style="color: black;" class="nav-link" id="nav-home-tab"
				data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
				role="tab" aria-controls="nav-home" aria-selected="true">대여소 현황</button>
			<button style="color: black;" class="nav-link" id="nav-profile-tab"
				data-bs-toggle="tab" data-bs-target="#nav-profile" type="button"
				role="tab" aria-controls="nav-profile" aria-selected="false">충전소 현황</button>
		</div>
	</nav>
	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
			aria-labelledby="nav-home-tab" tabindex="0">
			<div id="map" class="map" style="width: 100%; position:static; top: 0px; height: 600px;"></div>
		</div>
		<div class="tab-pane fade" id="nav-profile" role="tabpanel"
			aria-labelledby="nav-profile-tab" tabindex="0">
			<div id="maps" class="maps" style="width: 100%; height: 100px;"></div>
		</div>
	</div>
	
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac62133af390475a070f5933661ec2c1"></script>
<script type="text/javascript">
	function ajaxFun(url, method, query, dataType, fn) {
		$.ajax({
			type : method,
			url : url,
			data : query,
			dataType : dataType,
			success : function(data) {
				fn(data);
			},
			beforeSend : function(jqXHR) {
				jqXHR.setRequestHeader("AJAX", true);
			},
			error : function(jqXHR) {
				if (jqXHR.status === 400) {
					alert("요청 처리가 실패 했습니다.");
					return false;
				}

				console.log(jqXHR.responseText);
			}
		});
	}
</script>

<script type="text/javascript">
		

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.555399, 126.970898), // 지도의 중심좌표
		level : 8
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	
	
	var url = "${pageContext.request.contextPath}/stationmanage/regions";
	var query = null;
	var fn = function(data) {
		createMarker(data);
		;
	}
	ajaxFun(url, "get", query, "json", fn);

	var overlayArray = [];
	function createMarker(data) {
		var positions = [];
		overlayArray.length = 0;

		$(data.list).each(function(index, item) {
			let mobj = {
				content : "<div class='marker-info'>" + item.name + "</div>",
				latlng : new kakao.maps.LatLng(item.y_pos, item.x_pos),
				num : item.stNum,
				title : item.zoonname,
				img: item.imageFilename,
				addr : item.addr,
				name : item.name,
				maxQty : item.maxQty

			};
			positions.push(mobj);

		});
		
		var imageSrc =  "${pageContext.request.contextPath}/resources/images/marker.png";
	    imageSize = new kakao.maps.Size(85, 85);

	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	    
	    
		for (var i = 0; i < positions.length; i++) {

			var marker = new kakao.maps.Marker({
				map : map,
				position : positions[i].latlng,
				image: markerImage
			});

			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content
			// 인포윈도우에 표시할 내용
			});

			var imgSrc = "${pageContext.request.contextPath}/resources/images/x_station.png";
			if(positions[i].img) {
		    	imgSrc = "${pageContext.request.contextPath}/resources/images/"+positions[i].img;
		    }
			
			var content = "<div class='overlaybox'>"
					+ "    <div class='overlay-info'>"
					+ "        <div class='overlay-title'>"
					+ positions[i].num + ".\n"+ positions[i].name
					+ "            <div class='close' title='닫기' onclick='closeOverlay("
					+ i
					+ ")'></div>"
					+ "        </div>"
					+ "        <div class='overlay-body'>"
					+ "            <div class='img'><img src='"+imgSrc+"' width='73' height='70'></div>"
					+ "            <div class='desc'>"
					+ "                <div class='ellipsis'>"
					+ positions[i].addr + "</div>"
					+ "                <div>킥보드 최대 수용수량 : "
					+ positions[i].maxQty + "</div>" + "            </div>"
					+ "         </div>" + "    </div>" + "</div>";

			var overlay = new kakao.maps.CustomOverlay({
				content : content,
				map : map,
				position : positions[i].latlng
			});
			overlay.setMap(null);
			overlayArray.push(overlay);

			// 마커에 click 이벤트를 등록
			kakao.maps.event.addListener(marker, 'click', makeClickListener(
					map, marker, overlay));

			// 마커에 mouseover/mouseout 이벤트 등록
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(
					map, marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
		}

		// click시 오버레이 표시
		function makeClickListener(map, marker, overlay) {
			return function() {
				closeAllOverlay();

				overlay.setMap(map);
			};
		}

		// 모든 overlay 닫기
		function closeAllOverlay() {
			for (var idx = 0; idx < overlayArray.length; idx++) {
				overlayArray[idx].setMap(null);
			}
		}

		// mouseover시 인포 윈도우를 표시
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}
		// mouseout시 인포 윈도우를 닫기
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
	}

	function closeOverlay(idx) {
		try {
			overlayArray[idx].setMap(null);
		} catch (e) {
		}
	}
	
	

	
	
</script>
