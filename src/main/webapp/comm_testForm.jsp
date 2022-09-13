<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	글 작성하기
	<br>
	<form action="comm_testFormProcess.jsp" method="POST">

		<textarea name="subject" cols="20" rows="2"></textarea>
		<br>
		<textarea name="content" cols="150" rows="20"></textarea>
		<br>
		<input type="submit" value="글 작성" />
	</form>
</body>
</html>