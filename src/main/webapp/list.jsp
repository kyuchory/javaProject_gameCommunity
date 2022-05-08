<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.jsoup.*" %>
<%@ page import="org.jsoup.nodes.*" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@page import="dto.*" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main section</title>
<style>

</style>
	<link href="listStyle.css" rel="stylesheet" type="text/css" >
</head>
<body>
<%@ include file="crawler/ranking.jsp" %>

<jsp:include page="banner.jsp" />

<section style="background:#eeeeee;">
	<div id="profile">
      <div class="title">프로필</div>
      <div class="attendance">
         <a href="none">출석체크</a>
         <p>현재 출석 포인트 : <span class="current-point">0</span></p>
      </div>
      <div class="information">
         <div class="status">
            <p><span class='id'>${id}</span>님 안녕하세요.</p>
            <a href="/login_or_logout.do?log_mode=${login_out}">${login_out}logout</a>
         </div>
         <ul class="information-details">
            <li><a href="none">회원정보</a></li>
            <li><a href="none">나의 게임 정보</a></li>
            <li><a href="none">작성글</a></li>
            <li><a href="none">댓글</a></li>
         </ul>
      </div>
   </div>
	<div id="contents">
		<div id="first-box" class="box">
			<div>
				<table class="main_gameRank_table">
				<caption>게임순위</caption>
				<tr class="main_gameRank_thread">
					<td>순위</td>
					<td colspan="2">게임명</td>
				</tr>
				<%!int i = 0; %>
				<%for(GameRank g: game){
					out.print(String.format(
						"<tr class='main_gameRank_border'>"+
							"<td class='main_gameRank_ranking'>%d&nbsp</td>"+
							"<td class='main_gameRank_img'><img width='75px' height='46px' src='%s'></td>"+
							"<td class='main_gameRank_gameName'>"+
								"<a class='game-name' href='https://search.naver.com/search.naver?query=%s'>%s</a>"+
								"<div class='main_gameRank_att'>"+
									"<span>%s</span>&nbsp&nbsp|&nbsp&nbsp"+
									"<span>%s&nbsp&nbsp</span>"+
									"<span>%s</span>"+			
								"</div>"+
						"</tr>",g.getRank(), g.getImg(), g.getName(), g.getName(), g.getCompany(), g.getGenre(), g.getPayment()));
				//i++; if(i >= 10) {break;}
				} %>
				</table>
			</div>
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