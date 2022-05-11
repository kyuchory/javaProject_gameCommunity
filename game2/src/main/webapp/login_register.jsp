<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="registerProcess.jsp" method="POST">

	이메일=><input type="text" name="email"/><input type="button" value="중복확인" > <br>
	
	비밀번호=><input type="password" name="password"/> <br>
	이름=><input type="text" name="name"/><br>
	<input type="submit" value="다음으로">
</form>
</body>
</html>