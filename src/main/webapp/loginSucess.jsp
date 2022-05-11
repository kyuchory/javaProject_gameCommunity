<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
로그인 성공
<%
out.println(session.getAttribute("email"));
out.println(session.getAttribute("password"));
%>
<form action="comm_free.jsp">
	<input type=submit value="자유게시판 이동"/>
</form>
</body>
</html>