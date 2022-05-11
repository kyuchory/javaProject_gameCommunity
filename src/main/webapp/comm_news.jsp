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
<jsp:include page="header_header.jsp"/>
<jsp:include page="main_header1.jsp"/>
<div class="comm_head">
	<div class="comm_header">
		<div class="comm_header_index">
			<h1 style="color:white"><br>커뮤니티</h1>
			<p style="color:white">뭐라하지</p>	
		</div>
		<div class="comm_header_tap">
			<span class="comm_header_tap_obj"><br><a style="color:white" href="comm_recommend.jsp">추천</a></span><!--  
			--><span class="comm_header_tap_obj"><br><a style="color:white" href="comm_free.jsp">자유</a></span><!--  
			--><span class="comm_header_tap_picked"><br><a href="comm_news.jsp">게임소식</a></span>
		</div>
	</div>
</div>
<div style="width:67%; margin:auto">
	<div style="height:200px"></div>
	<span class="comm_table_cap">게임소식</span>
		<form action="#" method="get">
			제목 : <input type="text" name="subject">
			<button type="submit">돋보기모양</button>
		</form>
	<table class="comm_table">

		<tr class="comm_table_head">
			<th>제목</th>
			<th class="spacing">작성자</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td>행님들 피드백좀요</td>
			<td class="spacing">SKRKR도지</td>
			<td>2시간 전</td>
		</tr>
		<tr>
			<td>행님들 피드백좀요</td>
			<td class="spacing">SKRKR도지</td>
			<td>2시간 전</td>
		</tr>
		<tr>
			<td>행님들 피드백좀요</td>
			<td class="spacing">SKRKR도지</td>
			<td>2시간 전</td>
		</tr>
		<tr>
			<td>행님들 피드백좀요</td>
			<td class="spacing">SKRKR도지</td>
			<td>2시간 전</td>
		</tr>

</table>
<button type="button" onclick="location.href='comm_news_write.jsp'">글작성</button>
</div>
</body>
</html>