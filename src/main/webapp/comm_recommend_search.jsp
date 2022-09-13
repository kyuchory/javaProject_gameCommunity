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
   String text = request.getParameter("text");
   text = "%"+text+"%";
   Connection conn = ConnectionProvider.getConnection();
   CommunityRecommendDaoImpl communityRecommendDaoImpl = new CommunityRecommendDaoImpl(conn);
   MemberDaoImpl memberDaoImpl = new MemberDaoImpl(conn);
   List<Community> list = communityRecommendDaoImpl.selectListSearch(text);
   
   
    
   

   %>
<jsp:include page="header_header.jsp" />
   <jsp:include page="main_banner.jsp" />
   <div class="comm_head_rec">
      <div class="comm_header">
         <div class="comm_header_index">
         <h1 style="color:white"><br>커뮤니티</h1>
         <p style="color:white">소식을 공유해 보세요</p>   
      </div>
         <div class="comm_header_tap">
            <span class="comm_header_tap_picked"><br>
            <a href="comm_recommend.jsp">게임추천</a></span><!--  
         --><span class="comm_header_tap_obj_rec"><br>
            <a style="color: white" href="comm_free.jsp">자유게시판</a></span><!--  
         --><span class="comm_header_tap_obj_rec"><br>
            <a style="color: white" href="comm_news.jsp">게임소식</a></span>
         </div>
      </div>
   </div>
   <div style="width: 67%; margin: auto">
      <div style="height: 150px"></div>
      <span class="comm_table_cap">게임추천</span>
      <form action="comm_recommend_search.jsp" method="get" class="comm_table_search">
         제목 : <input class="comm_table_search_input" type="text"
            name="text">
         <button class="comm_table_search_submit" type="submit">&#128269;</button>
      </form>
      <div style="height: 80px"></div>
      <table class="comm_table">

         <tr class="comm_table_head">
            <th style="width:58%">제목</th>
            <th class="comm_table_space"></th>
            <th style="width:19%">작성자(email)</th>
            <th class="comm_table_space"></th>
            <th style="width:19%">작성일</th>

         </tr>

         <%
      for(int i=0;i<list.size();i++){
         if(i>10){
            break;
         }
         Community board = list.get(i);
         
         
        
         %>
         <tr>
            <td><a href="comm_recommend_view.jsp?num=<%=board.getNum()%>"><%=board.getSubject()%></a></td>
            <th class="comm_table_space"></th>
            <td><%=board.getEmail()%></td>
            <th class="comm_table_space"></th>
            <td><%=board.getRegisterDateTime()%></td>
         </tr>
        
            

     
     
         <%} %>
          </table>
   </div> 
   <div style="height:200px"></div>
</body>
</html>