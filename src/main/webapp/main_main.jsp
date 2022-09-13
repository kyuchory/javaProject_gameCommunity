<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.jsoup.*"%>
<%@ page import="org.jsoup.nodes.*"%>
<%@ page import="org.jsoup.select.Elements"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.*"%>
<%@ page import="dto.*"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main section</title>
<style>
</style>

<link href="main_main.css?after" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	String emailSession = (String) session.getAttribute("email");

	//DB받아오기
	Connection conn = ConnectionProvider.getConnection();
	CommunityDaoImpl communityDaoImpl = new CommunityDaoImpl(conn);
	CommunityRecommendDaoImpl communityRecommendDaoImpl = new CommunityRecommendDaoImpl(conn);
	MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);

	int freeCount = communityDaoImpl.getCount();
	int recommendCount = communityRecommendDaoImpl.getCount();

	List<Community> freeList = null;
	List<Community> recommendList = null;
	if (freeCount > 0) {
		freeList = communityDaoImpl.getList(freeCount - 9, freeCount);
	}
	if (recommendCount > 0) {
		recommendList = communityRecommendDaoImpl.getList(recommendCount - 9, recommendCount);
	}

	Member memberMain = null;
	String nameMain = null;
	if (emailSession != null) {
		memberMain = memberDaoImpl.select(emailSession);
		nameMain = memberMain.getName();
	}
	%>


	<%@ include file="ranking.jsp"%>
	<%@ include file="gameNews.jsp"%>

	<jsp:include page="main_banner.jsp" />

	<section style="background: #eeeeee;">

		<div id="contents">
			<%
			if (emailSession != null) {
			%>
			<div id="profile">
				<div class="title">Profile</div>
				<div class="attendance">
					<a href="checkAttendanceProcess.jsp">출석체크</a>
					<p>
						현재 출석 포인트 : <span class="current-point">0</span>
					</p>
				</div>
				<div class="information">
					<div class="status">
						<br>
						<p>
							<span class='id'><%=nameMain%></span>님 안녕하세요.
						</p>

						<a href="login_logoutProcess.jsp">로그아웃</a>
					</div>
					<ul class="information-details">
						<li><a href="profile_mypage.jsp">회원정보</a></li>
						<li><a href="none">나의 게임 정보</a></li>
						<li><a href="none">작성글</a></li>
					</ul>
				</div>
			</div>
			<%
			} else {
			%>
			<div id="profile">
				<div class="title">Profile</div>
				<div class="attendance">
					<a href="checkAttendanceProcess.jsp">출석체크</a>
					<p>
						<span class="current-point">로그인이 필요합니다</span>
					</p>
				</div>
				<div class="information">
					<div class="status">
						<p style="margin-top: 50px;">
							<span class='id'>로그인이 필요합니다</span>
						</p>
					</div>
					<div class="login-button" style="margin: 20px;">
						<a href="login_login.jsp"
							style="width: 100px; height: 40px; line-height: 40px; text-align: center; border: 3px solid black; border-radius: 40px; margin-right: 10px; color: white">로그인</a>
					</div>
					<div class="register-button">
						<a href="login_signUp.jsp"
							style="width: 100px; height: 40px; line-height: 40px; text-align: center; border: 3px solid black; border-radius: 40px; margin-right: 10px; color: white">회원가입</a>
					</div>
				</div>
			</div>
			<%
			}
			%>
			<div id="first-box" class="box">
				<div>
					<table class="main_gameRank_table">
						<caption>게임순위</caption>

						<%!int j = 0;%>
						<%
						for (gameRanking g : game) {
							if (j++ < 10) {
								out.print(String.format(
								"<tr class='main_gameRank_border'>" + "<td class='main_gameRank_ranking'>%d&nbsp</td>"
										+ "<td class='main_gameRank_img'><img width='50px' height='30px' src='%s'></td>"
										+ "<td class='main_gameRank_gameName'>"
										+ "<a class='game-name' href='https://search.naver.com/search.naver?query=%s'>%s</a>"
										+ "<div class='main_gameRank_att'>" + "<span>%s</span>&nbsp&nbsp|&nbsp&nbsp"
										+ "<span>%s&nbsp&nbsp</span>" + "<span>%s</span>" + "</div>" + "</tr>",
								g.getRank(), g.getImg(), g.getName(), g.getName(), g.getCompany(), g.getGenre(), g.getPayment()));
							} else {
								j = 0;
								break;
							}
						}
						%>
					</table>
				</div>
			</div>

			<div id="second-box" class="box">
				<div class="main-title">게임소식</div>
				<%!int h = 0;%>
				<%
				for (gameNews g : gamen) {
					if (h++ < 6) {
						out.print(String.format(
						"<div class='mySlides fade2'>" + "<a href='comm_news_view.jsp?g=%s' target='blank'>"
								+ "<div class='news-title'>%s</div>" + "<div class='image-frame'><img src='%s'/></div>"
								+ "<div class='news-summary'>%s</div>" + "<div class='news-info'>%s</div>" + "</a></div>",
						g.getUrl(), g.getTitle(), g.getImage(), g.getSummary(), g.getInfo()));
					} else {
						h = 0;
						break;
					}
				}
				%>

				<table class="main_selector">
					<tr>
						<th style="border-left: none">
							<button type="button" class="main_dot" onclick="plusSlides(-1)"
								style="color: gray; font-weight: bold; border-radius: 0 0 0 9px/0 0 0 9px">&lt;</button>
						</th>
						<c:forEach var="i" begin="1" end="6">
						<th>
							<button type="button" class="main_dot" onclick="currentSlide(${i})">${i}</button>
						</th>
						</c:forEach>
						
						<th>
							<button type="button" class="main_dot" onclick="plusSlides(1)"
								style="color: gray; font-weight: bold; border-radius: 0 0 9px 0/0 0 9px 0">&gt;</button>
						</th>
					</tr>
				</table>
			</div>

			<div id="third-box" class="box">
				<ul class="best-game">
					<%!int k = 0;%>
					<%
					for (gameRanking g : game) {
						if (k++ < 5) {
							out.print(String.format("<li class='best-game-list'>" + "<div class='game-rank'>Best<br>%d</div>"
							+ "<div class='game-image'><img src='%s'></div>" + "<div class='game-name'>%s</div>"
							+ "<div class='game-genre'><span>%s</span>&nbsp&nbsp|&nbsp&nbsp" + "<span>%s&nbsp&nbsp</span></div>"
							+ "<a href='https://search.naver.com/search.naver?query=%s' target='_blank'>게임 바로가기</a>" + "</li>",
							g.getRank(), g.getImg(), g.getName(), g.getCompany(), g.getGenre(), g.getName(), i));
						} else {
							k = 0;
							break;
						}
					}
					%>
				</ul>
			</div>
			<div id="fourth-box" class="box">
				<div class="board_header">자유게시판 최신글</div>
				<table class="main_comm_table">
					<tr class="main_comm_table_head">
						<th class="main_comm_thead">제목</th>
						<th class="main_comm_table_space"></th>
						<th class="main_comm_thead">작성자(email)</th>
						<th class="main_comm_table_space"></th>
						<th class="main_comm_thead">작성일</th>

					</tr>
					<%
					if (freeCount < 10) {
					%>
					<tr>
						<td>데이터가 부족합니다.</td>

					</tr>
					<%
					} else {
					for (int k = 0; k < freeList.size(); k++) {
						Community board = freeList.get(k);
						String email = board.getEmail();
						Member member = memberDaoImpl.select(email);
						String name = member.getName();
						String level = member.printLevelImage();
					%>

					<tr>
						<td class="main_comm_tbody"><a
							href="comm_free_view.jsp?num=<%=board.getNum()%>"><%=board.getSubject()%></a></td>
						<td class="main_comm_table_space"></td>
						<td class="main_comm_tbody"><img src="image/<%=level %>" style="width:18px; height:18px"/><%=name%>(<%=board.getEmail()%>)</td>
						<td class="main_comm_table_space"></td>
						<td class="main_comm_tbody"><%=board.getRegisterDateTime()%></td>
					</tr>
					<%
					}
					}
					%>
				</table>
			</div>
			<div id="fifth-box" class="box">
				<div class="board_header">추천게시판 최신글</div>
				<table class="main_comm_table">
					<tr class="main_comm_table_head">
						<th class="main_comm_thead">제목</th>
						<th class="main_comm_table_space"></th>
						<th class="main_comm_thead">작성자(email)</th>
						<th class="main_comm_table_space"></th>
						<th class="main_comm_thead">작성일</th>

					</tr>
					<%
					if (recommendCount < 10) {
					%>
					<tr>
						<td>데이터가 부족합니다.</td>

					</tr>
					<%
					} else {
					for (int k = 0; k < freeList.size(); k++) {
						Community board = recommendList.get(k);
						String email = board.getEmail();
						Member member = memberDaoImpl.select(email);
						String name = member.getName();
						String level = member.printLevelImage();
					%>

					<tr>
						<td class="main_comm_tbody"><a
							href="comm_recommend_view.jsp?num=<%=board.getNum()%>"><%=board.getSubject()%></a></td>
						<td class="main_comm_table_space"></td>
						<td class="main_comm_tbody"><img src="image/<%=level %>" style="width:18px; height:18px"/><%=name%>(<%=board.getEmail()%>)</td>
						<td class="main_comm_table_space"></td>
						<td class="main_comm_tbody"><%=board.getRegisterDateTime()%></td>
					</tr>
					<%
					}
					}
					%>
				</table>
			</div>
		</div>
	</section>
	<script>
		var slideIndex = 1;
		showSlides(slideIndex);
		document.getElementById("index").value=slideIndex;//현재 index 받아오기
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
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
		}
	</script>
</body>
</html>