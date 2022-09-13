<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.button1{
	height:67px;
	width:510px;
	margin:15px;
	border:1px solid;
	background-color: black;
	color:white;
	font-weight : bolder;
	font-size:30px;
	transition: all 0.3s;
</style>
</head>
<body><%
String e = request.getParameter("E");
String n = request.getParameter("N");
String t = request.getParameter("T");
String j = request.getParameter("J");


%>
<jsp:include page="header_header.jsp" />
<jsp:include page="main_banner.jsp" />
<div style="text-align:center">
<div style="height:50px"></div>
<div style="font-size:70px">당신의 MBTI는 </div>
<div style="font-size:150px"><%=e+n+t+j%>입니다.</div>
<div style="height:50px"></div>
<form action="rec_getMbti.jsp">
	<div class="btLogin" style="text-align:center;" >
		<input type = "submit" value ="게임추천 받으러 가기" class=button1 style="cursor:pointer;">
	</div>
	</form>
</div>
</body>
</html>