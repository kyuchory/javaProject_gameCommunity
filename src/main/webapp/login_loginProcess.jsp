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
<title>로그인 실패!</title>
<style>
.layoutDku{text-align:center;}
.dku{
	font-family: arial;
	color : black;
	font-size:50px;
}
.button1{
	height:67px;
	width:510px;
	margin:15px;
	border:1px solid;
	background-color: black;
	color:white;
	font-weight : bolder;
	font-size:30px;
	transition: all 0.3s;
}
.button1:hover{
	/*background-color:#6e81df;*/
	background-color:#efefef;
	color: black;
	border : none;
}
</style>
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
	
	/* out.println("디비에 저장된 정보");
	out.println(dbEmail);
	out.println(dbPassword);  
	*/
	
	String dbPassword = thisMember.getPassword();
	if (thisMember == null) { //db에 받아온 이메일로 검색해서 결과가 없으면
		out.println("<script>alert('회원 정보가 존재하지 않습니다.');</script>");
		//response.sendRedirect("login.jsp");
	} else {
		if (dbPassword.equals(password)) {
			//아이디가 존재하며 그아이디의 비밀번호가 맞을때
			session.setAttribute("email", email); //세션에 이메일과 비밀번호를 저장
			session.setAttribute("password", password);
			out.println("<script>alert('로그인 성공, 세션에 로그인 정보가 기록됩니다.');</script>");
			
			response.sendRedirect("main_mainPage.jsp");
		} else {
			out.println("<script>alert('비밀번호가 일치하지 않습니다.');</script>");	
			%>
			<jsp:include page="header_header.jsp" />
			<jsp:include page="main_banner.jsp" />
			<div style="margin:auto">
				<h1 style="text-align:center; margin:100px;">비밀번호를 확인해주세요.</h1><br>
				<form action="login_login.jsp">
					<div class="btLogin" style="text-align:center;" >
						<input type = "submit" value ="다시 로그인 하러가기" class=button1 style="cursor:pointer;">
					</div>
				</form>
			</div>
			<%
		}
	}
	
	%>
	
	<%-- <%
	
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	Connection conn = ConnectionProvider.getConnection();
	//db와 커넥션
	MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);
    //request로 받은 email로 db에서 이메일과 일치하는 튜플 가져옴
   
     try{
    	Member thisMember = memberDaoImpl.select(email);
    	
    	String dbEmail = thisMember.getEmail();
    	
    	out.println("디비에 저장된 정보");
    	out.println(dbEmail);
    	String dbPassword = thisMember.getPassword();
    	out.println(dbPassword);
    	out.println("입력된 비밀번호 "+password);

    	if (thisMember == null) { //db에 받아온 이메일로 검색해서 결과가 없으면
    		out.println("<script>alert('회원 정보가 존재하지 않습니다.');</script>");
    		response.sendRedirect("loginFail.jsp");
    	} else {
    		if (dbPassword.equals(password)) {
    			//아이디가 존재하며 그아이디의 비밀번호가 맞을때
    			session.setAttribute("email", email); //세션에 이메일과 비밀번호를 저장
    			session.setAttribute("password", password);
    			out.println("<script>alert('로그인 성공, 세션에 로그인 정보가 기록됩니다.');</script>");

    			response.sendRedirect("loginSucess.jsp");
    		} else {
    			out.println("로그인 실패 비밀번호 불일치");
    			out.println("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
    		}
    	}
    } catch ( Exception e ){
    	response.sendRedirect("loginFail.jsp");	
    } 
    
	%>  --%>

</body>
</html>