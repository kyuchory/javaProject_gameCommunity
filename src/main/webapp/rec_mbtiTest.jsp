<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="login_login.css?after"/>
</head>
<body>
<jsp:include page="header_header.jsp" />
<jsp:include page="main_banner.jsp" />

<div style=height:100px></div>

<div class="layoutDku">
	<div class="title">초간단 mbti테스트</div>
	<form action="rec_mbtiResult.jsp" method="post">
	<div style=height:35px></div>
	<table class="table1">
		<tr>
			<tr>
			<td class="name1">1.학창시절 인기가 많았나요?</td>
			<td style="width:50px"></td>
			<td class="name2"><input type="radio" class="inputRadio" name="E" value="E" checked>예
			<input type="radio" class="inputRadio" name="E" value="I">아니요
			</td>
		</tr>
		<tr>
			<td class="name1">2.운동을 잘하나요?</td>
			<td style="width:50px"></td>
			<td class="name2"><input type="radio" class="inputRadio" name="N" value="S" checked>예
			<input type="radio" class="inputRadio" name="N" value="N">아니요
			</td>
		</tr>
		<tr>
			<tr>
			<td class="name1">3.수학을 잘하나요?</td>
			<td style="width:50px"></td>
			<td class="name2"><input type="radio" class="inputRadio" name="T" value="T" checked>예
			<input type="radio" class="inputRadio" name="T" value="F">아니요
			</td>
		</tr>
		<tr>
			<tr>
			<td class="name1">4.방이 항상 깨끗한가요?</td>
			<td style="width:50px"></td>
			<td class="name2"><input type="radio" class="inputRadio" name="J" value="J" checked>예
			<input type="radio" class="inputRadio" name="J" value="P">아니요
			</td>
		</tr>
	</table>
	<div style=height:20px></div>
	<input type="submit" value="제출" class="button1" style="cursor:pointer;">
	</form>

</div>
<div style="height:80px;"></div>
<jsp:include page="header_footer.jsp" />
</body>
</html>