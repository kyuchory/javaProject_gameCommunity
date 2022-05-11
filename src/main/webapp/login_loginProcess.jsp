<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="dto.*"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	Connection conn = ConnectionProvider.getConnection();
	//db와 커넥션
	MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);
    //request로 받은 email로 db에서 이메일과 일치하는 튜플 가져옴
	Member thisMember = memberDaoImpl.select(email);
	String dbEmail = thisMember.getEmail();
	
	out.println("디비에 저장된 정보");
	out.println(dbEmail);
	String dbPassword = thisMember.getPassword();
	out.println(dbPassword);

	if (thisMember == null) { //db에 받아온 이메일로 검색해서 결과가 없으면
		out.println("<script>alert('회원 정보가 존재하지 않습니다.');</script>");
		//response.sendRedirect("login.jsp");
	} else {
		if (dbPassword.equals(password)) {
			//아이디가 존재하며 그아이디의 비밀번호가 맞을때
			session.setAttribute("email", email); //세션에 이메일과 비밀번호를 저장
			session.setAttribute("password", password);
			out.println("<script>alert('로그인 성공, 세션에 로그인 정보가 기록됩니다.');</script>");

			response.sendRedirect("loginSucess.jsp");
		} else {
			out.println("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
		}
	}
	%>
</body>
</html>