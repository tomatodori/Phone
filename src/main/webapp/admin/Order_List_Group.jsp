<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="MVC.*"%>
<%
	int buy_type = Integer.parseInt(request.getParameter("buy_type"));

	String buy_category = "";

	switch (buy_type) {
	case 0:
		buy_category = "주문 신청 목록";
		break;
	case 1:
		buy_category = "주문 배송 목록";
		break;
	case 2:
		buy_category = "주문 완료 목록";
		break;
	case 3:
		buy_category = "환불 신청 목록";
		break;
	case 4:
		buy_category = "환불 완료 목록";
		break;
	}

	int CurrentPage = 1;
	
	String pageNum = request.getParameter("pageNum");
	if (pageNum != null)
		CurrentPage = Integer.parseInt(pageNum);
	
	Tab_Buy buy = new Tab_Buy();
	
	int RowCount = Common.RowCount("buy", "buy_type", buy_type);
	
	int MaxPage = (RowCount % 10 != 0) ? (RowCount / 10 + 1) : RowCount / 10;
	
	int startPage = (CurrentPage % 10 != 0) ? CurrentPage / 10 * 10 + 1 : (CurrentPage / 10 - 1) * 10 + 1;
	
	int endPage = (startPage + 9 > MaxPage) ? MaxPage : startPage + 9;
	
	int Plus10_Page = (CurrentPage + 10 > MaxPage) ? MaxPage : CurrentPage + 10;
	
	int Minus10_Page = (CurrentPage - 10 < 1) ? 1 : CurrentPage - 10;
	
	int StartNum = RowCount - (CurrentPage - 1) * 10;
	
	ArrayList<GetSet> Page = buy.Page_BuyType(buy_type, StartNum);

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
<title>Order_List_Group</title>
<style type="text/css">
h2 {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>
<body>
	<h2><%=buy_category %></h2>
	 <article>
      <div class="container">
         <div class="table-responsive">
            <table class="table table-striped table-sm">
               <colgroup>
                  <col style="width: auto;" />
                  <col style="width: auto;" />
                  <col style="width: auto;" />
                  <col style="width: auto;" />
                  <col style="width: auto;" />
                  <col style="width: auto;" />
               </colgroup>
               <thead>
                  <tr>
                     <th>주문번호</th>
                     <th>회원ID</th>
                     <th>전화	번호</th>
                     <th>받는분</th>
                     <th>결제금액</th>
                     <th>신청일자</th>
                  </tr>
               </thead>
               <tbody>
               <%for (int i = 0; i < Page.size(); i++) {%>
               <tr>
                    <td><%=Page.get(i).getBuy_no()%></td>
                    <td>
                    	<a href="adminMain.jsp?center=OrderInfo.jsp?buy_no=<%=Page.get(i).getBuy_no() %>" style="text-decoration: none">
                    		<%=Page.get(i).getUser_id()%>
                   		</a>
                  	</td>
                    <td>+82)<%=Page.get(i).getTel1()%>-<%=Page.get(i).getTel2()%>-<%=Page.get(i).getTel3()%></td>
                    <td><%=Page.get(i).getName() %></td>
                    <td><%=Page.get(i).getItem_price()*Page.get(i).getCart_amount() %>원</td>
                    <td><%=Page.get(i).getBuy_date() %></td>
               </tr>   
               <%}%>
               <%for (int i = Page.size(); i < 10; i++) {%>
                  <tr>
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
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="adminMain.jsp?center=Order_List_Group.jsp&buy_type=<%=buy_type%>">처음으로</a>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="adminMain.jsp?center=Order_List_Group.jsp&buy_type=<%=buy_type%>&pageNum=<%=Minus10_Page %>">-10</a>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info"
      <%if(CurrentPage>1) {%>
         href="adminMain.jsp?center=Order_List_Group.jsp&buy_type=<%=buy_type%>&pageNum=<%=CurrentPage-1 %>"
      <%}else{ %>
         href="#"
      <%} %>
      >이전</a>
      <%for(int i=startPage;i<=endPage;i++){ %>
         <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="adminMain.jsp?center=Order_List_Group.jsp&buy_type=<%=buy_type%>&pageNum=<%=i %>"><%=i %></a>
      <%} %>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info"
      <%if(CurrentPage<MaxPage){ %>
         href="adminMain.jsp?center=Order_List_Group.jsp&buy_type=<%=buy_type%>&pageNum=<%=CurrentPage+1 %>"
      <%}else{ %>
         href="#"
      <%} %>
      >다음</a>
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="adminMain.jsp?center=Order_List_Group.jsp&buy_type=<%=buy_type%>&pageNum=<%=Plus10_Page %>">+10</a>   
      <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="adminMain.jsp?center=Order_List_Group.jsp&buy_type=<%=buy_type%>&pageNum=<%=MaxPage %>">끝으로</a>   
      </div>
   </article>
</body>
</html>