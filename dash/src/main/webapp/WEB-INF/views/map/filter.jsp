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
    center: new kakao.maps.LatLng(37.55741966828745, 127.18158712098067), // 지도의 중심좌표
    level: 8 // 지도의 확대 레벨
};  

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다



var url = "${pageContext.request.contextPath}/map/meter";
var query = null;
var fn = function(data) {
	createPolygon(data);
	// console.log(data);
}

ajaxFun(url, "get", query, "json", fn);

function createPolygon(data){
	
	$(data.list).each(function(index, item) {
		console.log(item.coordinates);
		
			var polygonPath = [
			    new kakao.maps.LatLng(37.55741966828745, 127.18158712098067),
			    new kakao.maps.LatLng(37.557570936537076, 127.1815615588181),
			    new kakao.maps.LatLng(37.557600391517575, 127.18156638305696),
			    new kakao.maps.LatLng(37.55764289939822, 127.18157870829651),
			    new kakao.maps.LatLng(37.557668541805214, 127.1815841274142),
			    new kakao.maps.LatLng(37.55783491473064, 127.1815722079517),
			    new kakao.maps.LatLng(37.558010994552035, 127.18155085497816),
			    new kakao.maps.LatLng(37.558360474504504, 127.18148219387214),
			    new kakao.maps.LatLng(37.55853333574828, 127.18143499149232),
			    new kakao.maps.LatLng(37.55858474040183, 127.18141827482785),
			    new kakao.maps.LatLng(37.558538463473354, 127.18121252868828),
			    new kakao.maps.LatLng(37.5584652292252, 127.18113678463436),
			    new kakao.maps.LatLng(37.5584420880341, 127.1810859692779),
			    new kakao.maps.LatLng(37.55842718171158, 127.18104710254387),
			    new kakao.maps.LatLng(37.558403098003346, 127.18099987268431),
			    new kakao.maps.LatLng(37.55838227792658, 127.18094535078065),
			    new kakao.maps.LatLng(37.558348801491675, 127.1808476216608),
			    new kakao.maps.LatLng(37.558332546482426, 127.18078905905065),
			    new kakao.maps.LatLng(37.55831766386211, 127.18072857574941)
			    
			];
		
			// 지도에 표시할 다각형을 생성합니다
			var polygon = new kakao.maps.Polygon({
			    path:polygonPath, // 그려질 다각형의 좌표 배열입니다
			    strokeWeight: 3, // 선의 두께입니다
			    strokeColor: '#39DE2A', // 선의 색깔입니다
			    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			    strokeStyle: 'longdash', // 선의 스타일입니다
			    fillColor: '#A2FF99', // 채우기 색깔입니다
			    fillOpacity: 0.7 // 채우기 불투명도 입니다
			});
		
			// 지도에 다각형을 표시합니다
			polygon.setMap(map);
		
	
	});
	
}

</script>