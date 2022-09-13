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
	request.setCharacterEncoding("utf-8");	
	
	LocalDateTime now = LocalDateTime.now();
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String email = (String)session.getAttribute("email");
	
	if(email == null){
		response.sendRedirect("loginFail.jsp");
	}
	
	Connection connMem = ConnectionProvider.getConnection();
	//db와 커넥션
	MemberDaoImpl memberDaoImpl = new MemberDaoImpl(connMem);
	
	Member member = memberDaoImpl.select(email);
	
	member.addExp();//경험치 1 올라감
	
	memberDaoImpl.addExpUpdate(member);
	
	
	Community comm = new Community(email, subject, content, now);
	
	Connection conn = ConnectionProvider.getConnection();
	
	CommunityRecommendDaoImpl communityRecommendDaoImpl = new CommunityRecommendDaoImpl(conn);
	
	//삽입 !!
	communityRecommendDaoImpl.insert(comm);
	
	response.sendRedirect("comm_recommend.jsp");
%>
</body>
</html>