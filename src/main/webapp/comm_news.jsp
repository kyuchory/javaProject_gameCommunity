<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="comm_comm.css">
</head>
<body>
<%-- <jsp:include page="header_header.jsp"/>
<jsp:include page="main_header1.jsp"/> --%>
<div class="comm_head_news">
	<div class="comm_header">
		<div class="comm_header_index">
			<h1 style="color:white"><br>커뮤니티</h1>
			<p style="color:white">뭐라하지</p>	
		</div>
		<div class="comm_header_tap">
			<span class="comm_header_tap_obj_news"><br><a style="color:white" href="comm_recommend.jsp">추천</a></span><!--  
			--><span class="comm_header_tap_obj_news"><br><a style="color:white" href="comm_free.jsp">자유</a></span><!--  
			--><span class="comm_header_tap_picked"><br><a href="comm_news.jsp">게임소식</a></span>
		</div>
	</div>
</div>
<div style="width:67%; margin:auto">
	<div style="height:200px"></div>
	<span class="comm_table_cap">게임소식</span>
		<form action="#" method="get" class="comm_table_search">
			제목 : <input class="comm_table_search_input" type="text" name="subject">
			<button class="comm_table_search_submit" type="submit">&#128269;</button>
		</form>
		<div style="height:80px"></div>
	<table class="comm_table">

		<tr class="comm_table_head">
			<th>제목</th>
			<th class="comm_table_space"></th>
			<th class="spacing">작성자(email)</th>
			<th class="comm_table_space"></th>
			<th>작성일</th>
			
		</tr>
		
		<tr>
			<td>행님들 피드백좀요</td>
			<th class="comm_table_space"></th>
			<td class="spacing">SKRKR도지</td>
			<th class="comm_table_space"></th>
			<td>2시간 전</td>
		</tr>
		<tr>
			<td>행님들 피드백좀요</td>
			<th class="comm_table_space"></th>
			<td class="spacing">SKRKR도지</td>
			<th class="comm_table_space"></th>
			<td>2시간 전</td>
		</tr>
		<tr>
			<td>행님들 피드백좀요</td>
			<th class="comm_table_space"></th>
			<td class="spacing">SKRKR도지</td>
			<th class="comm_table_space"></th>
			<td>2시간 전</td>
		</tr>
		<tr>
			<td>행님들 피드백좀요</td>
			<th class="comm_table_space"></th>
			<td class="spacing">SKRKR도지</td>
			<th class="comm_table_space"></th>
			<td>2시간 전</td>
		</tr>

</table>
<div style="height:50px"></div>
<button class="comm_table_new" type="button" onclick="location.href='comm_news_write.jsp'">글작성</button>
</div>
</body>
</html>