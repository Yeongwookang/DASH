<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><tiles:insertAttribute name="title"/></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
	
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kyw.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
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
	</style>
</head>
<body>
<div style="background-color: #f5f5f5; width: 100vw; height: 100vh; min-width: 1600px; min-height:900px;">
	<div class="border shadow bg-main bg-gradient box-main d-flex justify-content-between">
			<div class="d-flex align-items-center" style="border-radius: 2rem 0 0 2rem / 2rem 0 0 2rem; width: 20%;">
				<tiles:insertAttribute name="sidebar"/>
			</div>
			<div class="border main-box me-4 mt-4 mb-4" style="width:80%;">
				<tiles:insertAttribute name="header"/>   
				<tiles:insertAttribute name="body"/>
			</div>
	</div>
</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>