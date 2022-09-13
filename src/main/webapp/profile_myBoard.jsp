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
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="profile_mypage.css" rel="stylesheet" type="text/css ">
<link href="comm_comm.css" rel="stylesheet" type="text/css ">
</head>
<body>

	<%
	//DB받아오기
		String emailSession = (String)session.getAttribute("email");
	
		Connection conn = ConnectionProvider.getConnection();
		CommunityDaoImpl communityDaoImpl = new CommunityDaoImpl(conn);
		CommunityRecommendDaoImpl communityRecommendDaoImpl = new CommunityRecommendDaoImpl(conn);
		MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);

		int freeCount = communityDaoImpl.getCount();
		int recommendCount = communityRecommendDaoImpl.getCount();
		
		int myFreeCount = -1;
		int myRecommendCount = -1;

		List<Community> freeList = null;
		List<Community> recommendList = null;
		freeList = communityDaoImpl.selectListEmail(emailSession);
		recommendList = communityRecommendDaoImpl.selectListEmail(emailSession);
		myFreeCount= freeList.size();
		myRecommendCount = recommendList.size();
		
		/* if (myFreeCount > 5) {
			freeList = communityDaoImpl.getListEmail(freeCount - 5, freeCount, emailSession);
		}
		if (myRecommendCount > 5) {
			recommendList = communityRecommendDaoImpl.getListEmail(recommendCount - 5, recommendCount, emailSession);
		} */

		
	
	%>
<jsp:include page="header_header.jsp"/>
<jsp:include page="main_banner.jsp"/>

<section>
   <div id="contents">
      <ul class="menu">
         <li><a href="profile_mypage.jsp">회원정보</a></li>
         <li style="font-weight:bold; font-size:1.5em;"><a href="profile_myBoard.jsp">작성 글 보기</a></li>
      </ul>
      <br>
     <div class="boards-box">
     	<div id="fourth-box" class="box">
				<div class="board_header" style="font-weight:bold; font-size:1.25em;">최근 자유게시판 작성글</div>
				<table class="main_comm_table">
					<tr class="main_comm_table_head">
						<th class="main_comm_thead">제목</th>
						<th class="main_comm_table_space"></th>
						<th class="main_comm_thead">작성자(email)</th>
						<th class="main_comm_table_space"></th>
						<th class="main_comm_thead">작성일</th>

					</tr>
					<%
					if (myFreeCount < 5) {
					%>
					<tr>
						<td>데이터가 부족합니다. 소식을 공유해주세요!</td>

					</tr>
					<%
					} else {
					for (int k = 0; k < 5; k++) {
						Community board = freeList.get(k);
						String email = board.getEmail();
						Member member = memberDaoImpl.select(email);
						String name = member.getName();
					%>

					<tr>
						<td class="main_comm_tbody"><a
							href="comm_free_view.jsp?num=<%=board.getNum()%>"><%=board.getSubject()%></a></td>
						<td class="main_comm_table_space"></td>
						<td class="main_comm_tbody"><%=name%>(<%=board.getEmail()%>)</td>
						<td class="main_comm_table_space"></td>
						<td class="main_comm_tbody"><%=board.getRegisterDateTime()%></td>
					</tr>
					<%
					}
					}
					%>
				</table>
			</div>
			<br>
			<br>
			<div id="fifth-box" class="box">
				<div class="board_header" style="font-weight:bold; font-size:1.25em;">최근 추천게시판 작성글</div>
				<table class="main_comm_table">
					<tr class="main_comm_table_head">
						<th class="main_comm_thead">제목</th>
						<th class="main_comm_table_space"></th>
						<th class="main_comm_thead">작성자(email)</th>
						<th class="main_comm_table_space"></th>
						<th class="main_comm_thead">작성일</th>

					</tr>
					<%
					if (myRecommendCount < 5) {
					%>
					<tr>
						<td>데이터가 부족합니다. 소식을 공유해주세요!</td>

					</tr>
					<%
					} else {
					for (int k = 0; k < 5; k++) {
						Community board = recommendList.get(k);
						String email = board.getEmail();
						Member member = memberDaoImpl.select(email);
						String name = member.getName();
					%>

					<tr>
						<td class="main_comm_tbody"><a
							href="comm_recommend_view.jsp?num=<%=board.getNum()%>"><%=board.getSubject()%></a></td>
						<td class="main_comm_table_space"></td>
						<td class="main_comm_tbody"><%=name%>(<%=board.getEmail()%>)</td>
						<td class="main_comm_table_space"></td>
						<td class="main_comm_tbody"><%=board.getRegisterDateTime()%></td>
					</tr>
					<%
					}
					}
					%>
				</table>
			</div>
     </div>
   </div>   
   
</section>

<jsp:include page="header_footer.jsp"/>   
</body>
</html>