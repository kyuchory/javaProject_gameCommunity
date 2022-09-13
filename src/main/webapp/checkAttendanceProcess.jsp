<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="dto.*"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	출석체크 프로세스
	<%
String email = (String) session.getAttribute("email");
//db받아오기
Connection conn = ConnectionProvider.getConnection();
CheckTimeDaoImpl checkTimeDaoImpl = new CheckTimeDaoImpl(conn);

MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);

CheckTime ct = null;
Member member = null;

if (email != null) {
	ct = checkTimeDaoImpl.select(email);
	member = memberDaoImpl.select(email);
} else {
	//로그인해 !!
}

LocalDateTime ctTime = null;

if( ct.getTime() != null){
	ctTime = ct.getTime();
}
LocalDateTime now = LocalDateTime.now();

int ctTimeSum = -1;

if (ctTime != null) {
	int ctTimeYear = ctTime.getYear();
	int ctTimeMonth = ctTime.getMonthValue();
	int ctTimeDay = ctTime.getDayOfMonth();
	ctTimeSum = ctTimeYear + ctTimeMonth + ctTimeDay;
}

int nowYear = now.getYear();
int nowMonth = now.getMonthValue();
int nowDay = now.getDayOfMonth();
int nowSum = nowYear + nowMonth + nowDay;

if (ctTime == null) {
	//대충 출석체크 가능

	member.addExp();
	member.addExp();
	member.addExp();

	memberDaoImpl.addExpUpdate(member);
	ct.setTime(now);
	checkTimeDaoImpl.edit(ct);
	response.sendRedirect("checkAttendanceSuccess.jsp");
} else if (ctTimeSum == -1) { //null일떄랑 사실 똑같긴한데 일단... ㅋㅋ
	member.addExp();
	member.addExp();
	member.addExp();

	memberDaoImpl.addExpUpdate(member);
	ct.setTime(now);
	checkTimeDaoImpl.edit(ct);
	response.sendRedirect("checkAttendanceSuccess.jsp");
} else if (ctTimeSum != nowSum) {
	//그 날짜가 일치 하지 않으면 출석체크 가능..ㅇㅇ
	member.addExp();
	member.addExp();
	member.addExp();
	ct.setTime(now);
	checkTimeDaoImpl.edit(ct);
	memberDaoImpl.addExpUpdate(member); // 경험치 3포인트 올려줌

	response.sendRedirect("checkAttendanceSuccess.jsp");
} else {
	//대충 이미 출석했다는 내용
	response.sendRedirect("checkAttendanceFail.jsp");
}
%>
	<br>
	<%=email%>
</body>
</html>