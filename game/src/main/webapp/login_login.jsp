<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="login/login.css"/>
</head>
<body>
<jsp:include page="header_header.jsp" />
<div style=height:100px></div>
<div id = "wrapper" class="layoutDku" >
	<div class="header">
		<h1 class="logo">
			<a href="index.jsp" >
				<span class = "dku">DKU</span>
			</a>
		</h1>	
	</div>
	<div style=height:75px></div>
	<form method="post" action="loginProcess.jsp">
		<div id="contents">
			<div class="loginSec">
				<div class="login" id="Login">
					<div class="id">
						<input type="text" class="input1" name="email" placeholder=" ID를 입력해 주세요">
					</div>
					<div class="pwd">
						<input type="password" class="input1" name="password" placeholder=" 비밀번호를 입력해 주세요">
					</div>
					<div class="btLogin">
						<input type = "submit" value ="로그인" class=button1 style="cursor:pointer;">
					</div>
					
					<div class="menu" >
					<a href="signUp.jsp">
						<span class = "menu1"> 회원가입</span>
					</a>
					<a href="findId.jsp">
						<span class = "menu1"> ID찾기</span>
					</a>
					<a href="findPw.jsp">
						<span class = "menu1"> 비밀번호찾기&emsp;</span>
					</a>
					</div>
				</div>
			</div>
			
		</div>
	</form>
	
</div>
</body>
</html>