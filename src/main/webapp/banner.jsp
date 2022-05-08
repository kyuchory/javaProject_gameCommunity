<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#banner {
line-height:100px;
text-align:center;
overflow:hidden;
height:100px;
}
#banner>a {
position:absolute;
left:0;
}
#banner>a>img{
height:50px;

}
#banner .main-menu {
-webkit-padding-start:0px;
overflow:hidden;
display:inline-block;
}
#banner .main-menu li{
width:200px;
float:left;
text-align:center;
list-style:none;
font-size:1.5em;
right:0;
}
#banner .main-menu li a{
display:block;
}
#banner .main-menu li a:hover {
text-decoration:underline;
font-weight:bold;
}
#banner .slide-menu {
width:100%;
position:absolute;
display:none;  /*마우스 오버 시 보이게*/
font-size:1.2em;
line-height:50px;
border-radius:0 0 10px 10px;
z-index:1;
opacity:0.9;
text-align:center;
top:170px;
}
#banner .slide-menu>ul {
display:inline-block;
-webkit-padding-start:0px;
background:white;
}
#banner .slide-menu li{
width:200px;
float:left;
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
<div id="banner">
	<a href="index.jsp"><img src="https://www.dankook.ac.kr/html_repositories/images/www/kor_content/est_ui_int01.jpg" alt="dankook-logo"/></a>
	<ul class='main-menu'>
		<li><a href="#none">게임추천</a></li>
		<li><a href="#none">커뮤니티</a></li>
		<li><a href="#none">게임소식</a></li>
		<li><a href="#none">프로필</a></li>
	</ul>
	<div class='slide-menu'>
		<ul>
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
</div>
<script>
	const banner = document.getElementById("banner");
	const slideMenu = document.querySelector(".slide-menu");
	banner.addEventListener("mouseover", function(){
	    slideMenu.style.display="block";
	});
	
	banner.addEventListener("mouseout", function(){
	    slideMenu.style.display="none";
	});
</script>
</body>
</html>