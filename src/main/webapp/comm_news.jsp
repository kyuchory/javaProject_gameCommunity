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
<div style="width:67%; margin:auto">
   <div style="height:150px"></div>
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
String url ="https://www.gamemeca.com/news.php?p="+p;
Document doc = null;
try {
   doc = Jsoup.connect(url).get();
}catch (IOException e) {
   e.printStackTrace();
}finally{}
Elements e1 = doc.select(".list_news").select("li").not(".google-auto-placed");
Iterator<Element> ie1 = e1.select("a").iterator();//주소 , attr("href") 해야됨
Iterator<Element> ie2 = e1.select("a").iterator();//제목
Iterator<Element> ie3 = e1.select("img").iterator();
Iterator<Element> ie4 = e1.select(".day_news").iterator();//게시날짜
Iterator<Element> ie5 = e1.select(".desc_thumb_h").iterator();
Iterator<Element> ie6 = e1.select(".desc_thumb").iterator();


String addr = "";
String sub = "" ;
String img = "";
String date = "";
String text = "";
%>

<c:forEach var="i" begin="1" end="13">
      <%
      addr = ie1.next().attr("href");
      addr = addr.replaceAll("[^0-9]","");
      ie1.next().attr("href");
      img = ie3.next().attr("src");
      ie2.next().text();
      sub = ie2.next().text();
      date = ie4.next().text();
      if(ie5.hasNext()){
      text = ie5.next().text();}
      else {
         text=ie6.next().text();
         }
      %>
      <tr>
         <td style="text-align:left;padding-left:50px"><div><a href="comm_news_view.jsp?g=<%=addr%>&p=<%=p%>"><img src="<%=img%>"style="width:100px;height:50px;">&nbsp;<%=sub%></a></div></td>
         <td class="comm_table_space"></td>
         <td class="spacing">게임메카</td>
         <td class="comm_table_space"></td>
         <td><%=date%></td>
      </tr>
   </c:forEach>
   </table>
 
<div style="height:80px"></div>

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