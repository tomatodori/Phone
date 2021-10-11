<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<%@ page import="java.util.*" %>
<%

   String user_id = "";

   if(session.getAttribute("user_id")!=null)
      user_id=(String)session.getAttribute("user_id");

   Tab_Cart cart = new Tab_Cart();

   int CurrentPage = 1;

   String pageNum = request.getParameter("pageNum");
   if(pageNum!=null)
      CurrentPage = Integer.parseInt(pageNum);

   
   int RowCount = Common.RowCount("cart", "user_id", user_id);
   
   int MaxPage = (RowCount%10!=0) ? (RowCount/10+1) : RowCount/10;
   
   int startPage = (CurrentPage % 10 != 0) ? CurrentPage/10 * 10 + 1 : (CurrentPage/10-1) * 10 + 1;
   
   int endPage = (startPage + 9 > MaxPage) ? MaxPage : startPage + 9;
   
   int Plus10_Page = (CurrentPage + 10 > MaxPage) ? MaxPage : CurrentPage + 10;
   
   int Minus10_Page = (CurrentPage - 10 < 1) ? 1 : CurrentPage - 10;
   
   int StartNum = RowCount - (CurrentPage -1) * 10;
   
   ArrayList<GetSet> Page = cart.Page_MyCart(user_id, StartNum);
   
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
	$('input[name="order"]').click(function(){
		$('input:hidden').val("order");
		$('form[name="cart"]').submit();
	})
	$('input[name="delete"]').click(function(){
		var ask = confirm('선택하신 상품을 장바구니에서 삭제하시겠습니까?');
		if(ask){
			$('input:hidden').val("delete");
			$('form[name="cart"]').submit();	
		}
		
	})
})
</script>
<title>개인 회원별 장바구니</title>
<style type="text/css">
h2 {margin-top: 20px;margin-bottom: 20px;}
</style>
<body>
   <h2><%=user_id %>님의 장바구니</h2>
   <article>
   	 <form name="cart" action="../Back/Cart_Process.jsp" method="post">
      <div class="container">
         <div class="table-responsive">
        
            <table class="table table-striped table-sm">
               <colgroup>
                  <col style="width: 20%;" />
                  <col style="width: 20%;" />
                  <col style="width: 20%;" />
                  <col style="width: 20%;" />
                  <col style="width: 20%;" />
               </colgroup>
               <thead>
                  <tr>
                     <th>NO</th>
                     <th>상품 이미지</th>
                     <th>상품 이름</th>
                     <th>상품수량</th>
                     <th>가격</th>
                  </tr>
               </thead>
               <tbody>
               <%for (int i = 0; i < Page.size(); i++) {%>
               <tr height="50">
                     <td><input type="radio" name="cart_nums" value="<%=Page.get(i).getCart_no() %>"> <%=Page.get(i).getCart_no()%></td>
                     <td>
                     	<a href="mainPage.jsp?center=itemDetail.jsp&item_no=<%=Page.get(i).getItem_no()%>">
                     		<img alt="image" src="../img/<%=Page.get(i).getItem_photo()%>" width="100" align="left">
                     	</a>	
                	</td>
                     
                     <td><%=Page.get(i).getCart_item() %></td>
                     <td><%=Page.get(i).getCart_amount() %></td>
                     <td><%=Page.get(i).getCart_amount() * Page.get(i).getItem_price() %>원</td>
               </tr>   
               <%} %>
               <%for (int i = Page.size(); i < 10; i++) {%>
                  <tr height="50">
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
      		<input type="hidden" value="" name="command">
			<%if(Page.size()!=0) {%>
			<input class="btn btn-secondary" type="button" value="선택상품 주문" name="order" >&nbsp;
			<input class="btn btn-secondary" type="button" value="선택상품 삭제" name="delete" >&nbsp;
			<%}%>
			<input class="btn btn-secondary" type="button" onclick="location.href='mainPage.jsp?center=MyBuy.jsp'" value="주문내역 보기">&nbsp;
	  </div>
	   </form><br>
      <div class="col text-center">
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="mainPage.jsp?center=MyCart.jsp&pageNum=1">처음으로</a>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="mainPage.jsp?center=MyCart.jsp&pageNum=<%=Minus10_Page %>">-10</a>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info"
      <%if(CurrentPage>1) {%>
         href="mainPage.jsp?center=MyCart.jsp&pageNum=<%=CurrentPage-1 %>"
      <%}else{ %>
         href="#"
      <%} %>
      >이전</a>
      <%for(int i=startPage;i<=endPage;i++){ %>
         <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="mainPage.jsp?center=MyCart.jsp&pageNum=<%=i %>"><%=i %></a>
      <%} %>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" 
      <%if(CurrentPage<MaxPage){ %>
         href="mainPage.jsp?center=MyCart.jsp&pageNum=<%=CurrentPage+1 %>"
      <%}else{ %>
         href="#"
      <%} %>
      >다음</a>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="mainPage.jsp?center=MyCart.jsp&pageNum=<%=Plus10_Page %>">+10</a>   
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="mainPage.jsp?center=MyCart.jsp&pageNum=<%=MaxPage %>">끝으로</a>   
      </div>
     
   </article>
</body>
</html>