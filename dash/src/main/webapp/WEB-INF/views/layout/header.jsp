<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
.header-right {
	float: right;
	margin-right: 100px;
	margin-top: 28px;
}  

.icon {
	color: black;
	margin-left: 30px; 
}
.icon:hover {
	color: #FF5375;
}

.font {
	font-family: 'Pretendard-Regular';
	font-weight: 700;
	font-size: 21px;
	float: left;
	margin-left: 60px;
	margin-top: 20px;
}

.cal {
	font-weight: 500;
	font-size: 14px;
	color: #787878;
	margin-right: 87px;
}    

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />

<header> 
	<div>
		<span class="font">
			즐거운 ${dayOfWeek}요일입니다.
			<br>
			<span class="cal">${msg}</span>
		</span>
		<div class="header-right">
			<a class="icon"><i class="fa-regular fa-bell"></i></a> 
			<a class="icon"><i class="fa-solid fa-angle-down"></i></a>
			<a href="${pageContext.request.contextPath}/member/logout" title="로그아웃" class="icon"><i class="fa-solid fa-arrow-right-from-bracket"></i></a>
		</div>
	</div> 
</header>