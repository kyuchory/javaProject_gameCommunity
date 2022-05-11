<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.jsoup.*" %>
<%@ page import="org.jsoup.nodes.*" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@page import="dto.gameNews" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>	
<meta charset="EUC-KR">
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
	Iterator<Element> ien1 = en1.select("a").iterator();//�ּ� , attr("href") �ؾߵ�
	Iterator<Element> ien2 = en1.select("a").iterator();//����
	Iterator<Element> ien3 = en1.select("img").iterator();
	Iterator<Element> ien4 = en1.select(".day_news").iterator();//�Խó�¥
	Iterator<Element> ien5 = en1.select(".desc_thumb_h").iterator();
	Iterator<Element> ien6 = en1.select(".desc_thumb").iterator();

	ArrayList<gameNews> gamen = new ArrayList<>();
	while(ien5.hasNext()) {
		ien2.next().text();
		String title = ien2.next().text();
		String summary = ien5.next().text();
		String info = ien4.next().text();
		String image = ien3.next().attr("src");
		String newsUrl = ien1.next().attr("href");
		
		gamen.add(new gameNews(title, summary, info, image, newsUrl));
	}
	while(ien6.hasNext()) {
		ien2.next().text();
		String title = ien2.next().text();
		String summary = ien6.next().text();
		String info = ien4.next().text();
		String image = ien3.next().attr("src");
		String newsUrl = ien1.next().attr("href");
		
		gamen.add(new gameNews(title, summary, info, image, newsUrl));
	}
	%>
	
</body>
</html>