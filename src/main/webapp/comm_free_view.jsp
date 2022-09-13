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
<%@ page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="comm_comm.css?after">
</head>
<body>

	<jsp:include page="header_header.jsp" />
	<jsp:include page="main_banner.jsp" />
	<%
	Long num = Long.parseLong(request.getParameter("num"));
	Connection conn = ConnectionProvider.getConnection();
	CommunityDaoImpl communityDaoImpl = new CommunityDaoImpl(conn);
	MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);
	Community comm = communityDaoImpl.selectByNum(num);
	String emailG = comm.getEmail();
	String subjectG = comm.getSubject();
	String contentG = comm.getContent();
	LocalDateTime registerDateTimeG = comm.getRegisterDateTime();
	Member member = memberDaoImpl.select(emailG);
	String level = member.printLevelImage();
	%>
	<div class="comm_head_news">
		<div class="comm_header">
			<div class="comm_header_index">
				<h1 style="color: white">
					<br>커뮤니티
				</h1>
				<p style="color: white">소식을 공유해 보세요</p>
			</div>
			 <div class="comm_header_tap">
            <span class="comm_header_tap_obj_free"><br>
            <a style="color: white" href="comm_recommend.jsp">게임추천</a></span><!--     
         --><span class="comm_header_tap_picked"><br>
            <a href="comm_free.jsp">자유게시판</a></span><!-- 
            --><span class="comm_header_tap_obj_free"><br>
            <a style="color: white" href="comm_news.jsp">게임소식</a></span>
         </div>
		</div>
	</div>
	<div style="height: 150px"></div>
	<div style="width: 67%; margin: auto">
		<div>
			<span class="comm_table_cap">자유게시판</span> <span id="comm_view_button">
				<button style="cursor:pointer" id="comm_view_button"
					onclick="location.href='comm_free.jsp'">돌아가기</button>
			</span>
		</div>
		<div style="hegiht: 80px"></div>
		<table>
			<tr>

				<td style="width:58%;padding-left:50px"><%=subjectG%></td>
				<th class="comm_table_space"></th>
				<td style="width:19%;text-align:center;"><img src="image/<%=level %>" style="width:25px; height:25px"/> <%=comm.getEmail()%></td>
				<th class="comm_table_space"></th>
				<td style="width:19%;text-align:center;"><%=comm.getRegisterDateTime()%></td>
			</tr>
			
		</table>
		
		<div style="height: 300px;padding:50px"><p><%=comm.getContent()%></p></div>
		<div style="width: 67%; margin: auto"></div>
	</div>
	<%
	List<Community> list = communityDaoImpl.selectList();
	Iterator<Community> listIter = list.iterator();

	int pageSize = 10;

	String pageNum = request.getParameter("pageNum");

	if (pageNum == null) { // 클릭한게 없으면 1번 페이지
		pageNum = "1";
	}
	// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
	int currentPage = Integer.parseInt(pageNum);

	int count = 0;
	count = communityDaoImpl.getCount(); // 데이터베이스에 저장된 총 갯수

	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	int startRow = count - (currentPage - 1) * pageSize - 9;
	int endRow = count - (currentPage - 1) * pageSize;

	List<Community> list2 = null;
	if (count > 0) {
		// getList()메서드 호출 / 해당 레코드 반환
		list2 = communityDaoImpl.getList(startRow, endRow);
	}
	%>
	<div style="height: 100px"></div>
	<div style="width: 67%; margin: auto">
		<div style="height: 150px"></div>
		<span class="comm_table_cap">자유게시판</span>
		<form action="comm_free_search.jsp" method="get" class="comm_table_search">
			제목 : <input class="comm_table_search_input" type="text"
				name="text">
			<button class="comm_table_search_submit" type="submit">&#128269;</button>
		</form>
		<div style="height: 80px"></div>
		<table class="comm_table">

			<tr class="comm_table_head">
				<th>제목</th>
				<th class="comm_table_space"></th>
				<th class="spacing">작성자(email)</th>
				<th class="comm_table_space"></th>
				<th>작성일</th>

			</tr>

			<%
			if (count > 0) { // 데이터베이스에 데이터가 있으면
				int number = count - (currentPage - 1) * pageSize; // 글 번호 순번 
				for (int i = 0; i < list2.size(); i++) {
					Community board = list2.get(i); // 반환된 list에 담긴 참조값 할당
					String email = board.getEmail();
					Member member3 = memberDaoImpl.select(email);
					String name = member3.getName();
			%>
			<tr>
				<td style="width:58%;padding-left:50px;text-align:left"><a href="comm_free_view.jsp?num=<%=board.getNum()%>"><%=board.getSubject()%></a></td>
				<th class="comm_table_space"></th>
				<td style="width:19%"><%=board.getEmail()%>(<%=name%>)</td>
				<th class="comm_table_space"></th>
				<td style="width:19%"><%=board.getRegisterDateTime()%></td>
			</tr>
			<%
			}
			} else { // 데이터가 없으면
			%>
			<tr>
				<td colspan="6" align="center">게시글이 없습니다.</td>
			</tr>
			<%
			}
			%>
			</table>
		<div style="height:30px"></div>
        <%String email = (String)session.getAttribute("email"); %>
        <%if(email != null){ %>
        <button style="cursor:pointer" class="comm_table_new" type="button"
         onclick="location.href='comm_free_write.jsp'">글작성</button>
         <%} %>
      <div style="height:50px"></div>

	<div style="width:67%;margin:auto;text-align:center">
               <%
               // 페이징  처리
               if (count > 0) {
                  // 총 페이지의 수
                  int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
                  // 한 페이지에 보여줄 페이지 블럭(링크) 수
                  int pageBlock = 10;
                  // 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
                  int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
                  int endPage = startPage + pageBlock - 1;

                  // 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
                  if (endPage > pageCount) {
                     endPage = pageCount;
                  }

                  if (startPage > pageBlock) { // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
               %><button class="comm_pagebutton" type="button" onclick="location.href='comm_free.jsp?pageNum=<%=startPage - 10%>'">이전</button>
                <%
 }

 for (int i = startPage; i <= endPage; i++) { // 페이지 블록 번호
 if (i == currentPage) { // 현재 페이지에는 링크를 설정하지 않음
 %>  <button class="comm_pagebutton_selected" type="button" onclick="location.href='comm_free.jsp?pageNum=<%=i%>'"><%=i %></button> <%
 } else { // 현재 페이지가 아닌 경우 링크 설정
 %> <%-- <a class ="comm_button" href="comm_free.jsp?pageNum=<%=i%>">[<%=i%>] --%>
 <button class="comm_pagebutton" type="button" onclick="location.href='comm_free.jsp?pageNum=<%=i%>'"><%=i %></button>
            <!-- </a> --> <%
 }
 } // for end

 if (endPage < pageCount) { // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
 %><button class="comm_pagebutton" type="button" onclick="location.href='comm_free.jsp?pageNum=<%=startPage - 10%>'">다음</button>
<%
 }
 }
 %>
           
      <div style="height: 50px"></div>
     
   </div>
   </div>
</body>
</html>