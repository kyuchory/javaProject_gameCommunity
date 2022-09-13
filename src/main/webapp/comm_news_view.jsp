<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.jsoup.*"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="comm_comm.css?after">
</head>
<body>
<jsp:include page="header_header.jsp"/>
<jsp:include page="main_banner.jsp"/>
<div class="comm_head_news">
	<div class="comm_header">
		<div class="comm_header_index">
			<h1 style="color:white"><br>커뮤니티</h1>
			<p style="color:white">소식을 공유해 보세요</p>	
		</div>
		<div class="comm_header_tap">
			<span class="comm_header_tap_obj_news"><br><a style="color:white" href="comm_recommend.jsp">게임추천</a></span><!--  
			--><span class="comm_header_tap_obj_news"><br><a style="color:white" href="comm_free.jsp">자유게시판</a></span><!--  
			--><span class="comm_header_tap_picked"><br><a href="comm_news.jsp">게임소식</a></span>
		</div>
	</div>
</div>
<div style="height:150px"></div>
<div style="width:67%;margin:auto">
<div>
<span class="comm_table_cap">게임소식</span>
<span id="comm_view_button">
<button style="cursor:pointer" id="comm_view_button" onclick="location.href='comm_news.jsp'">돌아가기</button></span>
</div>
<div style="hegiht:80px"></div>
	<table>
	<tr>
	<%
	String g = request.getParameter("g");
	String url ="https://www.gamemeca.com/view.php?gid="+g;
	Document doc = null;
	try {
		doc = Jsoup.connect(url).get();
	}catch (IOException e) {
		e.printStackTrace();
	}

	Elements e1 = doc.select(".article-title").select("h1");
	Elements e2 = doc.select(".article-title").select(".writer");
	Elements e3 = doc.select(".article-title").select(".date");
	Elements e4 = doc.select(".article");
	String sub = e1.text();
	String auth = e2.text();
	String date = e3.text();
	
	String ie2 = e2.next().text();
	%>
	
			<td style="width:58%;padding-left:50px;"><%=sub%></td>
			<td class="comm_table_space"></td>
			<td style="width:19%;text-align:center"><%=auth%></td>
			<td class="comm_table_space"></td>
			<td style="width:19%;text-align:center"><%=date%></td>
			</tr>
	</table>
	<div style="height:100px"></div>
	<div style="width:67%;margin:auto"> <%=e4%></div>
</div>

<div style="width:67%; margin:auto">
	<div style="height:100px"></div>
	<span class="comm_table_cap">게임소식</span>
		<div style="height:80px"></div>
	<table class="comm_table">

		<tr class="comm_table_head">
         <th style="width:58%">제목</th>
         <th class="comm_table_space"></th>
         <th style="width:19%">작성자(email)</th>
         <th class="comm_table_space"></th>
         <th style="width:19%">작성일</th>
         
   <tr>
		

<%
String p = "1";
p = request.getParameter("p");
if(p==null){
	p="1";
}
String url1 ="https://www.gamemeca.com/news.php?p="+p;
Document doc1 = null;
try {
	doc1 = Jsoup.connect(url1).get();
}catch (IOException e) {
	e.printStackTrace();
}finally{}
Elements e11 = doc1.select(".list_news").select("li").not(".google-auto-placed");
Iterator<Element> ie11 = e11.select("a").iterator();//주소 , attr("href") 해야됨
Iterator<Element> ie21 = e11.select("a").iterator();//제목
Iterator<Element> ie31 = e11.select("img").iterator();
Iterator<Element> ie41 = e11.select(".day_news").iterator();//게시날짜
Iterator<Element> ie51 = e11.select(".desc_thumb_h").iterator();
Iterator<Element> ie61 = e11.select(".desc_thumb").iterator();


String addr1 = "";
String sub1 = "" ;
String img1 = "";
String date1 = "";
String text1 = "";
%>

<c:forEach var="i" begin="1" end="13">
		<%
		addr1 = ie11.next().attr("href");
		addr1 = addr1.replaceAll("[^0-9]","");
		ie11.next().attr("href");
		img1 = ie31.next().attr("src");
		ie21.next().text();
		sub1 = ie21.next().text();
		date1 = ie41.next().text();
		if(ie51.hasNext()){
		text1 = ie51.next().text();}
		else {
			text1=ie61.next().text();
			}
		%>
		<tr>
			
			<td style="text-align:left;padding-left:50px"><div><a href="comm_news_view.jsp?g=<%=addr1%>&p=<%=p%>"><img src="<%=img1%>"style="width:100px;height:50px;">&nbsp;<%=sub1%></a></div></td>
			<td class="comm_table_space"></td>
			<td class="spacing">게임메카</td>
			<td class="comm_table_space"></td>
			<td><%=date1%></td>
		</tr>
	</c:forEach>
	</table>
	<div style="height:30px"></div>

<div style="height:50px"></div>

<div style="width:67%;margin:auto">
<c:forEach var="j" begin="1" end="10">
<c:set var="name" value="<%=p %>"/>
<c:choose>
<c:when test="${j eq name }">
<button class="comm_pagebutton_selected" type="button" onclick="location.href='comm_news.jsp?p=${j}'">${j}</button>
</c:when>
<c:otherwise>
<button class="comm_pagebutton" type="button" onclick="location.href='comm_news.jsp?p=${j}'">${j}</button>
</c:otherwise>
</c:choose>

</c:forEach>
</div>
</div>
<div style="height:100px"></div>
</body>
</html>