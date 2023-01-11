<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <iframe width="100%" height="100%" src="${pageContext.request.contextPath}/resources/HTML/map.html"></iframe> -->

<div id="map" class="map" style="width: 100%; height: 100%;"></div>


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

	
	
	var url = "${pageContext.request.contextPath}/map/subway";
	var query = null;
	var fn = function(data) {
		createMarker(data);
		console.log(data);
	}
	
	
	ajaxFun(url, "get", query, "json", fn);

	
	var overlayArray = [];
	function createMarker(data) {
		var positions = [];
		overlayArray.length = 0;

		$(data.list).each(function(index, item) {
			let mobj = {
				content : "<div class='marker-info'>" + item.name + "</div>",
				latlng : new kakao.maps.LatLng(item.lat, item.lon),
				name : item.name,
				lat : item.lat,
				lon: item.lon,
				addr : item.addr
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
			
		}

		
	}
	
	
</script>
