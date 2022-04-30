<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main section</title>
	<!-- link href="listCss.css" rel="stylesheet" type="text/css" -->
<style>
	section {
	margin:0 auto;
	box-sizing:border-box;
	padding-bottom:20px;
	}
	#contents {
	width:1800px;
	margin:0 auto;
	overflow:hidden;
	}
	
	#profile{
	position:relative;
	float:right;
	width:350px;
	height:1000px;
	background:skyblue;
	margin:20px;
	border-radius:5px;
	text-align:center;
	}
	#profile .title{
	font-size:2em;
	border-bottom:1px solid #cccccc;
	background:#1e014f;
	border-radius: 5px 5px 0 0;
	color:white;
	height:70px;
	line-height:70px;
	}
	#profile .attendance{
	height:100px;
	background:white;
	}
	#profile .attendance a {
	width:200px;
	height:60px;
	line-height:60px;
	background:rgb(205, 196, 22);
	border-radius:60px;
	margin-top:8px;
	font-size:1.5em;
	}
	#profile .attendance a:hover {
	font-weight:bold;
	}
	#profile .information {
	margin-top:5px;
	height:400px;
	}
	#profile .information img{
	width:auto;
	height:auto;
	border-radius:200px;
	}
	#profile .information ul {
	list-style:none;
	overflow:hidden;
	text-align:center;
	}
	#profile .information ul li {
	float:left;
	height:40px;
	line-height:40px;
	width:120px;
	background:#cccccc;
	margin:5px;
	border-radius:5px;
	}
	#profile .information ul li a:hover {
	font-weight:bold;
	text-decoration:underline;
	}
	.box {
	float:left;
	margin:20px 0 0 20px;
	background:white;
	border-radius:5px;
	}
	
	
	#first-box {
	height:400px;
	width:400px;
	}
	
	
	
	#second-box {
	height:400px;
	width:960px;
	box-sizing:border-box;
	top:-25px;
	}
	.slideshow-container {
	width: 100%;
	height: 300px;
	position: static;
	margin: 0px;
	}
	.main_slideImg{
	width: 100%; 
	height: 300px; 
	top : 90px;
	margin:0;
	padding:0;
	}
	.main_slide_header{
	height:30px;
	padding:5px;
	}
	.main_title{
	margin-top:10px;
	margin:auto;
	display:inline-block;
	vertical-align:middle;
	font-size:25px;	
	}
	.main_prev, .main_next {
	 cursor: pointer;
	 transition: 0.6s ease;
	 margin:0;
	 padding:0;
	 width:100%;
	 height:100%;
	}
	.main_prev:hover, .main_next:hover{
	background-color: #717171;
	}
	.news{
	width:760px;
	height:412px;
	margin:auto;
	border-radius:10px;
	}
	.main_dot {
	 cursor:pointer;
	 background-color: #ffffff;
	 display: inline-block;
	 transition: background-color 0.6s ease;
	 margin:0;
	 padding:0;
	 width:100%;
	 height:100%;
	 border:0;
	 font-size:18px;
	}
	.main_selector{
	margin:auto;
	width:100%;
	height:60px;
	padding:0;
	border:0;
	border-spacing:0;
	}
	th{
	padding:2px;
	margin:0;
	border-left:1px solid #c0c0c0;
	}
	tr{
	padding:0;
	margin:0;
	}
	active, .main_dot:hover {
	  background-color: #717171;
	}
	
	
	#third-box {
	height:500px;
	width:1385px;
	}
	.main_list_object{
	height:400px;
	width:300px;
	background-color:white;
	margin:20px;
	display:inline;
	float:left;
	}
	.main_list_user{
		color:#c84a4c;
	}
	.main_list_rank{
		float:right;
		background-color:#c6282c;
		color:white;
		height:60px;
		width:53px;
		text-align:center;
	}
	.main_list_gameImg{
		text-align:center;
		margin-top:50px;
		height:250px;
	}
	.main_list_gameName{
		text-align:center;
	}
	.main_list_link{
		width:100%;
		height:50px;
		line-height:50px;
		background-color:#f0c098;
		text-align:center;
		vertical-align:middle;
		color:black;
		font-size:20px;
		font-weight:bold;
	}
	
	
	#fourth-box {
	height:300px;
	width:1185px;

	}
	#first-box {
	
	}
	#first-box .game-rank {
	margin:10px auto;
	list-style:none;
	-webkit-padding-start:0px;
	text-align:center;
	}
	#first-box .game-rank span {
	display:inline-block;
	}
	#first-box .game-rank li {
	height:35px;
	box-sizing:border-box;
	}
	#first-box .game-rank li:first-child {
	font-weight:bold;
	font-size:1.3em;
	}		
	#first-box .game-rank li a:hover{
	background:#cccccc;
	}
	#first-box .game-rank li span{
	border-bottom:1px solid #cccccc;
	}
	#first-box .game-rank .rank-first {
	width:60px;
	background:skyblue;
	}
	#first-box .game-rank .rank-second {
	width:250px;
	}
	#first-box .game-rank .rank-third {
	width:70px;
	}

</style>
</head>
<body>
<section style="background:#eeeeee;">
<div id="contents">
	<div id="profile">
		<div class="title">프로필</div>
		<div class="attendance">
			<a href="none">출석체크</a>
			<p>현재 출석 포인트 : <span class="current-point">0</span></p>
		</div>
		<div class="information">
			<img class="profile-image" src="data:image/png;base64,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" />
			<ul class="information-details">
				<li><a href="none">회원정보</a></li>
				<li><a href="none">나의 게임 정보</a></li>
				<li><a href="none">작성글</a></li>
				<li><a href="none">댓글</a></li>
			</ul>
		</div>
	</div>
	<div id="first-box" class="box">
		<ul class="game-rank">
			<li><span class="rank-first" style="background:none;">순위</span><span class="rank-second">게임 순위</span><span class="rank-third">정보</span></li>
			<li><a href="#"><span class="rank-first">1</span><span class="rank-second">리그 오브 레전드</span><span class="rank-third">+</span></a></li>
			<li><a href="#"><span class="rank-first">2</span><span class="rank-second">로스트 아크</span><span class="rank-third">+</span></a></li>
			<li><a href="#"><span class="rank-first">3</span><span class="rank-second">피파 온라인4</span><span class="rank-third">+</span></a></li>
			<li><a href="#"><span class="rank-first">4</span><span class="rank-second">발로란트</span><span class="rank-third">+</span></a></li>
			<li><a href="#"><span class="rank-first">5</span><span class="rank-second">배틀 그라운드</span><span class="rank-third">+</span></a></li>
			<li><a href="#"><span class="rank-first">6</span><span class="rank-second">서든어택</span><span class="rank-third">+</span></a></li>
			<li><a href="#"><span class="rank-first">7</span><span class="rank-second">오버워치</span><span class="rank-third">+</span></a></li>
			<li><a href="#"><span class="rank-first">8</span><span class="rank-second">던전앤파이터</span><span class="rank-third">+</span></a></li>
			<li><a href="#"><span class="rank-first">9</span><span class="rank-second">메이플 스토리</span><span class="rank-third">+</span></a></li>
			<li><a href="#"><span class="rank-first">10</span><span class="rank-second">스타 크래프트</span><span class="rank-third">+</span></a></li>
		</ul>
	</div>
	<div id="second-box" class="box">
		<div class="main_slide_header">
			<div class="main_title">게임소식</div>
			<div class="main_title" style="float:right">
				<a class="link_news" href="#">기사 목록 보기</a>
			</div>
		</div>
		<div class="slideshow-container">
			<div class="mySlides fade2">
				<a href="#">
					<img class="main_slideImg" src="1.jpg"/>
				</a>
			</div>
			<div class="mySlides fade2">
				<a href="#">
					<img class="main_slideImg" src="2.jpg"/>
				</a>
			</div>
			<div class="mySlides fade2">
				<a href="#">
					<img class="main_slideImg" src="3.jpg"/>
				</a>
			</div>
			<div class="mySlides fade2">
				<a href="#">
					<img class="main_slideImg" src="#"/>
				</a>
			</div>
			<div class="mySlides fade2">
				<a href="#">
					<img class="main_slideImg" src="#"/>
				</a>
			</div>
			<div class="mySlides fade2">
				<a href="#">
					<img class="main_slideImg" src="#"/>
				</a>
			</div>
		</div>
		<table class="main_selector">
			<tr>
				<th style="border-left:none">
					<button type="button" class="main_dot" onclick="plusSlides(-1)" style="color:gray;font-weight:bold;border-radius:0 0 0 9px/0 0 0 9px">&lt;</button>
				</th>
				<th>
					<button type="button" class="main_dot" onclick="currentSlide(1)">1</button> 
				</th>
				<th>
					<button type="button" class="main_dot" onclick="currentSlide(2)">2</button>
				</th>
				<th>
					<button type="button" class="main_dot" onclick="currentSlide(3)">3</button>
				</th>
				<th>
					<button type="button" class="main_dot" onclick="currentSlide(4)">4</button>
				</th>
				<th>
					<button type="button" class="main_dot" onclick="currentSlide(5)">5</button>
				</th>
				<th>
					<button type="button" class="main_dot" onclick="currentSlide(6)">6</button>
				</th>
				<th>
					<button type="button" class="main_dot" onclick="plusSlides(1)" style="color:gray;font-weight:bold;border-radius:0 0 9px 0/0 0 9px 0">&gt;</button>
				</th>
			</tr>
		</table>
	</div>
	<div id="third-box" class="box">
		<div class="main_list_object">
		<span class="main_list_user">♥300</span>
		<div class="main_list_rank">Best<br>
			<p style="display:inline;font-size:25px;margin:0">1</p>
		</div>
		<div class="main_list_gameImg">
			<img src="gameImg/1.jpg">
		</div>
		<div class="main_list_gameName">리그 오브 레전드<br>
			<p style="display:inline;color:#666693">장르 : AOS&nbsp;&nbsp; 부분유료화
		</div>
		<br>
		<div class="main_list_link" style="border-radius:10px;">
			<a href="#" style="color:black;">게임 보러가기</a>
		</div>
		</div>
		<div class="main_list_object">
			<span class="main_list_user">♥200</span>
			<div class="main_list_rank">Best<br>
				<p style="display:inline;font-size:25px;margin:0">2</p>
			</div>
			<div class="main_list_gameImg">
				<img src="gameImg/2.jpg">
			</div>
			<div class="main_list_gameName">로스트 아크<br>
				<p style="display:inline;color:#666693">장르 : MMORPG&nbsp;&nbsp; 부분유료화
			</div>
			<br>
			<div class="main_list_link" style="border-radius:10px;">
				<a href="#" style="color:black;">게임 보러가기</a>
			</div>
		</div>
		<div class="main_list_object">
			<span class="main_list_user">♥100</span>
			<div class="main_list_rank">Best<br>
				<p style="display:inline;font-size:25px;margin:0">3</p>
			</div>
			<div class="main_list_gameImg">
				<img src="gameImg/3.jpg">
			</div>
			<div class="main_list_gameName">피파 온라인 4<br>
				<p style="display:inline;color:#666693">장르 : 스포츠&nbsp;&nbsp; 부분유료화
			</div>
			<br>
			<div class="main_list_link" style="border-radius:10px;">
				<a href="#" style="color:black;">게임 보러가기</a>
			</div>
		</div>
		<div class="main_list_object">
			<span class="main_list_user">♥50</span>
			<div class="main_list_rank">Best<br>
				<p style="display:inline;font-size:25px;margin:0">4</p>
			</div>
			<div class="main_list_gameImg">
				<img src="gameImg/4.jpg">
			</div>
			<div class="main_list_gameName">발로란트<br>
				<p style="display:inline;color:#666693">장르 : FPS&nbsp;&nbsp; 무료
			</div>
			<br>
			<div class="main_list_link" style="border-radius:10px;">
				<a href="#" style="color:black;">게임 보러가기</a>
			</div>
		</div>
	</div>
	<div id="fourth-box" class="box">
		<div>
		</div>
	</div>
</div>
</section>
<script>
	var slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
		showSlides(slideIndex += n);
	}
	function currentSlide(n) {
		showSlides(slideIndex = n);
	}
	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		if (n > slides.length) {slideIndex = 1}
		if (n < 1) {slideIndex = slides.length}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex-1].style.display = "block";
		dots[slideIndex-1].className += " active";
	}
</script>
</body>
</html>