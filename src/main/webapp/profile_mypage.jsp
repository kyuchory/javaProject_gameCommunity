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
<link href="profile_mypage.css" rel="stylesheet" type="text/css ">
</head>
<body>
<%
   String email = (String)session.getAttribute("email");

   if(email == null){
      response.sendRedirect("login_login.jsp");
   }else{
      Connection conn = ConnectionProvider.getConnection();
      MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);
      Member member = memberDaoImpl.select(email);
      int level = member.printLevel();
      int exp = member.getExp();
      %>
<jsp:include page="header_header.jsp"/>
<jsp:include page="main_banner.jsp"/>
<section>
   <div id="contents">
      <ul class="menu">
         <li style="font-weight:bold; font-size:1.5em;"><a href="profile_mypage.jsp">회원정보</a></li>
         <li><a href="profile_myBoard.jsp">작성 글 보기</a></li>
      </ul>
      <div class="menu-name">회원정보</div>
      <table class="information">
         <tr><td class="key">이메일</td><td><div class="value"><%=member.getEmail() %></div></td></tr>
         <tr><td class="key">이름</td><td><div class="value"><%=member.getName() %></div></td></tr>
         <tr><td class="key">성별</td><td><div class="value">남</div></td></tr>
         <tr><td class="key">가입일</td><td><div class="value"><%=member.getRegisterDateTime() %></div></td></tr>
         <tr><td class="key">레벨/Exp</td><td><div class="value"><img style="width:20px; height:20px" src="image/<%=member.printLevelImage()%>"><%if(level >= 0 && level <= 10){
         	%> <%=level %> <%
         }else{
         %>--<%
         }%> / <%=exp %></div></td></tr>
      </table>
      <ul class="button">
         <li><a href="login_logoutProcess.jsp">로그아웃</a></li>
         <li><a href="login_signUp.jsp">회원정보 변경</a></li>
         <li><a href="login_signUp.jsp">비밀번호 변경</a></li>
         <li><a href="main_mainPage.jsp">회원탈퇴</a></li>
      </ul>
   </div>   
</section>

<jsp:include page="header_footer.jsp"/>      
      <%
   }
   
   
%>

</body>
</html>