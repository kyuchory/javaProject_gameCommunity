<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="dto.*"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
테스트 페이지
<%
request.setCharacterEncoding("utf-8"); //한글로 받아오는거 위해서 ㅎㅎ;

String email = request.getParameter("email");
String password = request.getParameter("password");
String name = request.getParameter("name");

out.println(email);
out.println(password);
out.println(name);

%>

<%
//db + 자바 파트

//현재시간
LocalDateTime now = LocalDateTime.now();

Member member = new Member(email, password, name, now); //jsp의 정보로 객체생성

Connection conn = ConnectionProvider.getConnection();
//db와 커넥션
MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);

if (memberDaoImpl.select(email) == null) { //db에 받아온 이메일로 검색해서 결과가 없으면
	memberDaoImpl.insert(member);//db에 데이터 추가
	response.sendRedirect("registerSuccess.jsp");
} else {
	out.println("<script>alert('이메일 중복 정보가 존재합니다.');</script>");
	out.println("중복정보 존재");
	//response.sendRedirect("registerProcess.jsp");
}



%>

</body>
</html>