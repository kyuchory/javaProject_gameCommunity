<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="dto.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.lang.NullPointerException"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 목록</title>
<link href="game_list.css?after" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="header_header.jsp"/>
<jsp:include page="main_banner.jsp"/>
<%List<Game> list = (List<Game>)session.getAttribute("gameList");
String genres[] = request.getParameterValues("genre");
%>

<section>
	<div id="contents">
		<div id="select-bar">
			<form method="get" action="game_list_process.jsp">
			<ul>
				<li>장르 :&nbsp;</li>
				<li><input type="checkbox" id="all-box" class="check-box" name="genre" value="all" checked onclick="allCheck(event)"><label class="all" for="all-box" >전체</label></li>
				<li><input type="checkbox" id="AOS-box" class="check-box" name="genre" value="AOS" onclick="checkAllList(event)"><label class="all" for="AOS-box" >AOS</label></li>
				<li><input type="checkbox" id="RPG-box" class="check-box" name="genre" value="RPG" onclick="checkAllList(event)"><label class="all" for="RPG-box" >RPG</label></li>
				<li><input type="checkbox" id="FPS-box" class="check-box" name="genre" value="FPS" onclick="checkAllList(event)"><label class="all" for="FPS-box" >FPS</label></li>
				<li><input type="checkbox" id="action-box" class="check-box" name="genre" value="action" onclick="checkAllList(event)"><label class="all" for="action-box" >액션</label></li>
				<li><input type="checkbox" id="simulation-box" class="check-box" name="genre" value="simulation" onclick="checkAllList(event)"><label class="all" for="simulation-box" >전략시뮬</label></li>
				<li><input type="checkbox" id="sport-box" class="check-box" name="genre" value="sport" onclick="checkAllList(event)"><label class="all" for="sport-box" >스포츠,레이싱</label></li>
			</ul>
			<input type="submit" value="검색" class="search">
			</form>
		</div>
		
		<div id="game-lists">
			<%try { 
				for(Game game:list) { %>
					<div class="game-element">
						<a href='https://search.naver.com/search.naver?query=<%=game.getName()%>' target="blank">
							<img src="<%=game.getImg()%>" width='75px' height='75px'/>
							<div class='texts'>
								<div class="title"><%=game.getName()%><span class="company"><%=game.getCompany()%></span></div>
								<div class="rank">게임순위 : <%=game.getRank()%></div>
								<div class="genre">장르 : <%=game.getGenre()%></div>
								<div class='payment'><%=game.getPayment()%></div>
							</div>
						</a>
					</div>
				<%} 
				} catch (NullPointerException e) { 
					
				}%>
			
		</div>
	</div>
</section>
<jsp:include page="header_footer.jsp"/>
<script>
	function allCheck(e) { // 전체 체크 버튼 클릭시 전체 체크 및 해제
		if(e.target.checked) {
			document.querySelectorAll(".check-box").forEach(function(v, i) {
				v.checked = true;
			});
		} else {
			document.querySelectorAll(".check-box").forEach(function(v, i) {
				v.checked = false;
			});
		}
	}
	function checkAllList(e) {
		let checkCount = 0;
		document.querySelectorAll(".check-box").forEach(function(v, i) {
			if(v.checked === false){
				checkCount++;
			}
		});
		if(checkCount>0) {
			document.getElementById("all-box").checked = false;
		} else if(checkCount === 0) {
			document.getElementById("all-box").checked = true;
		}
	}
	
	function checkByRequest(genre) {
		document.getElementById(genre).checked = true;
	}
</script>
</body>
</html>
