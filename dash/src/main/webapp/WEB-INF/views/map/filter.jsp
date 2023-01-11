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
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);    



var url = "${pageContext.request.contextPath}/map/meter";
var query = null;
var fn = function(data) {
	console.log(data);
}


ajaxFun(url, "get", query, "json", fn);






// 다각형 객체를 구성할 좌표배열입니다 
var path = [
	new kakao.maps.LatLng(33.45086654081833, 126.56906858718982),
	new kakao.maps.LatLng(33.45010890948828, 126.56898629127468),
	new kakao.maps.LatLng(33.44979857909499, 126.57049357211622),
	new kakao.maps.LatLng(33.450137483918496, 126.57202991943016),
	new kakao.maps.LatLng(33.450706188506054, 126.57223147947938),
	new kakao.maps.LatLng(33.45164068091554, 126.5713126693152)
];

var hole = [
	new kakao.maps.LatLng(33.4506262491095, 126.56997323165163),
	new kakao.maps.LatLng(33.45029422800042, 126.57042659659218),
	new kakao.maps.LatLng(33.45032339792896, 126.5710395101452),
	new kakao.maps.LatLng(33.450622037218295, 126.57136070280123),
	new kakao.maps.LatLng(33.450964416902046, 126.57129448564594),
	new kakao.maps.LatLng(33.4510527150534, 126.57075627706975)
];

// 다각형을 생성하고 지도에 표시합니다
var polygon = new kakao.maps.Polygon({
	map: map,
    path: [path, hole], // 좌표 배열의 배열로 하나의 다각형을 표시할 수 있습니다
    strokeWeight: 2,
    strokeColor: '#b26bb2',
    strokeOpacity: 0.8,
    fillColor: '#f9f',
    fillOpacity: 0.7 
});
</script>

