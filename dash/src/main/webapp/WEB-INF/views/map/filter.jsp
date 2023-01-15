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
	#map_e3fc9428f7d808fea22c5b6b6dbd0180 {
	    width: 100.0%;
	    height: 100.0%;
	    position: relative;
	    overflow: hidden;
	    z-index: 1;
	  
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
  <div class="folium-map" id="map_e3fc9428f7d808fea22c5b6b6dbd0180"></div>
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
    
    
            var map_e3fc9428f7d808fea22c5b6b6dbd0180 = L.map(
                "map_e3fc9428f7d808fea22c5b6b6dbd0180",
                {
                    center: [37.541, 126.986],
                    crs: L.CRS.EPSG3857,
                    zoom: 10,
                    zoomControl: true,
                    preferCanvas: false,
                }
            );

        
    
            var tile_layer_6876001d86866e7765203c40e3d6c80f = L.tileLayer(
            		"http://xdworld.vworld.kr:8080/2d/Base/service/{z}/{x}/{y}.png",{
                attribution: 'DASH &copy; VWORLD(국토부)',
            	subdomains: 'abcd',
            	maxZoom: 20}
            ).addTo(map_e3fc9428f7d808fea22c5b6b6dbd0180);
        
    

        function geo_json_de5c5d11ef684903b05a04a553052c3a_onEachFeature(feature, layer) {
            layer.on({
            });
        };
        var geo_json_de5c5d11ef684903b05a04a553052c3a = L.geoJson(null, {
                onEachFeature: geo_json_de5c5d11ef684903b05a04a553052c3a_onEachFeature,
            
        });
        
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
        
        var url = "${pageContext.request.contextPath}/map/meter";
    	var query = null;
    	var fn = function(data) {
    		// console.log(data);
    		geo_json_de5c5d11ef684903b05a04a553052c3a_add(data);
    	}
    	
    	ajaxFun(url, "get", query, "json", fn);

		var row = [];
        function geo_json_de5c5d11ef684903b05a04a553052c3a_add (data) {
        	$(data.list).each(function(index, item) {
  			  // console.log(item['type']);
  			  let obj;
  			  
			  obj = { "type": item["type"], "properties": item["properties"], "geometry":item["geometry"] },
			  row.push(obj); 
  			  console.log(row);
        	});
        	
            geo_json_de5c5d11ef684903b05a04a553052c3a
                .addData(data)
                .addTo(map_e3fc9428f7d808fea22c5b6b6dbd0180);
            
        }
            geo_json_de5c5d11ef684903b05a04a553052c3a_add(
            		{
            		"type": "FeatureCollection",
            		"name": "100m",
            		"crs":{ "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
            		"features":row
            		}
            )
        
            var layer_control_2425a285a6180a2933830a58b0cbd424 = {
                base_layers : {
                    "openstreetmap" : tile_layer_6876001d86866e7765203c40e3d6c80f,
                },
                overlays :  {
                    "geojson" : geo_json_de5c5d11ef684903b05a04a553052c3a,
                },
            };
            L.control.layers(
                layer_control_2425a285a6180a2933830a58b0cbd424.base_layers,
                layer_control_2425a285a6180a2933830a58b0cbd424.overlays,
                {"autoZIndex": true, "collapsed": true, "position": "topright"}
            ).addTo(map_e3fc9428f7d808fea22c5b6b6dbd0180);
        
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>
