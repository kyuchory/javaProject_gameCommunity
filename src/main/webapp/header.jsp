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


	#banner {
	line-height:100px;
	
	}
	#banner .main-menu {
	-webkit-padding-start:0px;
	overflow:hidden;
	}
	#banner .main-menu li{
	width:200px;
	float:right;
	text-align:center;
	list-style:none;
	right:0;
	}
	#banner .main-menu li:first-child{
	height:80px;
	float:left;
	}
	#banner .main-menu li a{
	display:block;
	}
	#banner .main-menu li a:hover {
	text-decoration:underline;
	font-weight:bold;
	}
	#banner .slide-menu {
	display:none;  /*마우스 오버 시 보이게*/
	font-size:0.7em;
	line-height:30px;
	position:absolute;
	background:white;
	border-radius:0 0 10px 10px;
	z-index:1;
	opacity:0.9;
	right:0;
	}
	#banner .slide-menu li{
	width:200px;
	float:right;
	text-align:center;
	list-style:none;
	}
	#banner .slide-menu a {
	color:black;
	}
	#banner .slide-menu a:hover{
	text-decoration:underline;
	
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
	<div id="banner">
		<ul class='main-menu'>
			<li><a href="index.jsp"><img src="https://www.dankook.ac.kr/html_repositories/images/www/kor_content/est_ui_int01.jpg" alt="dankook-logo"/></a></li>
			<li><a href="#none">게임추천</a></li>
			<li><a href="#none">커뮤니티</a></li>
			<li><a href="#none">게임소식</a></li>
			<li><a href="#none">프로필</a></li>
		</ul>
		<ul class='slide-menu'>
			<li>
				<ul class='inner-ul'>
					<li><a href="#none">카테고리별</a></li>
					<li><a href="#none">사용자별 추천</a></li>
				</ul>
			</li>
			<li>
				<ul class='inner-ul'>
					<li><a href="#none">자유게시판</a></li>
					<li><a href="#none">공략&팁</a></li>
					<li><a href="#none">질문</a></li>
					<li><a href="#none">추천</a></li>
				</ul>
			</li><li>
				<ul class='inner-ul'>
					<li><a href="#none">게임뉴스</a></li>
					<li><a href="#none">패치정보</a></li>
				</ul>
			</li><li>
				<ul class='inner-ul'>
					<li><a href="#none">출석체크</a></li>
					<li><a href="#none">회원정보</a></li>
				</ul>
			</li>
		</ul>
	</div>
</header>
<script>
	const banner = document.getElementById("banner");
	const slideMenu = document.querySelector(".slide-menu");
	
	function openNav() {
		    document.getElementById("mySidenav").style.width = "250px";
		}	
	function closeNav() {
	    document.getElementById("mySidenav").style.width = "0";
	}
	
	
	banner.addEventListener("mouseover", function(){
	    slideMenu.style.display="block";
	});
	
	banner.addEventListener("mouseout", function(){
	    slideMenu.style.display="none";
	});
</script>
</body>
</html>