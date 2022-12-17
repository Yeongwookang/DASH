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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
	
	
</head>
<body>
<div class="flex-container">
	<div class="p-4">
		<div class="row border" style="border-radius: 2rem 2rem 2rem 2rem / 2rem 2rem 2rem 2rem;">
			<div class="col-2" style="min-height: 100vh">
				<tiles:insertAttribute name="sidebar"/>
			</div>
			<div class="col-10">
				<div class="row">
					<tiles:insertAttribute name="header"/>
				</div>
				<div class="row">
					<tiles:insertAttribute name="body"/>
				</div>
			</div>
			
			<footer>
				<tiles:insertAttribute name="footer"/>
			</footer>
		</div>
	</div>
</div>
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>