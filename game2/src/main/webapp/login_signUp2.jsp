<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입(2)</title>
<link rel="stylesheet" href="login_login.css"/>
</head>
<body>
<%
 request.setCharacterEncoding("utf-8");
 String email = request.getParameter("email");
 String password = request.getParameter("password");
 String name = request.getParameter("name");
%>
<jsp:include page="header_header.jsp"/>
<div style=height:100px></div>
<div class="layoutDku">
	<div class="title">게임추천정보</div>
	
	<form action="registerProcess.jsp" method="post">
	<div style=height:35px></div>
	<table class="table1">
		<tr>
			<td class="name1">성별</td>
			<td class="name2"><input type="radio" class="inputRadio" name="gender" value="male">남자
			<input type="radio" class="inputRadio" name="gender" value="female">여자
			</td>
			
		</tr>
		<tr>
			<td class="name1">생일</td>
			<td ><input type="date" class="input2" name="birth"></td>
		</tr>
		<tr>
			<td class="name1">좋아하는<br>게임 장르</td>
			<td ><select name="genre" class="input2">
   		 	   	 <option value="action">액션</option>
   				 <option value="rpg">RPG</option>
   				 <option value="fps">FPS</option>
   				 <option value="aos">AOS</option>
   				 <option value="sport">스포츠</option>
   				 <option value="rhythm">리듬</option>
</select></td>
		</tr>
		<tr>
			<td class="name1">사용중인<br>PC 사양</td>
			<td class="name2"><input type="radio" class="inputRadio" name="spec">매우좋음
			<input type="radio" class="inputRadio" name="email">보통
			<input type="radio" class="inputRadio" name="email">나쁨
			<input type="radio" class="inputRadio" name="email">모르겠어요
			</td>
		</tr>
	</table>
	<div style=height:20px></div>
	<input type="submit" value="다음" class="next" style="cursor:pointer;">
	<input type="reset" value="새로입력" class="reset" style="cursor:pointer;">
	<input type="hidden" name="email" value="<%=email%>"/>
	<input type="hidden" name="password" value="<%=password%>"/>
	<input type="hidden" name="name" value="<%=name%>"/>
	</form>

</div>
</body>
</html>