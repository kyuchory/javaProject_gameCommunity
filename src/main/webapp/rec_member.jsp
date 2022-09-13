<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="dto.*"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="rec_rec.css?after" rel="stylesheet" type="text/css">
</head>
<body>
<%
   String email = (String)session.getAttribute("email");
	if(email==null){response.sendRedirect("login_login.jsp");}
	Member_rec member = new Member_rec();
   if(email == null){
      response.sendRedirect("login_login.jsp");}
	Connection conn = ConnectionProvider.getConnection();
     // MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);
	GameDaoImpl gameDaoImpl = new GameDaoImpl(conn);
     // Member member = memberDaoImpl.select(email);
	member= gameDaoImpl.selectByEmail(email);
   List<Game> list = gameDaoImpl.select_rec(member.getGenre(), member.getPay(),member.getAge(),member.getGraphic());
   int i=0;
      %>
<jsp:include page="header_header.jsp"/>
<jsp:include page="main_banner.jsp"/>
<section style="background-color:#eeeeee;height:700px;">
<div style="height:20px"></div>
<h1 style="text-align:center;margin:30px;font-size:40px;">사용자별 추천게임</h1>
	<div style="width:80%;margin:auto;display:flex;justify-content:space-between;height:400px">
<%for(Game g : list){
	if(i>=4){break;}
	i+=1;
	%>

<div class='rec_game'>
				<div class="rec_game_top">
					<div class="rec_game_percent">&#x2665;%</div>
					<div class="rec_game_rank">Best<br><span style="font-size:30px;"><%=i%></span></div>
				</div>
				<div class="rec_game_img"><img style="width:200px;height:200px"src="<%=g.getImg()%>"></div>
				<div class="rec_game_name"><%=g.getName() %></div>
				<div class="rec_game_detail">
					<span><%=g.getCompany()%></span>
					&nbsp;&nbsp;|&nbsp;&nbsp;<span><%=g.getGenre()%>&nbsp;&nbsp;</span>
				</div>
				<button class="rec_game_button" type="button" onclick="location.href='https://search.naver.com/search.naver?query=<%=g.getName()%>'">게임 바로가기</button>
</div>
<%} %>
</div>
</section>
<jsp:include page="header_footer.jsp" />
</body>
</html>