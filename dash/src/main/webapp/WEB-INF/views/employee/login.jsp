<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
			background: #FF5375;
		} 
		
		img{
		  width: 100%;
		}
		.login {
		    height: 1000px;
		    width: 100%;
		} 
		.login_box {
		    width: 1050px;
		    height: 600px;
		    position: absolute;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%,-50%);
		    background: #fff;
		    border-radius: 10px;
		    box-shadow: 1px 4px 22px -8px #0004;
		    display: flex;
		    overflow: hidden;
		}
		.login_box .left{
		  width: 41%;
		  height: 100%;
		  padding: 25px 25px;
		  
		}
		.login_box .right{
		  width: 59%;
		  height: 100%  
		}
		.left .top_link a {
		    color: #452A5A;
		    font-weight: 400;
		}
		.left .top_link{
		  height: 20px
		}
		.left .contact{
		  display: flex;
		    align-items: center;
		    justify-content: center;
		    align-self: center;
		    height: 100%;
		    width: 73%;
		    margin: auto;
		}
		.left h3{
		  text-align: center;
		  margin-bottom: 40px;
		}
		.left input {
		    border: none;
		    width: 80%;
		    margin: 15px 0px;
		    border-bottom: 1px solid #4f30677d;
		    padding: 7px 9px;
		    width: 100%;
		    overflow: hidden;
		    background: transparent;
		    font-weight: 600;
		    font-size: 14px;
		}
		.left{
		  background: linear-gradient(-45deg, #dcd7e0, #fff);
		}
		.submit {
		    border: none;
		    padding: 15px 70px;
		    border-radius: 8px;
		    display: block;
		    margin: auto;
		    margin-top: 120px;
		    background: #583672;
		    color: #fff;
		    font-weight: bold;
		    -webkit-box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
		    -moz-box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
		    box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
		}
		
		
		
		.right {
		  background: linear-gradient(212.38deg, rgba(242, 57, 127, 0.7) 0%, rgba(175, 70, 189, 0.71) 100%),url("${pageContext.request.contextPath}/resources/images/loginBackground.gif");
		  background-repeat: no-repeat;
		  color: #fff;
		  background-size: 100% 100%;
		}  
		
		.right .right-text{
		  height: 100%;
		  position: relative;
		  transform: translate(0%, 45%);
		}
		.right-text h2{
		  display: block;
		  width: 100%;
		  text-align: center;
		  font-size: 50px;
		  font-weight: 500;
		}
		.right-text h5{
		  display: block;
		  width: 100%;
		  text-align: center;
		  font-size: 19px;
		  font-weight: 400;
		}
		
		.right .right-inductor{
		  position: absolute;
		  width: 70px;
		  height: 7px;
		  background: #fff0;
		  left: 50%;
		  bottom: 70px;
		  transform: translate(-50%, 0%);
		}
		
		.top_link img {
		    width: 28px;
		    padding-right: 7px;
		    margin-top: -3px;
		}
		
		#bg-point {
			background: #FF5375;
			width: 300px; 
		}
	 
	</style>
</head>
<body>

<script type="text/javascript">
function sendLogin() {
    const f = document.loginForm;
	let str;
	
	str = f.empNo.value.trim();
    if(!str) {
        f.empNo.focus();
        return;
    }

    str = f.pwd.value.trim();
    if(!str) {
        f.pwd.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/employee/login";
    f.submit();
}
</script>

  <section class="login bg-main">    
    <div class="login_box">
      <div class="left"> 
        <div class="contact">
          <form name="loginForm" action="" method="post">
            <h3>SIGN IN</h3>
            <input type="text" name="empNo" placeholder="empNo">
            <input type="password" name="pwd" placeholder="pwd">
            <button type="button" class="btn text-white" id="bg-point" onclick="sendLogin();">&nbsp;Login&nbsp;</button> 
          </form>   
        </div>
      </div>
      <div class="right">
        <div class="right-text"> 
          <h2>DASH</h2>
          <h5>Operation Solution Program</h5>
        </div> 
        <div class="right-inductor"></div> 
      </div>
    </div>
  </section>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>