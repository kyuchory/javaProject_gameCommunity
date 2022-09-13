<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login success</title>
<link rel="stylesheet" href="login_login.css?after"/>
</head>
<body>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
%>
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
<div style="margin:auto">
	<h1 style="text-align:center">로그인 성공!</h1><br>
	<p style="text-align:center; margin-bottom:70px;"><span style="color:blue; font-size:1.2em; text-decoration:underline;"><%=name %></span>님, 로그인을 성공하였습니다.<p>
	<form action="comm_free.jsp" method="POST">
		<div style="text-align:center;" >
			<input type="submit" value="자유게시판으로이동" class="button1"/>
		</div>
	</form>
</div>

</body>
</html>