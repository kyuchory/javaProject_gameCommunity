<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="header.css" rel="stylesheet" type="text/css">

</head>
<body>
</head>
<body>

<div id="mySidenav" class="sidenav" >
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#">프로필</a>
  <a href="#">게임소식</a>
  <a href="#">커뮤니티</a>
  <a href="#">게임추천</a>
</div>
<div class="border_bottom">
<span class="menu2" style="font-size:30px;cursor:pointer;" onclick="openNav()">&#9776;</span>
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>
<span>
<a href="main.jsp" style="font-family: arial;color:black;font-size:30px;">DKU</a>
</span>
<div class='login1'style="float:right">
			<a href="login.jsp" style="width:100px; height:40px; line-height:40px; text-align:center; border:3px solid black; border-radius:40px; margin-right:10px; color:black">로그인</a>
			<a href="signUp.jsp" style="margin-right:10px; font-size:0.8em; font-weight:normal;">회원가입</a>
		</div>
</div>


</body>
</html>