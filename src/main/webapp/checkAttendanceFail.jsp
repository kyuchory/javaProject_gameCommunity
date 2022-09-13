<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출석체크 실패!</title>
<style>
.layoutDku{text-align:center;}
.dku{
	font-family: arial;
	color : black;
	font-size:50px;
}
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
}
.button1:hover{
	/*background-color:#6e81df;*/
	background-color:#efefef;
	color: black;
	border : none;
}
</style>
</head>
<body>
<jsp:include page="header_header.jsp" />
<jsp:include page="main_banner.jsp" />
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
<div style="text-align:center">
	<h1 style="text-align:center">출석체크 실패! 이미 출석체크를 완료하셨습니다.</h1><br>
	<form action="main_mainPage.jsp">
		<div style="text-align:center;" >
			<input type = "submit" value ="메인으로 이동" class=button1 style="cursor:pointer;">
		</div>
	</form>
</div>
</body>
</html>