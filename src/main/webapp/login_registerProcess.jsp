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
회원가입 실패 테스트 겸 process 페이지
<%
//jsp

// 한글 깨짐을 방지하기 위한 인코딩 처리
request.setCharacterEncoding("utf-8");
String email = request.getParameter("email");
String password = request.getParameter("password");
String name = request.getParameter("name");
int exp = 0;
//용원추가
String genre = request.getParameter("genre");
String graphic = request.getParameter("graphic");
String pay = request.getParameter("pay");
int age = Integer.parseInt(request.getParameter("age"));




if(email != null && email.contains(".com") && email.contains("@") && email != null && password != null){
	//db + 자바 파트

	//현재시간
	LocalDateTime now = LocalDateTime.now();

	Member member = new Member(email, password, name, now, exp); //jsp의 정보로 객체생성
	CheckTime checkTime = new CheckTime(email, now);
	Member_rec member_rec = new Member_rec(email, genre, graphic, pay, age);
	Connection conn = ConnectionProvider.getConnection();
	//db와 커넥션
	MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);
	GameDaoImpl gameDaoImpl = new GameDaoImpl(conn);//용원추가
	CheckTimeDaoImpl checkTimeDaoImpl = new CheckTimeDaoImpl(conn);

//if(){ // 여기부터 걺

	if (memberDaoImpl.select(email) == null) { //db에 받아온 이메일로 검색해서 결과가 없으면
		memberDaoImpl.insert(member);//db에 데이터 추가
		 gameDaoImpl.insert(member_rec);//용원추가
		 checkTimeDaoImpl.insert(checkTime);
		pageContext.forward("login_registerSuccess.jsp");
		/* response.sendRedirect("login_registerSuccess.jsp"); */
	} else {
		out.println("<script>alert('이메일 중복 정보가 존재합니다.');</script>");
		out.println("중복정보 존재");%>
		<form action="main_mainPage.jsp">
		<input type="submit" value="메인 페이지로"/>
		</form><%
		//response.sendRedirect("registerProcess.jsp");
	}
//} //여기까지 걺
	//ok
} 
else {
	out.println("<script>alert('이메일 형식이 맞지 않습니다.');</script>");
	out.println("중복정보 존재");%>
	<form action="login_signUp.jsp">
	<input type="submit" value="다시 입력하기"/>
	</form><%
	//response.sendRedirect("registerProcess.jsp");
	
}

%>

<%-- <%
//db + 자바 파트

//현재시간
LocalDateTime now = LocalDateTime.now();

Member member = new Member(email, password, name, now); //jsp의 정보로 객체생성

Connection conn = ConnectionProvider.getConnection();
//db와 커넥션
MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);



if (memberDaoImpl.select(email) == null) { //db에 받아온 이메일로 검색해서 결과가 없으면
	memberDaoImpl.insert(member);//db에 데이터 추가
	pageContext.forward("login_registerSuccess.jsp");
	/* response.sendRedirect("login_registerSuccess.jsp"); */
} else {
	out.println("<script>alert('이메일 중복 정보가 존재합니다.');</script>");
	out.println("중복정보 존재");%>
	<form action="main_mainPage.jsp">
	<input type="submit" value="메인 페이지로"/>
	</form><%
	//response.sendRedirect("registerProcess.jsp");
}



%> --%>

</body>
</html>