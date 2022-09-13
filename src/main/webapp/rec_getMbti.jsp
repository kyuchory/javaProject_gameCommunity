<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.rec_devide{
width:0;
margin:0;
padding:0;
border:1px solid #dddddd;
margin-top:32px;
}
.rec_select {
    padding: 15px 10px;
}
.rec_select input[type=radio]{
    display: none;
}
.rec_select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 50px;
    width:100%;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:40px;
    
}
.rec_select input[type=radio]+label{
    background-color: #fff;
    color: #333;
    line-height: 45px;
}
.rec_select input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}
.rec_selec {
    padding: 15px 10px;
}
.rec_selec input[type=radio]{
    display: none;
}
.rec_selec input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 50px;
    width:100%;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:40px;
    line-height:20px;
    
}
.rec_selec input[type=radio]+label{
    background-color: #fff;
    color: #333;
    line-height: 45px;
}
.rec_selec input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}
.rec_sele {
    padding: 15px 10px;
}
.rec_sele input[type=radio]{
    display: none;
}
.rec_sele input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 50px;
    width:100%;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:40px;
    line-height:20px;
    
}
.rec_sele input[type=radio]+label{
    background-color: #fff;
    color: #333;
    line-height: 45px;
}
.rec_sele input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}
.rec_sel {
    padding: 15px 10px;
}
.rec_sel input[type=radio]{
    display: none;
}
.rec_sel input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 50px;
    width:100%;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:40px;
    line-height:20px;
    
}
.rec_sel input[type=radio]+label{
    background-color: #fff;
    color: #333;
    line-height: 45px;
}
.rec_sel input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}
.rec_mbti_input{
height:4px;
width:70px;
margin:0;}
</style>
</head>
<body>
<jsp:include page="header_header.jsp" />
<jsp:include page="main_banner.jsp" />
<div style="margin-top:100px;text-align:center">
<form action="rec_mbti.jsp" method="get"><div style="font-size:60px">
본인의 MBTI를 입력 해 주세요 <br>
<div style="width: 30%;margin: auto;display: flex;justify-content: space-between;height: 180px;">
				<div class="rec_select" style="width:10%">
  				   <input type="radio" id="rec_select" name="e"value="i" checked><label for="rec_select">I</label><br>
  				   <input type="radio" id="rec_select2" name="e"value="e"><label for="rec_select2">E</label>
				</div>
				<div class="rec_devide"></div>
				<div class="rec_selec" style="width:10%">
  				   <input type="radio" id="rec_selec" name="n"value="n"><label for="rec_selec">N</label><br>
  				   <input type="radio" id="rec_selec2" name="n"value="s"checked><label for="rec_selec2">S</label>
				</div>
				<div class="rec_devide"></div>
				<div class="rec_sele" style="width:10%">
  				   <input type="radio" id="rec_sele" name="t"value="t"checked><label for="rec_sele">T</label><br>
  				   <input type="radio" id="rec_sele2" name="t"value="f"><label for="rec_sele2">F</label>
				</div>
				<div class="rec_devide"></div>
				<div class="rec_sel" style="width:10%">
  				   <input type="radio" id="rec_sel" name="j"value="j"><label for="rec_sel">J</label><br>
  				   <input type="radio" id="rec_sel2" name="j"value="p"checked><label for="rec_sel2">P</label>
				</div>
				
	<!-- <select name="e" class="rec_mbti_input">
		<option value="i">I</option>
		<option value="e">E</option>
	</select>
	<select name="n" class="rec_mbti_input">
		<option value="n">N</option>
		<option value="s">S</option>
	</select>
	<select name="t" class="rec_mbti_input">
		<option value="t">T</option>
		<option value="f">F</option>
	</select>
	<select name="j" class="rec_mbti_input">
		<option value="p">P</option>
		<option value="j">J</option>
	</select> -->
<input style="margin-top:85px;cursor:pointer;margin-left:20px;height:45px;width:100px;border:none;color:white;background-color:#393e46;"type="submit"/></div></div></form>

<a style="margin:100px" href="https://www.16personalities.com/ko">mbti검사 하러가기(10~15분 소요)</a>
<a style="margin:100px" href="rec_mbtiTest.jsp">초간단 mbti 테스트(20초 소요)</a>
</div>
<div style="height:200px"></div>
<jsp:include page="header_footer.jsp" />

</body>


</html>