<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register success</title>
<link rel="stylesheet" href="login_login.css?after"/>
</head>
<body>
<jsp:include page="header_header.jsp" />
<div style=height:100px></div>
<div id = "wrapper" class="layoutDku" >
	<div class="header">
		<h1 class="logo">
			<a href="index.jsp" >
				<span class = "dku">GamChu</span>
			</a>
		</h1>	
	</div>
	<div style=height:75px></div>
</div>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
%>
<div style="margin:auto">
	<h1 style="text-align:center">환영합니다!</h1><br>
	<p style="text-align:center"><span style="color:blue; font-size:1.2em; text-decoration:underline;"><%=name %></span>님, 회원가입을 축하합니다.<p>
	<p style="text-align:center">사용자님의 새로운 아이디는 <span style="color:blue; font-size:1.2em; text-decoration:underline;"><%=email%></span>입니다.</p><br><br>
	<form action="login_login.jsp">
		<div class="btLogin" style="text-align:center;" >
			<input type = "submit" value ="로그인 하러가기" class=button1 style="cursor:pointer;">
		</div>
	</form>
</div>
</body>
</html>