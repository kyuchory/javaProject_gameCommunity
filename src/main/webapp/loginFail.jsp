<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Fail...</title>
<link rel="stylesheet" href="login_login.css"/>
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
<div style="margin:auto">
	<h1 style="text-align:center">로그인실패!</h1><br>
	<form action="login_login.jsp">
		<div class="btLogin" style="text-align:center;" >
			<input type = "submit" value ="로그인 하러가기" class=button1 style="cursor:pointer;">
		</div>
	</form>
</div>
</body>
</html>