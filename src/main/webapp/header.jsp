<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<!-- link href="headerCss.css" rel="stylesheet" type="text/css" -->
	
<style>
	@import url('https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap');
	
	* {
	margin:0;
	}
	a{
	display:inline-block;
	text-decoration:none;
	color:black;
	}
	img {
	width:100%;
    height:100%;
    object-fit:cover;
	}
	
	header {
	overflow:hidden;
	font-family: sans-serif;
	font-size:1.3em;
	font-weight:bold;
	margin:0 auto;
	}
	
	#mySidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 2;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
    text-align:left;
	}
	#mySidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
	}
	#mySidenav a:hover {
	    color: #f1f1f1;
	}
	#mySidenav .closebtn {
	    position: absolute;
	    top: 5px;
	    left: -75px;
	    font-size: 36px;
	    margin-left: 50px;
	}
	.border_bottom{
		border-bottom:1px solid gray;
		height:70px;
		line-height:70px;
	}
	.border_bottom .menu2:hover{
		opacity: 0.5;
	}
	.border_bottom .login1{
		overflow:hidden;
		font-family: sans-serif;
		font-size:1.3em;
		font-weight:bold;
		margin:0 auto;
	}
	
	@media screen and (max-height: 450px) {
	  .sidenav {padding-top: 15px;}
	  .sidenav a {font-size: 18px;}
	}


	
</style>
</head>
<body>
<header>
	<div id="mySidenav" class="sidenav" >
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  <a href="#">프로필</a>
	  <a href="#">게임소식</a>
	  <a href="#">커뮤니티</a>
	  <a href="#">게임추천</a>
	</div>
	<div class="border_bottom">
		<span class="menu2" style="font-size:30px;cursor:pointer;" onclick="openNav()">&#9776;</span>
		<span>
			<a href="main.jsp" style="font-family: arial;color:black;font-size:30px;">DKU</a>
		</span>
		<div class='login1'style="float:right">
			<a href="login.jsp" style="width:100px; height:40px; line-height:40px; text-align:center; border:3px solid black; border-radius:40px; margin-right:10px; color:black">로그인</a>
			<a href="signUp.jsp" style="margin-right:10px; font-size:0.8em; font-weight:normal;">회원가입</a>
		</div>
	</div>
	
</header>
<script>	
	function openNav() {
		    document.getElementById("mySidenav").style.width = "250px";
		}	
	function closeNav() {
	    document.getElementById("mySidenav").style.width = "0";
	}	
	
</script>
</body>
</html>