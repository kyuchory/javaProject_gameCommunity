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
<link rel="stylesheet" href="comm_comm.css">
</head>
<body>
	<%
	Connection conn = ConnectionProvider.getConnection();
	CommunityDaoImpl communityDaoImpl = new CommunityDaoImpl(conn);
	MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);
	List<Community> list = communityDaoImpl.selectList();
	Iterator<Community> listIter = list.iterator();

	int pageSize = 10;

	String pageNum = request.getParameter("pageNum");

	if (pageNum == null) { // 클릭한게 없으면 1번 페이지
		pageNum = "1";
	}
	// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
	int currentPage = Integer.parseInt(pageNum);

	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	int count = 0;
	count = communityDaoImpl.getCount(); // 데이터베이스에 저장된 총 갯수

	List<Community> list2 = null;
	if (count > 0) {
		// getList()메서드 호출 / 해당 레코드 반환
		list2 = communityDaoImpl.getList(startRow, endRow);
	}
	%>
	<%-- <jsp:include page="header_header.jsp"/>
<jsp:include page="main_header1.jsp"/> --%>
	<div class="comm_head_free">
		<div class="comm_header">
			<div class="comm_header_index">
				<h1 style="color: white">
					<br>커뮤니티
				</h1>
				<p style="color: white">소식을 공유해 보세요</p>
			</div>
			<div class="comm_header_tap">
				<span class="comm_header_tap_obj_free"><br>
				<a style="color: white" href="comm_recommend.jsp">추천</a></span>
				<!--  
			-->
				<span class="comm_header_tap_picked"><br>
				<a href="comm_free.jsp">자유</a></span>
				<!--  
			-->
				<span class="comm_header_tap_obj_free"><br>
				<a style="color: white" href="comm_news.jsp">게임소식</a></span>
			</div>
		</div>
	</div>
	<div style="width: 67%; margin: auto">
		<div style="height: 200px"></div>
		<span class="comm_table_cap">게임소식</span>
		<form action="#" method="get" class="comm_table_search">
			제목 : <input class="comm_table_search_input" type="text"
				name="subject">
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
				<td><%=board.getSubject()%></td>
				<th class="comm_table_space"></th>
				<td><%=board.getEmail()%>(<%=name%>)</td>
				<th class="comm_table_space"></th>
				<td><%=board.getRegisterDateTime()%></td>
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
			<tr>
				<td colspan="6" align="center">
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
					%> <a href="comm_free.jsp?pageNum=<%=startPage - 10%>">[이전]</a> <%
 }

 for (int i = startPage; i <= endPage; i++) { // 페이지 블록 번호
 if (i == currentPage) { // 현재 페이지에는 링크를 설정하지 않음
 %> [<%=i%>] <%
 } else { // 현재 페이지가 아닌 경우 링크 설정
 %> <a href="comm_free.jsp?pageNum=<%=i%>">[<%=i%>]
				</a> <%
 }
 } // for end

 if (endPage < pageCount) { // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
 %> <a href="comm_free.jsp?pageNum=<%=startPage + 10%>">[다음]</a> <%
 }
 }
 %>
				</td>
			</tr>

		</table>
		<div style="height: 50px"></div>
		<button class="comm_table_new" type="button"
			onclick="location.href='comm_free_write.jsp'">글작성</button>
	</div>
</body>
</html>