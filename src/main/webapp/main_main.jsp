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
	<link href="main_main.css" rel="stylesheet" type="text/css" >
</head>
<body>
<%@ include file="crawler/ranking.jsp" %>
<%@ include file="crawler/gameNews.jsp" %>

<jsp:include page="main_header.jsp" />

<section style="background:#eeeeee;">
	
	<div id="contents">
		<div id="profile">
	      <div class="title">Profile</div>
	      <div class="attendance">
	         <a href="none">출석체크</a>
	         <p>현재 출석 포인트 : <span class="current-point">0</span></p>
	      </div>
	      <div class="information">
	         <div class="status">
	            <p><span class='id'>${id}</span>님 안녕하세요.</p>
	            <a href="/login_or_logout.do?log_mode=${login_out}">${login_out}로그아웃</a>
	         </div>
	         <ul class="information-details">
	            <li><a href="none">회원정보</a></li>
	            <li><a href="none">나의 게임 정보</a></li>
	            <li><a href="none">작성글</a></li>
	            <li><a href="none">댓글</a></li>
	         </ul>
	      </div>
	   </div>
	   
		<div id="first-box" class="box">
			<div>
				<table class="main_gameRank_table">
				<caption>게임순위</caption>
				
				<%!int j = 0; %>
				<%
				for(gameRanking g: game){
						if (j++ < 10) {
						out.print(String.format(
							"<tr class='main_gameRank_border'>"+
								"<td class='main_gameRank_ranking'>%d&nbsp</td>"+
								"<td class='main_gameRank_img'><img width='50px' height='30px' src='%s'></td>"+
								"<td class='main_gameRank_gameName'>"+
									"<a class='game-name' href='https://search.naver.com/search.naver?query=%s'>%s</a>"+
									"<div class='main_gameRank_att'>"+
										"<span>%s</span>&nbsp&nbsp|&nbsp&nbsp"+
										"<span>%s&nbsp&nbsp</span>"+
										"<span>%s</span>"+			
									"%d</div>"+
							"</tr>",g.getRank(), g.getImg(), g.getName(), g.getName(), g.getCompany(), g.getGenre(), g.getPayment(), i));
						}
						else {j = 0; break;}
					}
				%>
				</table>
			</div>
		</div>
		
		<div id="second-box" class="box">
			<div class="main-title">게임소식</div>
			<%!int h = 0; %>
				<%
				for(gameNews g: gamen){
					if (h++ < 6) {
					out.print(String.format(
						"<div class='mySlides fade2'>"+
							"<a href='comm_news_view.jsp?g=%s' target='blank'>"+
							"<div class='news-title'>%s</div>"+
							"<div class='image-frame'><img src='%s'/></div>"+
								"<div class='news-summary'>%s</div>"+
								"<div class='news-info'>%s</div>"+
						"</a></div>",g.getUrl(), g.getTitle(), g.getImage(), g.getSummary(), g.getInfo()));
					}
					else {h = 0; break;}
				}
				%>
			
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
			<ul class="best-game">			
			<%!int k = 0; %>
				<%
				for(gameRanking g: game){
					if (k++ < 5) {
					out.print(String.format(
							"<li class='best-game-list'>"+	
								"<div class='game-rank'>Best<br>%d</div>"+
								"<div class='game-image'><img src='%s'></div>"+
								"<div class='game-name'>%s</div>"+
								"<div class='game-genre'><span>%s</span>&nbsp&nbsp|&nbsp&nbsp"+
								"<span>%s&nbsp&nbsp</span></div>"+
								"<a href='https://search.naver.com/search.naver?query=%s' target='_blank'>게임 바로가기</a>"+
							"</li>",g.getRank(), g.getImg(), g.getName(), g.getCompany(), g.getGenre(), g.getName(), i));
					}
					else {k = 0; break;}
				}
				%>
				</ul>
		</div>
		<div id="fourth-box" class="box">
			<div class="board_header">자유게시판</div>
		</div>
		<div id="fifth-box" class="box">
			<div class="board_header">추천게시판</div>
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
		var dots = document.getElementsByClassName("main_dot");
		if (n > slides.length) {slideIndex = 1}
		if (n < 1) {slideIndex = slides.length}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex-1].style.display = "block";
		dots[slideIndex].className += " active";
	}
</script>
</body>
</html>