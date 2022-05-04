<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap');
	
	* {
	margin:0;
	}
	a{
	display:inline-block;
	text-decoration:none;
	color:#555555;
	}
	header {
	overflow:hidden;
	font-family: 'Sunflower', sans-serif;
	font-size:1.3em;
	font-weight:bold;
	margin:0 auto;
	}
	
	#first-banner {
	height:70px;
	line-height:70px;
	border-bottom: 1px solid #cccccc;
	overflow:hidden;
	}
	#first-banner .menu-icon {
	width:50px;
	height:50px;
	display:inline-block;
	margin:auto;
	padding:10px;;
	}
	#first-banner .login {
	float:right;
	}

	}
</style>
</head>
<body>
<header>
		<div class="menu-icon">
			<a href="menu.jsp"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/220px-Hamburger_icon.svg.png" alt="menu" title="menu"/></a>
		</div>
		
		<div class='login'>
			<a href="login.jsp" style="width:100px; height:40px; line-height:40px; text-align:center; border:3px solid black; border-radius:40px; margin-right:10px; color:black">로그인</a>
			<a href="register.jsp" style="margin-right:10px; font-size:0.8em; font-weight:normal;">회원가입</a>
		</div>
	
</header>
<script type="text/javascript" src="headerScript.js"></script>
</body>
</html>