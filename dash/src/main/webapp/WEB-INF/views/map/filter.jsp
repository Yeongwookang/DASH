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

<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAxpS-2Ielyu9jJlqqu994x2dtA9SOYcfA&callback=initMap&v=weekly"
      defer
    ></script>
<script type="text/javascript">
var url = "${pageContext.request.contextPath}/map/meter";
var query = null;
var fn = function(data) {
	initMap(data);
	// console.log(data);
}

ajaxFun(url, "get", query, "json", fn);


function initMap(data) {
	  const map = new google.maps.Map(document.getElementById("map"), {
	    zoom: 5,
	    center: { lat: 37.55741966828745, lng: 127.18158712098067 },
	    mapTypeId: "terrain",
	  });
	 
	  $(data.list).each(function(index, item) {
			//console.log(item.coordinates);
			
			let triangleCoords = [];
			for(let a1 of item.coordinates) {
				for(let a2 of a1) {
					for(let a3 of a2) {
						// console.log(a3[0], a3[1]);
						triangleCoords.push(a3[1], a3[0]);
					}
				}
			}
			
		 
		  const bermudaTriangle = new google.maps.Polygon({
		    paths: triangleCoords,
		    strokeColor: "#FF0000",
		    strokeOpacity: 0.8,
		    strokeWeight: 2,
		    fillColor: "#FF0000",
		    fillOpacity: 0.35,
	 });
	
		  bermudaTriangle.setMap(map);

}

window.initMap = initMap;
</script>

