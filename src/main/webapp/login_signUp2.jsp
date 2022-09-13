<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입(2)</title>
<link rel="stylesheet" href="login_login.css?after"/>
<style>
.select {
    padding: 15px 10px;
}
.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 50px;
    width: 48.5%;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:40px;
    
}
.select input[type=radio]+label{
    background-color: #fff;
    color: #333;
    line-height: 45px;
}
.select input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}
.selec {
    padding: 15px 10px;
}
.selec input[type=radio]{
    display: none;
}
.selec input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 50px;
    width: 31.7%;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:20px;
    line-height:20px;
    
}
.selec input[type=radio]+label{
    background-color: #fff;
    color: #333;
    line-height: 45px;
}
.selec input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}
</style>
</head>
<body>

<%
 request.setCharacterEncoding("utf-8");
 String email = request.getParameter("email");
 String password = request.getParameter("password");
 String name = request.getParameter("name");
%>
<jsp:include page="header_header.jsp"/>
<div style=height:100px></div>
<div class="layoutDku">
	<div class="title">게임추천정보</div>
	
	<form action="login_registerProcess.jsp" method="post">
	<div style=height:35px></div>
	<table class="table1">
	<tr>
			<td class="name1" style="text-align:center">연령</td>
				<td ><select name="age" class="input2">
					 <option value="null">선택</option>
	   		 	   	 <option value="11">0~11세</option>
	   				 <option value="14">12~14</option>
	   				 <option value="17">15~17</option>
	   				 <option value="18">18세이상</option>
	   				 </select><!-- 
			<td class="name1">연령</td>
			<td ><input type="text" class="input2" name="age" placeholder="나이를 입력해 주세요"></td> -->
		</tr>
		<tr>
			<td class="name1" style="text-align:center">선호하는<br>장르</td>
			<td ><select name="genre" class="input2">
				 <option value="null">선택</option>
   		 	   	 <option value="액션">액션</option>
   				 <option value="RPG">RPG</option>
   				 <option value="FPS">FPS</option>
   				 <option value="AOS">AOS</option>
   				 <option value="스포츠">스포츠</option>
   				 <option value="리듬액션">리듬액션</option>
   				 <option value="전략시뮬">전략시뮬</option>
   				 <option value="어드벤쳐">어드벤쳐</option>
</select></td>
		</tr>
		<tr>
			<td class="name1"style="text-align:center;">2D/3D<br> 선호도</td>
			<td>
				<div class="select">
  				   <input type="radio" id="select" name="graphic"value="2D"><label for="select">2D</label>
  				   <input type="radio" id="select2" name="graphic"value="3D"><label for="select2">3D</label>
				</div>
			</td>
		</tr>
		<tr>
			<td class="name1"style="text-align:center;">과금 성향</td><td>
			<div class="selec">
			<!-- <td class="name2"><input type="radio" class="inputRadio" name="pay" value="yes">O
			<input type="radio" class="inputRadio" name="pay" value="well">상관없음
			<input type="radio" class="inputRadio" name="pay" value="no">X -->
			<!-- <button type="button" class="input2"style="text-align:center;height:50px;width:29%;">과금</button>
			<button type="button" class="input2"style="text-align:center;height:50px;width:29%;">무과금</button>
			<button type="button" class="input2"style="text-align:center;height:50px;width:29%;">상관없음</button> -->
			<input type="radio" id="selec" name="pay"value="yes"><label for="selec">과금</label>
  			<input type="radio" id="selec2" name="pay"value="no"><label for="selec2">무과금</label> 
  			<input type="radio" id="selec3" name="pay"value="well"><label for="selec3">상관없음</label>

  			<!-- <input type="radio" id="AOS-box" class="check-box" name="pay" value="yes" onclick="checkAllList(event)"><label class="all" for="AOS-box" >과금</label>
			<input type="radio" id="RPG-box" class="check-box" name="pay" value="no" onclick="checkAllList(event)"><label class="all" for="RPG-box" >무과금</label>
			<input type="radio" id="FPS-box" class="check-box" name="pay" value="well" onclick="checkAllList(event)"><label class="all" for="" >상관없음</label> -->
			</div>
			</td>
			
		</tr>
		
		
		
		
		
		
	</table>
	<div style=height:20px></div>
	<input type="submit" value="다음" class="next" style="cursor:pointer;">
	<input type="reset" value="새로입력" class="reset" style="cursor:pointer;">
	<input type="hidden" name="email" value="<%=email%>"/>
	<input type="hidden" name="password" value="<%=password%>"/>
	<input type="hidden" name="name" value="<%=name%>"/>
	</form>

</div>
</body>
</html>