<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="jdbc.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.*"%>
<%@ page import="dto.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = ConnectionProvider.getConnection();
	//db와 커넥션
	GameDaoImpl gameDaoImpl = new GameDaoImpl(conn);
	
	String genres[] = request.getParameterValues("genre");
	List<Game> list = new ArrayList<>();
	
	for(String genre:genres){
		if (genre.equals("all")) {
			list = gameDaoImpl.selectList();
			break;
		}
		if (genre.equals("AOS")) {
			List<Game> selectedList = gameDaoImpl.selectListGenre("AOS");
			list.addAll(selectedList);
		}
		if (genre.equals("RPG")) {
			List<Game> selectedList = gameDaoImpl.selectListGenre("RPG");
			list.addAll(selectedList);
		}
		if (genre.equals("FPS")) {
			List<Game> selectedList = gameDaoImpl.selectListGenre("FPS");
			list.addAll(selectedList);
		}
		if (genre.equals("action")) {
			List<Game> selectedList = gameDaoImpl.selectListGenre("액션");
			list.addAll(selectedList);
		}
		if (genre.equals("simulation")) {
			List<Game> selectedList = gameDaoImpl.selectListGenre("전략시뮬");
			list.addAll(selectedList);
		}
		if (genre.equals("sport")) {
			List<Game> selectedList = gameDaoImpl.selectListGenre("스포츠, 레이싱");
			list.addAll(selectedList);
		}
	}
	session.setAttribute("gameList", list);
	response.sendRedirect("game_list.jsp");
%>
</body>
</html>