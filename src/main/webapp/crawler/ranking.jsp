<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.jsoup.*" %>
<%@ page import="org.jsoup.nodes.*" %>
<%@ page import="org.jsoup.select.Elements" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String url = "https://www.gamemeca.com/ranking.php";
	Document doc = null;
	
	try{
		doc = Jsoup.connect(url).get();
	} catch (IOException e) {
		e.printStackTrace();
	}
	
	Elements element = doc.select("tbody");
	
	
	Iterator<Element> rank = element.select("span.text_wrap").iterator();
	Iterator<Element> name = element.select("a._text").iterator();
	Iterator<Element> genne = element.select("dl.rel_info").select("dd.line_1").iterator();
	out.println(element);
	%>
</body>
</html>