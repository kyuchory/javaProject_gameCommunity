<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="comm_comm.css?after">
</head>
<body>
<jsp:include page="header_header.jsp"/>
<jsp:include page="main_banner.jsp"/>
<div class="comm_head_free">
	<div class="comm_header">
		<div class="comm_header_index">
			<h1 style="color:white"><br>커뮤니티</h1>
			<p style="color:white">소식을 공유해 보세요</p>	
		</div>
		<div class="comm_header_tap">
			<span class="comm_header_tap_obj_free"><br><a style="color:white" href="comm_recommend.jsp">게임추천</a></span><!--  
			--><span class="comm_header_tap_picked"><br><a  href="comm_free.jsp">자유게시판</a></span><!--  
			--><span class="comm_header_tap_obj_free"><br><a style="color:white"href="comm_news.jsp">게임소식</a></span>
		</div>
	</div>
</div>
<div style="height:150px"></div>
<div style="width:67%;margin:auto">
	<span class="comm_table_cap">글쓰기</span>
	<div style="height:80px"></div>
	<div class="comm_write_box">
		<form action="comm_free_writeProcess.jsp" method="post">
			<div class="comm_write_box_sub"> 
				 제목 &nbsp;&nbsp;<input class="comm_write_box_sub_input" type="text" name="subject" placeholder="제목을 입력하세요" >
			 </div>
			<textarea class="comm_write_box_cont" placeholder="여기에 내용을 입력하세요" name="content"></textarea>
			<div style="height:100px"></div>
			<div style="text-align:center">
				<button class="comm_write_box_submit" type="submit">등록하기</button>
				<button class="comm_write_box_reset" type="reset">새로입력</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>