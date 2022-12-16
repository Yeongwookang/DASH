<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
header { 
	height: 110px;
	width: 1700px;
	float: right;
	box-shadow: rgb(0 0 0 / 0%) 0 0px 0px 0px;
	background: #E9ECEF; 
}

.vertical_nav {
	top: 0px;
	background: #343A40;  
}
 
.dash {
	width: 180px;
	height: 50px;
	margin-left: 10px;
}    

.icon {
	color: #FF5375;
} 

.header-right {
	margin-right: 200px;
	margin-top: 25px; 
}

.menu {
	background: #343A40;
}

.collapse_menu {
	background: #343A40; 
	color: white;
}

.collapse_menu:hover {
	background: #6C757D;
	color: white;
} 

.menu--item {
	top: 100px;
}
 
.menu--label {
	font-family: 'Pretendard-Regular';
	font-weight: 700;
	font-size: 18px;
	color: white;
	height: 50px;
	padding-left: 20px; 
}

.menu--link:hover, .menu--link:hover .menu--label:hover {
  color: white;
  background: #6C757D; } 
 
.menu--link::after {color: white;} 
  
.menu--subitens__opened {
  background: #343A40;   } 

.sub_menu--link:hover {
  color: white;
  background: #6C757D; }

.sub_menu--link {
	color: white;
	font-family: 'Pretendard-Regular';
	font-weight: 700;
	font-size: 14px;	 
} 

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

html {
	 background: #E9ECEF;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<script type="text/javascript">
// 메뉴 활성화
$(function(){
	
    var url = window.location.pathname;
    var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");
    
    try {
    	$('nav ul>li>a').each(function() {
    		if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
    			$(this).addClass('active_menu');
    			return false;
    		}
    	});
    	if($('nav ul>li>a').hasClass("active_menu")) return false;
    	
    	$('nav ul>.menu--item__has_sub_menu').each(function() {
    		if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
    			$(this).addClass('active_menu');
    			return false;
    		}
    	});
    }catch(e) {
    }
});

$(function(){
	$('nav ul>.menu--item__has_sub_menu ul>li>a').each(function() {
		if($(this).hasClass('active_menu')) {
			$(this).closest(".menu--item__has_sub_menu").addClass('menu--subitens__opened');
			return false;
		}
	});
});
</script>

<header class="header clearfix">
	<button type="button" id="toggleMenu" class="toggle_menu">
		<i class="fa-solid fa-bars"></i>
	</button>
	
	<div class="header-container">
		<div class="header-left">
			 
		</div> 
		<div class="header-right">
			<a href="${pageContext.request.contextPath}/member/logout" title="로그아웃" class="icon"><i class="fa-solid fa-right-from-bracket fa-2x"></i></a>
		</div>
	</div>
</header>
  

<nav class="vertical_nav">
	<ul id="js-menu" class="menu">
		<li class="menu--item"> 
			<a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/logo.png" class="dash"></a>
		</li>   
		<li class="menu--item">
			<a href="${pageContext.request.contextPath}/admin" class="menu--link" title="Home">
				<span class="menu--label">Home</span>
			</a>
		</li>

		<li class="menu--item">
	        <a href="${pageContext.request.contextPath}/admin/memberManage/list" class="menu--link" title="위치 추천">
				<span class="menu--label">위치 추천</span>
			</a>
		</li>
	
		<li class="menu--item menu--item__has_sub_menu">
			<label class="menu--link" title="신규 등록">
				<span class="menu--label">신규 등록</span>
			</label>

			<ul class="sub_menu">
				<li class="sub_menu--item">
					<a href="#" class="sub_menu--link">신규 대여소 등록</a>
				</li>
				<li class="sub_menu--item">
					<a href="#" class="sub_menu--link">신규 무선충전소 등록</a>
				</li>
				<li class="sub_menu--item">
					<a href="#" class="sub_menu--link">신규 킥보드 등록</a>
				</li>
			</ul>
		</li>
		
		<li class="menu--item">
			<a href="#" class="menu--link" title="대여소 관리">
				<span class="menu--label">대여소 관리</span>
			</a>
		</li>
		
		<li class="menu--item">
			<a href="#" class="menu--link" title="킥보드 관리">
				<span class="menu--label">킥보드 관리</span>
			</a>
		</li>

		<li class="menu--item menu--item__has_sub_menu">
			<label class="menu--link" title="인사관리">
				<span class="menu--label">인사관리</span>
			</label>

			<ul class="sub_menu">
				<li class="sub_menu--item">
					<a href="#" class="sub_menu--link">인사관리</a>
				</li>
				<li class="sub_menu--item">
					<a href="#" class="sub_menu--link">신규 사원 등록</a>
				</li>
			</ul>
		</li>
		
		<li class="menu--item menu--item__has_sub_menu">
			<label class="menu--link" title="프로그램 관리">
				<span class="menu--label">프로그램 관리</span>
			</label>

			<ul class="sub_menu">
				<li class="sub_menu--item">
					<a href="#" class="sub_menu--link">개발 요청사항 관리</a>
				</li>
				<li class="sub_menu--item">
					<a href="#" class="sub_menu--link">게시판 추가</a>
				</li>
			</ul>
		</li>

	</ul>

	<button id="collapse_menu" class="collapse_menu">
		<i class="collapse_menu--icon fa fa-fw"></i>
		<span class="menu--label"></span>
	</button>

</nav>
