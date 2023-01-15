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
	<title><tiles:insertAttribute name="title"/></title>
	<style>html, body {width: 100%;height: 100%;margin: 0;padding: 0;}</style>
    <style>#map {position:absolute;top:0;bottom:0;right:0;left:0;}</style>
    <script src="https://cdn.jsdelivr.net/npm/leaflet@1.9.3/dist/leaflet.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet@1.9.3/dist/leaflet.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/python-visualization/folium/folium/templates/leaflet.awesome.rotate.min.css"/>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kyw.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/analysis.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" type="text/css">
	
	<meta name="viewport" content="width=device-width,
                initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<style type="text/css">
#map_2d81c07882e829b16808a14b15af9573 {
                    position: relative;
                    width: 100.0%;
                    height: 100.0%;
                    left: 0.0%;
                    top: 0.0%;
                }
.leaflet-container { font-size: 1rem; }
	
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:100%;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:450px; height:600px; margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 1);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F; margin:3px 0;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}

#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
	
	
 </style>
</head>
<body>
 <div class="map_wrap">
  <div class="folium-map" id="map_2d81c07882e829b16808a14b15af9573"></div>
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                   <input type="text" value="이태원 맛집" id="keyword" size="15"style="width: 300px;"> 
                    <button type="submit">검색</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
   
<script>         
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
   				alert("요청 처리가 실패 했습니다.");
   				return false;
   			}
   	    	
   			console.log(jqXHR.responseText);
   		}
   	});
   }
   
var arr_100=[];
var arr_300=[];
var arr_500=[];
var jsO_100;
var jsO_300;
var jsO_500;

$(function(){
	let url = "${pageContext.request.contextPath}/map/meter";
	
	
	
	
	const fn =function (data) {
		for(item of data.list_100){
			let obj; 
			obj = { "type" : item["type"], "properties" : item["properties"], "geometry":item["geometry"] };  	
			arr_100.push(obj); 
			
		}
    	
		console.log(arr_100)
		
		jsO_100 = {
	 				"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
	   				"features": arr_100
	   			};
		
		console.log(jsO_100);
		
		for(item of data.list_300){
			let obj; 
			obj = { "type" : item["type"], "properties" : item["properties"], "geometry":item["geometry"] };  	
			arr_300.push(obj); 
			
		}
    	
		console.log(arr_300)
		
		jsO_300 = {
	 				"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
	   				"features": arr_300
	   			};
		
		console.log(jsO_300);
		
		for(item of data.list_500){
			let obj; 
			obj = { "type" : item["type"], "properties" : item["properties"], "geometry":item["geometry"] };  	
			arr_500.push(obj); 
			
		}
    	
		console.log(arr_500)
		
		jsO_500 = {
	 				"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
	   				"features": arr_500
	   			};
		
		console.log(jsO_500);
		geo_json_100_add (jsO_100);
		geo_json_300_add (jsO_300);
		geo_json_500_add (jsO_500);
	}

	ajaxFun(url,"get",null,"json",fn);
	
	
	
});




var map_2d81c07882e829b16808a14b15af9573 = L.map(
    "map_2d81c07882e829b16808a14b15af9573",
    {
        center: [37.541, 126.986],
        crs: L.CRS.EPSG3857,
        zoom: 14,
        zoomControl: true,
        preferCanvas: false,
    }
);


var tile_layer_e7d08d3bddd0875bfc28142ded8cd1f7 = L.tileLayer(
    "http://xdworld.vworld.kr:8080/2d/Base/service/{z}/{x}/{y}.png",{
                attribution: 'DASH &copy; VWORLD(국토부)',
            	subdomains: 'abcd',
            	maxZoom: 19}
).addTo(map_2d81c07882e829b16808a14b15af9573);



function geo_json_100_onEachFeature(feature, layer) {
layer.on({
});
};
var geo_json_100 = L.geoJson(null, {
    onEachFeature: geo_json_100_onEachFeature,

});

function geo_json_100_add (data) {
geo_json_100
    .addData(data)
    .addTo(map_2d81c07882e829b16808a14b15af9573);
}




function geo_json_300_onEachFeature(feature, layer) {
	layer.on({
	});
	};
var geo_json_300 = L.geoJson(null, {
    onEachFeature: geo_json_300_onEachFeature,

});

function geo_json_300_add (data) {
geo_json_300
    .addData(data)
    .addTo(map_2d81c07882e829b16808a14b15af9573);
}


	
function geo_json_500_onEachFeature(feature, layer) {
	layer.on({
	});
	};
var geo_json_500 = L.geoJson(null, {
    onEachFeature: geo_json_500_onEachFeature,

});

function geo_json_500_add (data) {
geo_json_500
    .addData(data)
    .addTo(map_2d81c07882e829b16808a14b15af9573);
}
	




var layer_control_44c8d1a60beb9da1ab7bd8739988c955 = {
    base_layers : {
        "openstreetmap" : tile_layer_e7d08d3bddd0875bfc28142ded8cd1f7,
    },
    overlays :  {
        "100m" : geo_json_100, "300m" : geo_json_300, "500m" : geo_json_500,
    },
};
L.control.layers(
    layer_control_44c8d1a60beb9da1ab7bd8739988c955.base_layers,
    layer_control_44c8d1a60beb9da1ab7bd8739988c955.overlays,
    {"autoZIndex": true, "collapsed": true, "position": "topright"}
).addTo(map_2d81c07882e829b16808a14b15af9573);



   
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>
