<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="dto.*"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
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
	Connection conn = ConnectionProvider.getConnection();
	CommunityDaoImpl communityDaoImpl = new CommunityDaoImpl(conn);
	MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);
	List<Community> list = communityDaoImpl.selectList();
	Iterator<Community> listIter = list.iterator();
	%>


	<table border="1">

		<tr>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
		</tr>

		<%
		while (listIter.hasNext()) {
			Community comm = listIter.next();
			Member mem = memberDaoImpl.select(comm.getEmail());
			String name = mem.getName();
		%>

		<tr>
			<td><%=comm.getSubject()%></td>

			<td><%=comm.getEmail()%>(<%=name%>)</td>

			<td><%=comm.getRegisterDateTime()%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>