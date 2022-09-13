<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#banner {
line-height:100px;
text-align:center;
overflow:hidden;
height:100px;
border-bottom:2px solid #dddddd;
}
#banner>a {
position:absolute;
left:0;
}
#banner>a>img{
height:50px;

}
#banner .main-menu {
-webkit-padding-start:0px;
overflow:hidden;
display:inline-block;
}
#banner .main-menu li{
width:300px;
float:left;
text-align:center;
list-style:none;
font-size:1.5em;
right:0;
}
#banner .slide-menu {
width:100%;
position:absolute;
display:none;  /*마우스 오버 시 보이게*/
font-size:1.2em;
line-height:50px;
z-index:1;
opacity:0.95;
text-align:center;
top:170px;
}
#banner .slide-menu>ul {
display:inline-block;
-webkit-padding-start:0px;
background:white;
border-left:2px solid #dddddd;
border-right:2px solid #dddddd;
border-bottom:2px solid #dddddd;
border-radius:0 0 10px 10px;
}
#banner .slide-menu li{
width:300px;
float:left;
text-align:center;
list-style:none;
}
#banner .slide-menu a {
color:black;
}
.main_banner_li{
   display:inline-block;
   margin:0;
   text-transform:uppercase;
   width:60%
}
.main_banner_li:after{
   display:block;
   content: "";
   border-bottom: solid 3px #6aeee3;  
   transform: scaleX(0);  
   transition: transform 250ms ease-in-out;
}
.main_banner_li:hover:after{
transform: scaleX(1);

}
.main_banner_uli:hover:after{
transform: scaleX(1);

}


</style>
</head>
<body>
<div id="banner">
   <a href="index.jsp"><img src="image/logo2.png" alt="dankook-logo" style="width:100px; height:100px"/></a>
   <ul class='main-menu mouseon'>
      <li class="main_banner_uli">게임추천</li>
      <li class="main_banner_uli">커뮤니티</li>
      <li class="main_banner_uli">게임목록</li>
      <li class="main_banner_uli">프로필</li>
   </ul>
   <div class='slide-menu'>
      <ul class="mouseon">
         <li>
            <ul class='inner-ul'>
               <li><div class="main_banner_li" style="width:50%"><a href="rec_getMbti.jsp">MBTI별</a></div></li>
               <li><div class="main_banner_li" style="width:50%"><a href="rec_member.jsp">사용자별 추천</a></div></li>
            </ul>
         </li>
         <li>
            <ul class='inner-ul'>
               <li><div class="main_banner_li" style="width:50%"><a href="comm_free.jsp">자유게시판</a></div></li>
               <li><div class="main_banner_li" style="width:50%"><a href="comm_recommend.jsp">추천게시판</a></div></li>
               <li><div class="main_banner_li" style="width:50%"><a href="comm_news.jsp">게임소식</a></div></li>
               <li><a href="#none"></a></li>
            </ul>
         </li><li>
            <ul class='inner-ul'>
               <li><div class="main_banner_li" style="width:50%"><a href="game_list_process.jsp?genre=all">전체</a></div></li>
               <li><div class="main_banner_li" style="width:50%"><a href="game_list_process.jsp?genre=FPS">FPS</a></div></li>
               <li><div class="main_banner_li" style="width:50%"><a href="game_list_process.jsp?genre=RPG">RPG</a></div></li>
            </ul>
         </li><li>
            <ul class='inner-ul'>
              <li><div class="main_banner_li" style="width:50%"><a href="#none">출석체크</a></div></li>
               <li><div class="main_banner_li" style="width:50%"><a href="profile_mypage.jsp">회원정보</a></div></li>
            </ul>
         </li>
      </ul>
   </div>
</div>
<script>
   const mouseon = document.getElementsByClassName("mouseon");
   const slideMenu = document.querySelector(".slide-menu");
   
   for(let i = 0; i < mouseon.length; i++){
      mouseon[i].addEventListener("mouseover", function(){
          slideMenu.style.display="block";
      });
      mouseon[i].addEventListener("mouseout", function(){
          slideMenu.style.display="none";
      });
   }
   

</script>
</body>
</html>