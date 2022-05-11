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
	
	Community comm = new Community(email, subject, content, now);
	
	Connection conn = ConnectionProvider.getConnection();
	
	CommunityDaoImpl communityDaoImpl = new CommunityDaoImpl(conn);
	
	//삽입 !!
	communityDaoImpl.insert(comm);
	
	response.sendRedirect("comm_free.jsp");
%>
<%-- <%=subject %><br>
<%=content %><br>
<%=email %><br>
<form action="comm_testFormList.jsp" method="POST">
	<input type="submit" value="글 목록 보러가기"/>
</form> --%>
</body>
</html>