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
   <link href="header_header.css?after" rel="stylesheet" type="text/css" >

</head>
<body>
<header>
   <%
      String email = (String)session.getAttribute("email");
   
      
   %>
   <div id="mySidenav" class="sidenav" >
     <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
     <a href="#">프로필</a>
     <a href="#">게임소식</a>
     <a href="#">커뮤니티</a>
     <a href="#">게임추천</a>
   </div>
   <div class="border_bottom">
      <div class="menu2" style="font-size:30px;cursor:pointer;position:absolute;left:0;" onclick="openNav()">&#9776;</div>
      <div style="aligh-item:flex-center">
         <a href="main_mainPage.jsp" style="font-family: arial;color:black;font-size:30px;margin:auto;"><img style="margin-top:15px;width:100px;height:40px;" src="image/logo1.png"></a>
      </div>
      <%-- 로그인 안되어있는케이스 --%>
      <div class="login-cover">
         <%if(email == null){ %>
         <div class='login1'style="float:right">
            <a href="login_login.jsp" style="width:100px; height:40px; line-height:40px; text-align:center; border:3px solid black; border-radius:40px; margin-right:10px; color:black">로그인</a>
            <a href="login_signUp.jsp" style="margin-right:10px; font-size:0.8em; font-weight:normal;">회원가입</a>
         </div>
         <%-- 로그인 되어있는케이스 --%>
         <%}else{ 
            Connection conn = ConnectionProvider.getConnection();
            //db와 커넥션
            MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);
             //request로 받은 email로 db에서 이메일과 일치하는 튜플 가져옴
            Member thisMember = memberDaoImpl.select(email);
             String name = thisMember.getName();
         %>
         <div class='login1'style="float:right">
            <span style="font-size:1.2em"><%=name %></span>님
         </div>
         <div class='login1'style="float:right">
            <%-- 로그아웃 버튼 --%>
            <a href="login_logoutProcess.jsp">로그아웃</a>
         </div>
         <%}%>
      </div>
   </div>
   
</header>
<script>   
   function openNav() {
          document.getElementById("mySidenav").style.width = "250px";
      }   
   function closeNav() {
       document.getElementById("mySidenav").style.width = "0";
   }   
   
</script>
</body>
</html>