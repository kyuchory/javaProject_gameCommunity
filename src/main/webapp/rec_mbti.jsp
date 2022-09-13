<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.GameDaoImpl" %>
<%@ page import="dto.Game" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="jdbc.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="rec_rec.css?after" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="header_header.jsp" />
<jsp:include page="main_banner.jsp" />
<section style="background-color:#eeeeee;height:700px;">
<div style="height:20px"></div>
<%String e1 = request.getParameter("e");
String n1 = request.getParameter("n");
String t1 = request.getParameter("t");
String j1 = request.getParameter("j");

String myMbti = (e1+n1+t1+j1).toUpperCase();
	Connection conn = ConnectionProvider.getConnection();
	GameDaoImpl gameDaoImpl = new GameDaoImpl(conn);
	List<Game> game = gameDaoImpl.selectList();
	Game gameR = null;
	int eVal = 0;
	int nVal = 0;
	int tVal = 0;
	int jVal = 0;
	int val[] = new int[100];
	int i=0;
	int index=0;
	%>
	<h1 style="text-align:center;margin:30px;font-size:40px;"><%=myMbti %>추천게임</h1>
	<div style="width:80%;margin:auto;display:flex;justify-content:space-between;height:400px">
	<%
	
	for(Game g :game){
		
		if(String.valueOf(myMbti.charAt(0)).equals("E")){
			eVal = Integer.parseInt(g.getE());
		}
		else{
			eVal = 6-Integer.parseInt(g.getE());
			}
		
		if(String.valueOf(myMbti.charAt(1)).equals("N")){
			nVal = Integer.parseInt(g.getN());
		}
		else{nVal = 6-Integer.parseInt(g.getN());}
		
		if(String.valueOf(myMbti.charAt(2)).equals("T")){
			tVal = Integer.parseInt(g.getT());
		}
		else{tVal = 6-Integer.parseInt(g.getT());}
		
		if(String.valueOf(myMbti.charAt(3)).equals("J")){
			jVal = Integer.parseInt(g.getJ());
		}
		else{jVal = 6-Integer.parseInt(g.getJ());}
		i++;
		val[i]=(eVal*5+nVal*5+tVal*5+jVal*5)*11/10;
		if(i<10){val[i]+=10;}
	}
	for(int j=1; j< 5 ;j++){
		int tmp=0;
		for(int k = 1; k<51;k++){
			if(val[k]>tmp){
				tmp=val[k];
				index=k;
				
			}
		}
		gameR = gameDaoImpl.select(index);
		

		%>
		
			<div class='rec_game'>
				<div class="rec_game_top">
					<div class="rec_game_percent">&#x2665;<%=val[index]%>%</div>
					<div class="rec_game_rank">Best<br><span style="font-size:30px;"><%=j%></span></div>
				</div>
				<div class="rec_game_img"><img style="width:200px;height:200px"src="<%=gameR.getImg()%>"></div>
				<div class="rec_game_name"><%=gameR.getName() %></div>
				<div class="rec_game_detail">
					<span><%=gameR.getCompany()%></span>
					&nbsp;|&nbsp;&nbsp;<span><%=gameR.getGenre()%>&nbsp;&nbsp;</span>
				</div>
				<button class="rec_game_button" type="button" onclick="location.href='https://search.naver.com/search.naver?query=<%=gameR.getName()%>'">게임 바로가기</button>
				
			</div>
		
	<%
	val[index]=50;
	}
%>
</div>
</section>
<jsp:include page="header_footer.jsp" />
</body>
</html>