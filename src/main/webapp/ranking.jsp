<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.jsoup.*" %>
<%@ page import="org.jsoup.nodes.*" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@page import="java.util.ArrayList" %>
<%@page import="dto.gameRanking" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String url ="https://www.gamemeca.com/ranking.php";
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
		}catch (IOException e) {
			e.printStackTrace();
		}

		Elements e1 = doc.select(".ranking-table-rows");
		Iterator<Element> ie1 = e1.select(".game-name").iterator();
		Iterator<Element> ie2 = e1.select(".company").iterator();
		Iterator<Element> ie3 = e1.select(".game-info").select("span").not(".company").iterator();
		Iterator<Element> ie5 = e1.select(".game-icon").iterator();
		System.out.println(ie5);
		
		ArrayList<gameRanking> game = null;
		game = new ArrayList<>();
		int i=0;
		while(ie1.hasNext()) {
			i = i+1;
			int rank = i;
			String name = ie1.next().text();
			String company = ie2.next().text();
			String genre = ie3.next().text();
			String payment = ie3.next().text();
			String img = ie5.next().attr("src");
			game.add(new gameRanking(rank, name,company,genre,payment,img));	
		}
	%>
</body>
</html>