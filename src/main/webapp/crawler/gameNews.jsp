<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.jsoup.*" %>
<%@ page import="org.jsoup.nodes.*" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@page import="dto.gameNews" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String url ="https://www.inven.co.kr/webzine/news/";
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
		}catch (IOException e) {
			e.printStackTrace();
		}

		Elements e1 = doc.select(".webzineNewsList");
		Iterator<Element> iImage = e1.select("img.banner").iterator();
		Iterator<Element> iTitle = e1.select(".title").iterator();
		Iterator<Element> iSummary = e1.select(".summary").iterator();
		Iterator<Element> iInfo = e1.select(".info").iterator();
		Iterator<Element> iURL = e1.select("div.content").select("a").iterator();
		
		ArrayList<gameNews> game = null;
		game = new ArrayList<>();
		
		out.print(e1.select(".title"));
		while(iImage.hasNext()) {
			String title = iTitle.next().text();
			String summary = iSummary.next().text();
			String info = iInfo.next().text();
			String image = iImage.next().attr("src");
			String newsurl = iURL.next().attr("href");
			out.print(iImage.next());
			game.add(new gameNews(title, summary, info, image, newsurl));
		}
		out.print(game);
	%>
</body>
</html>