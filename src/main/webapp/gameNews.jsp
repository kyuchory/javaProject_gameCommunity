<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String urln ="https://www.gamemeca.com/news.php";
	Document docn = null;
	try {
	   docn = Jsoup.connect(urln).get();
	}catch (IOException e) {
	   e.printStackTrace();
	}finally{}

	Elements en1 = docn.select(".list_news").select("li").not(".google-auto-placed");
	Iterator<Element> ien1 = en1.select("a").iterator();//주소 , attr("href") 해야됨
	Iterator<Element> ien2 = en1.select("a").iterator();//제목
	Iterator<Element> ien3 = en1.select("img").iterator();
	Iterator<Element> ien4 = en1.select(".day_news").iterator();//게시날짜
	Iterator<Element> ien5 = en1.select(".desc_thumb_h").iterator();
	Iterator<Element> ien6 = en1.select(".desc_thumb").iterator();

	ArrayList<gameNews> gamen = new ArrayList<>();
	while(ien5.hasNext()) {
		ien2.next().text();
		String title = ien2.next().text();
		String summary = ien5.next().text();
		String info = ien4.next().text();
		String image = ien3.next().attr("src");
		String newsUrl = ien1.next().attr("href").replaceAll("[^0-9]","");
		ien1.next();
		
		gamen.add(new gameNews(title, summary, info, image, newsUrl));
	}
	while(ien6.hasNext()) {
		ien2.next().text();
		String title = ien2.next().text();
		String summary = ien6.next().text();
		String info = ien4.next().text();
		String image = ien3.next().attr("src");
		String newsUrl = ien1.next().attr("href").replaceAll("[^0-9]","");
		ien1.next();
		
		gamen.add(new gameNews(title, summary, info, image, newsUrl));
	}
	%>
</body>
</html>