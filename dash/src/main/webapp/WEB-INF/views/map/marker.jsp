<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="container">
	<div class="title">
	    <h3> 카카오 맵 </h3>
	</div>
	
	<div class="box">
		<p>
			<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/maps/map1';">간단한 카카오 지도</button>
			<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/maps/map2';">클릭한 위치에 마커 찍기</button>
		</p>
		<p>
			<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/maps/map3';">여러개 마커 및 이벤트 등록 - mouseover/mouseout</button>
			<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/maps/map4';">여러개 마커 및 이벤트 등록 - click</button>
		</p>
		<p>
			<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/maps/map5';"> 커스텀 오버레이 </button>
		</p>
		<p>
			<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/maps/map6';"> 주소로 마커  표시 </button>
			<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/maps/map7';"> 주소로 마커  표시, IP 위치기반-커스텀 오버레이 </button>
		</p>
		<p>
			<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/maps/map8';"> 검색 </button>
			<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/maps/map9';"> 카카오 키워드 검색 </button>
		</p>
		
	</div>
	
</div>
