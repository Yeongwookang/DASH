<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script>
            L_NO_TOUCH = false;
            L_DISABLE_3D = false;
    </script>
	<title>DASH - 대여소 추천</title>
	<style>html, body {width: 100%;height: 100%;margin: 0;padding: 0;}</style>
    <script src="https://cdn.jsdelivr.net/npm/leaflet@1.9.3/dist/leaflet.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet@1.9.3/dist/leaflet.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/python-visualization/folium/folium/templates/leaflet.awesome.rotate.min.css"/>
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo_1.png" />
	<title>DASH</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kyw.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/analysis.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" type="text/css">
	
	<meta name="viewport" content="width=device-width,
                initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<style type="text/css">
@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
		}
	
		body{
		font-family: 'Pretendard-Regular';
		}
#map_1 {
                    position: relative;
                    width: 100.0%;
                    height: 100.0%;
                    left: 0.0%;
                    top: 0.0%;
                }
.leaflet-container { font-size: 1rem; }
 </style>
</head>
<body>
  <div class="folium-map" id="map_1">
  </div>
   
<script>            

var subway = [];
var station = [];

var rad;
var month;
var cus;

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert('요청 처리가 실패 했습니다.');
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}


var map_1 = L.map(
    "map_1",
    {
        center: [37.541, 126.986],
        crs: L.CRS.EPSG3857,
        zoom: 14,
        zoomControl: true,
        preferCanvas: false,
    }
);




	
var tile_layer_vworld = L.tileLayer(
    "http://xdworld.vworld.kr:8080/2d/Base/service/{z}/{x}/{y}.png",{
                attribution: 'DASH &copy; VWORLD(국토부)',
            	subdomains: 'abcd',
            	maxZoom: 19}
).addTo(map_1);

var baseMaps={"국토부맵": tile_layer_vworld};
var overlayMaps = {};

layer_control = L.control.layers(
		baseMaps, 
		overlayMaps,
		{"autoZIndex": true, "collapsed": true, "position": "topright"}
		).addTo(map_1);





L.Control.Filter = L.Control.extend({
	  onAdd: function(map_1) {
	    var el = L.DomUtil.create('div', 'leaflet-bar my-control');
	    el.innerHTML = '<p class="mb-2">반경</p>';
	    el.innerHTML += '<button type="button" data-bs-toggle="button" value="100" autocomplete="off" class="btn btn-main radFilter text-white me-2">100m</button>';
	    el.innerHTML += '<button type="button" data-bs-toggle="button" value="300" autocomplete="off" class="btn btn-main radFilter text-white me-2">300m</button>';
	    el.innerHTML += '<button type="button" data-bs-toggle="button" value="500" autocomplete="off" class="btn btn-main radFilter text-white">500m</button>';
	    el.innerHTML += '<hr>';
	    el.innerHTML += '<p class="mb-2">날짜</p>';
	    el.innerHTML += '<button type="button" data-bs-toggle="button" value="6" autocomplete="off" class="btn btn-main monthFilter text-white me-2">6개월</button>';
	    el.innerHTML += '<button type="button" data-bs-toggle="button" value="3" autocomplete="off" class="btn btn-main monthFilter text-white me-2">3개월</button>';
	    el.innerHTML += '<button type="button" data-bs-toggle="button" value="1" autocomplete="off" class="btn btn-main monthFilter text-white">1개월</button>';
	    el.innerHTML += '<hr>';
	    el.innerHTML += '<p class="mb-2">기준</p>';
	    el.innerHTML += '<button type="button" data-bs-toggle="button" value="dash" autocomplete="off" class="btn btn-main cusFilter text-white me-2">DASH</button>';
	    el.innerHTML += '<button type="button" data-bs-toggle="button" value="traffic" autocomplete="off" class="btn btn-main cusFilter text-white pe-1 ps-1 me-2">유동인구</button>';
	    el.innerHTML += '<button type="button" data-bs-toggle="button" value="bike" autocomplete="off" class="btn btn-main cusFilter text-white">따릉이</button>';

	    return el;
	  },

	  onRemove: function(map_1) {
	    // Nothing to do here
	  }
	});

	L.control.Filter = function(opts) {
	  return new L.Control.Filter(opts);
	}

	L.control.Filter({
		"autoZIndex": true, "collapsed": true, position: 'topleft'
	}).addTo(map_1);

L.Control.Home= L.Control.extend({
	onAdd: function(map_1){
		var el2 = L.DomUtil.create('div', 'leaflet-bar my-control2');
		
		el2.innerHTML = "<button class='btn btn-main' type='button' onclick='location.href=${pageContext.request.contextPath}/'><i class='fa-solid fa-house'></i></button>"
		return el2;
	},
	onRemove: function(map_1) {
	    // Nothing to do here
	 }
});

	L.control.Home = function(opts) {
	  return new L.Control.Home(opts);
	}

	L.control.Home({
		"autoZIndex": true, "collapsed": true,position: 'bottomright'
	}).addTo(map_1);

	
	
	$(function(){
		let url = "${pageContext.request.contextPath}/map/subway";
		
		const fn2 = function(data){
	
			for(item of data.list){
				let obj;
				obj = {"역사_ID": item["id"], "역사명": item["name"], "위도": item["lat"], "경도": item["lon"], "주소": item["addr"], "구": item["district"]}
				subway.push(obj);
				station.push(L.marker([item["lat"], item["lon"]]).bindPopup("<div style='font-family:Pretendard-Regular;'><div style='font-weight:bold;'>"+item["name"]+"역 </div><div> 주소: "+item["addr"]+"</div>"));
			}
			let stations = L.layerGroup(station);
			layer_control.addOverlay(stations,"역");
			stations.addTo(map_1);
		}
		
		ajaxFun(url, "get", null, "json", fn2);
		
	});

	

	function onEachFeature(feature, layer) {
	    // does this feature have a property named popupContent?
	    if (feature.properties && feature.properties.popupContent) {
	        layer.bindPopup(feature.properties.popupContent);
	    }
	}
var json;
function searchPolygon(rad, month, cus){
	let url= "${pageContext.request.contextPath}/map/meter";
	let query = "rad="+rad+"&month="+month+"&condition="+cus;
	
	const fn =function (data) {
		console.log(data);
		
		let arr=[];
		
		for(item of data[rad+"_"+month+"_"+cus]){
			let obj; 
			obj = { "type" : item["type"], "properties" : item["properties"], "geometry":item["geometry"] };  	
			arr.push(obj); 
			
		};
		
		
		let name = rad+", "+month+", "+cus;
		if(json!=null){
			layer_control.removeLayer(json);
			map_1.removeLayer(json);
		}
		json = L.geoJSON(arr, {onEachFeature: onEachFeature})
		
		layer_control.addOverlay(json, name);
		json.addTo(map_1);
		
	}

	ajaxFun(url, "get", query, "json",fn);
}	

	

</script>
<script type="text/javascript">



$(".radFilter").click(function(){
	if($(".radFilter.active").length > 1){
		$(".radFilter.active").removeClass("active");
		$(this).addClass("active");
		rad= this.value;
	}
	rad= this.value;
});

$(".monthFilter").click(function(){
	if($(".monthFilter.active").length > 1){
		$(".monthFilter.active").removeClass("active");
		$(this).addClass("active");
		month=this.value;
	} 
	month=this.value;
});

$(".cusFilter").click(function(){
	if($(".cusFilter.active").length > 1){
		$(".cusFilter.active").removeClass("active");
		$(this).addClass("active");
		cus=this.value;
	} 
	cus=this.value;
});

$(".btn-main").click(function(){
	if($(".radFilter.active").length === 1 && $(".monthFilter.active").length ===1 && $(".cusFilter.active").length===1){
		searchPolygon(rad,month,cus);
		console.log(rad+":"+month+":"+cus);
	}
});

</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>
