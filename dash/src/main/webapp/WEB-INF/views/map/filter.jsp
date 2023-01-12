<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <iframe width="100%" height="100%" src="${pageContext.request.contextPath}/resources/HTML/map.html"></iframe> -->

<div id="map" class="map" style="width: 100%; height: 100%;"></div>




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

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9Z4-u8iFbw7C2fYoDT9U-nt8JeTzPTM4&callback=initMap"></script>
<script type="text/javascript">
let map;

function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 10,
    center: { lat: 37.55741966828745, lng: 127.18158712098067 },
    mapTypeId: "terrain",
  });
 	map.data.loadGeoJson(
 		"${pageContext.request.contextPath}/resources/json/500m.geojson"		
 	)

};

window.initMap = initMap;
</script>

