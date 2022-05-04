<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입(1)</title>
<link rel="stylesheet" href="login.css"/>
</head>
<body>
<%@ include file="header.jsp" %>
<div style=height:100px></div>

<div class="layoutDku">
	<div class="title">기본정보입력</div>
	<form action="./signUp2.jsp" method="post" accept-charset="utf-8">
	<div style=height:35px></div>
	<table class="table1">
		<tr>
			<td class="name1">ID</td>
			<td><input type="text" class="input3" name="id" placeholder=" ID를 입력해주세요"></td>
			<td><button class="reset" style="cursor:pointer;">중복확인</button></td>
		</tr>
		<tr>
			<td class="name1">EMAIL</td>
			<td colspan="2"><input type="text" class="input2" name="email" placeholder=" email을 입력해주세요"></td>
		</tr>
		<tr>
			<td class="name1">비밀번호</td>
			<td colspan="2"><input type="password" class="input2" name="password" placeholder=" 비밀번호를 입력해주세요"></td>
		</tr>
		<tr>
			<td class="name1">이름</td>
			<td colspan="2"><input type="text" class="input2" name="name" placeholder=" 이름을 입력해주세요"></td>
		</tr>
	</table>
	<div style=height:20px></div>
	<input type="submit" value="다음" class="next" style="cursor:pointer;">
	<input type="reset" value="새로입력" class="reset" style="cursor:pointer;">
	</form>

</div>
</body>
</html>