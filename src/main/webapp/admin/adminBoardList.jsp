<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="MVC.*" %>
<% 
   

   String Table = "board";
   int board_type = Integer.parseInt(request.getParameter("board_type"));   

   String board_category = (board_type==0) ? "QnA" : "리뷰" ;
   
   int CurrentPage = 1;
   
   String pageNum = request.getParameter("pageNum");
   if(pageNum!=null)
      CurrentPage = Integer.parseInt(pageNum);
   
   if(CurrentPage < 1 )
      CurrentPage = 1;
   
   Tab_Board board = new Tab_Board();

   int RowCount = Common.RowCount("board", "board_type", board_type);
   
   int ContentBlock = 10;
   
   int MaxPage = (RowCount%10!=0) ? RowCount/10 + 1 : RowCount/10;
   
 
   
   int startPage = ( CurrentPage -1 ) / 10 * 10 + 1;   
   
 
   int endPage = (startPage + 9 > MaxPage) ? MaxPage : startPage + 9;
   
  
   
   int Plus10_Page = (CurrentPage + 10 > MaxPage) ? MaxPage : CurrentPage + 10;
   
   int Minus10_Page = (CurrentPage - 10 < 1) ? 1 : CurrentPage - 10;
   
   int StartNum = RowCount - ( CurrentPage -1 ) * 10 ;   
   
   ArrayList<GetSet> Page = board.Page_BoardType(StartNum, board_type);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
   integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
   crossorigin="anonymous">
<title>board</title>
<style type="text/css">
h2 {margin-top: 20px;margin-bottom: 20px;}
</style>
<body>
   <h2><%=board_category %> 게시판</h2>
   <article>
      <div class="container">
         <div class="table-responsive">
            <table class="table table-striped table-sm">
               <colgroup>
                  <col style="width: 5%;" />
                  <col style="width: auto;" />
                  <col style="width: 15%;" />
                  <col style="width: 10%;" />
                  <col style="width: 10%;" />
               </colgroup>
               <thead>
                  <tr>
                     <th>NO</th>
                     <th>글제목</th>
                     <th>작성자</th>
                     <th>조회수</th>
                     <th>작성일</th>
                  </tr>
               </thead>
               <tbody>
               <%for (int i = 0; i < Page.size(); i++) {%>
               <tr>
                  <td><%=Page.get(i).getBoard_no()%></td>
                  <td><a href="adminMain.jsp?center=adminBoardInfo.jsp?board_no=<%=Page.get(i).getBoard_no() %>" style="text-decoration: none"><%=Page.get(i).getTitle()%></a></td>
                  <td><%=Page.get(i).getUser_id()%></td>
                  <td><%=Page.get(i).getReadcount()%></td>
                  <td><%=Page.get(i).getReg_date()%></td>
               </tr>   
               <%}%>
               <%for (int i = Page.size(); i < 10; i++) {%>
                  <tr>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                  </tr>
               <%}%>
               </tbody>
            </table>
         </div>
      </div>
      <div class="col text-center">
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="adminMain.jsp?center=adminBoardList.jsp&board_type=<%=board_type%>">처음으로</a>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="adminMain.jsp?center=adminBoardList.jsp&board_type=<%=board_type%>&pageNum=<%=Minus10_Page %>">-10</a>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info"
      <%if(CurrentPage>1) {%>
         href="adminMain.jsp?center=adminBoardList.jsp&board_type=<%=board_type%>&pageNum=<%=CurrentPage-1 %>"
      <%}else{ %>
         href="#"
      <%} %>
      >이전</a>
      <%for(int i=startPage;i<=endPage;i++){ %>
         <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="adminMain.jsp?center=adminBoardList.jsp&board_type=<%=board_type%>&pageNum=<%=i %>"><%=i %></a>
      <%} %>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info"
      <%if(CurrentPage<MaxPage){ %>
         href="adminMain.jsp?center=adminBoardList.jsp&board_type=<%=board_type%>&pageNum=<%=CurrentPage+1 %>"
      <%}else{ %>
         href="#"
      <%} %>
      >다음</a>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="adminMain.jsp?center=adminBoardList.jsp&board_type=<%=board_type%>&pageNum=<%=Plus10_Page %>">+10</a>   
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="adminMain.jsp?center=adminBoardList.jsp&board_type=<%=board_type%>&pageNum=<%=MaxPage %>">끝으로</a>   
      </div>
   </article>
</body>
</html>