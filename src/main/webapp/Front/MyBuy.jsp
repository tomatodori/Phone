<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<%@ page import="java.util.*" %>
<%
   String user_id = "";

   if(session.getAttribute("user_id")!=null)
      user_id=(String)session.getAttribute("user_id");

   Tab_Buy buy = new Tab_Buy();

   int CurrentPage = 1;

   String pageNum = request.getParameter("pageNum");
   if(pageNum!=null)
      CurrentPage = Integer.parseInt(pageNum);

   
   int RowCount = Common.RowCount("buy", "user_id", user_id);
   
   int MaxPage = (RowCount%10!=0) ? (RowCount/10+1) : RowCount/10;
   
   int startPage = (CurrentPage % 10 != 0) ? CurrentPage/10 * 10 + 1 : (CurrentPage/10-1) * 10 + 1;
   
   int endPage = (startPage + 9 > MaxPage) ? MaxPage : startPage + 9;
   
   int Plus10_Page = (CurrentPage + 10 > MaxPage) ? MaxPage : CurrentPage + 10;
   
   int Minus10_Page = (CurrentPage - 10 < 1) ? 1 : CurrentPage - 10;
   
   int StartNum = RowCount - (CurrentPage -1) * 10;
   
   ArrayList<GetSet> Page = buy.Page_MyBuy(user_id, StartNum);
   
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
})
</script>
<title>개인 회원별 장바구니</title>
<style type="text/css">
h2 {margin-top: 20px;margin-bottom: 20px;}
</style>
<body>
   <h2 align="center"><%=user_id %>님의 구매목록</h2>
   <article>
      <div class="container">
         <div class="table-responsive">
        
            <table class="table table-striped table-sm">
               <thead>
                  <tr>
                     <th>구매단계</th>
                     <th>상품 이미지</th>
                     <th>상품 이름</th>
                     <th>상품수량</th>
                     <th>구매가격</th>
                     <th>구매일자</th>
                  </tr>
               </thead>
               <tbody>
               <%for (int i = 0; i < Page.size(); i++) {%>
	               <tr height="50">
               		 <td>
	                     <%switch(Page.get(i).getBuy_type()){ 
	                     case 0:%>
	                     	구매신청
	                     <%break;
	                     case 1:%>
	                     	배송중
	                     <%break;
	                     case 2:%>
	                     	배송완료
	                     <%break;
	                     case 3:%>
	                     	취소(환불)대기
	                     <%break;
	                     case 4:%>
	                     	취소(환불)완료
	                     <%break;	
	                     } %>
                     </td>
                     <td>
                     	<a href="mainPage.jsp?center=itemDetail.jsp&item_no=<%=Page.get(i).getItem_no()%>">
                     		<img alt="image" src="../img/<%=Page.get(i).getItem_photo()%>" width="100" align="left">
                     	</a>	
                	 </td>
                     <td>
                     	<a href="mainPage.jsp?center=buyDetail.jsp&buy_no=<%=Page.get(i).getBuy_no() %>">
                     		<%=Page.get(i).getCart_item() %>
                     	</a>
                     </td>
                     <td><%=Page.get(i).getCart_amount() %></td>
                     <td><%=Page.get(i).getCart_amount() * Page.get(i).getItem_price() %>원</td>
                     <td><%=Page.get(i).getBuy_date() %></td>
	               </tr>   
               <%} %>
               <%for (int i = Page.size(); i < 10; i++) {%>
                  <tr height="50">
                     <td>&nbsp;</td>
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
			<input class="btn btn-secondary" type="button" onclick="location.href='mainPage.jsp?center=MyCart.jsp'" value="장바구니 보기">&nbsp;
	  </div>
	  <br>
      <div class="col text-center">
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="mainPage.jsp?center=MyBuy.jsp&pageNum=1">처음으로</a>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="mainPage.jsp?center=MyBuy.jsp&pageNum=<%=Minus10_Page %>">-10</a>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info"
      <%if(CurrentPage>1) {%>
         href="mainPage.jsp?center=MyBuy.jsp&pageNum=<%=CurrentPage-1 %>"
      <%}else{ %>
         href="#"
      <%} %>
      >이전</a>
      <%for(int i=startPage;i<=endPage;i++){ %>
         <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="mainPage.jsp?center=MyBuy.jsp&pageNum=<%=i %>"><%=i %></a>
      <%} %>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" 
      <%if(CurrentPage<MaxPage){ %>
         href="mainPage.jsp?center=MyBuy.jsp&pageNum=<%=CurrentPage+1 %>"
      <%}else{ %>
         href="#"
      <%} %>
      >다음</a>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="mainPage.jsp?center=MyBuy.jsp&pageNum=<%=Plus10_Page %>">+10</a>   
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="mainPage.jsp?center=MyBuy.jsp&pageNum=<%=MaxPage %>">끝으로</a>   
      </div>
     
   </article>
</body>
</html>