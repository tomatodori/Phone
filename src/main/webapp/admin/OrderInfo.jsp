<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="MVC.*" %>
<%
	String PK = request.getParameter("buy_no");

	Tab_Buy buy = new Tab_Buy();

	GetSet model = buy.Select_One_Record(PK);


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

<title>itemOrderInfo.jsp</title>
<style type="text/css">
h2 {
   text-align : center;
   margin-top: 20px;
   margin-bottom: 20px;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("input[name=buy_type]:radio[value="+<%=model.getBuy_type() %>+"]").prop("checked",true);
	})
</script>
</head>
<body>
<h2 align = "center" >주문 정보 상세보기</h2>
   <article>
   	<form action="../Back/Update_BuyType.jsp" method="post">
   	<input type="hidden" name="buy_no" value="<%=model.getBuy_no() %>">
		<div class="container">
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<tr>
						<td>주문단계</td>
						<td>
	                   	  	<label><input type="radio" name="buy_type" value="0"> 주문신청</label>&nbsp;&nbsp;
	                        <label><input type="radio" name="buy_type" value="1"> 배송중</label>&nbsp;&nbsp;
	                        <label><input type="radio" name="buy_type" value="2"> 배송완료</label>&nbsp;&nbsp;
	                        <label><input type="radio" name="buy_type" value="3"> 환불신청</label>&nbsp;&nbsp;
	                        <label><input type="radio" name="buy_type" value="4"> 환불완료</label>&nbsp;&nbsp;
	                        <label><input type="submit" class="btn btn-primary btn-sm"  value="상태 변경"></label>
                     	</td>
					</tr>
					<tr>
						<td>상품이름</td>
						<td><%=model.getCart_item() %></td>
					</tr>
					<tr>
						<td>상품사진</td>
						<td>
							<img alt="상품" src="../img/<%=model.getItem_photo() %>" width="300px">
						</td>
					</tr>
					<tr>
						<td>상품수량</td>
						<td><%=model.getCart_amount() %>개</td>
					</tr>
					<tr>
						<td width="300px">총 가격</td>
						<td><%=model.getItem_price()*model.getCart_amount() %>원</td>
					</tr>
					<tr>
						<td>주문자 이름</td>
						<td><%=model.getName() %></td>
					</tr>
					<tr>
						<td>주문 연락처</td>
						<td>+82)<%=model.getTel1() %>-<%=model.getTel2() %>-<%=model.getTel3() %></td>
					</tr>
					<tr>
						<td>배송지</td>
						<td><%=model.getAdd1() %>&nbsp;<%=model.getAdd2() %><br><%=model.getAdd3() %>&nbsp;<%=model.getAdd4() %></td>
					</tr>
					<tr>
					<%if(model.getBuy_type()==3||model.getBuy_type()==4){ %>
						<td>취소(환불) 사유</td>					
					<%}else{ %>
						<td>배송 메세지</td>
					<%} %>
						<td><textarea rows="5" cols="30" name="message" readonly="readonly"><%=model.getMessage() %></textarea></td>
					</tr>
					<tr>
						<td>카드 번호</td>
						<td>
							<input type="text" size="2" name="card1" value="<%=model.getCard1()%>" readonly="readonly">&nbsp;-&nbsp;
							<input type="text" size="2" name="card2" value="<%=model.getCard2()%>" readonly="readonly">&nbsp;-&nbsp;
							<input type="text" size="2" name="card3" value="<%=model.getCard3()%>" readonly="readonly">&nbsp;-&nbsp;
							<input type="text" size="2" name="card4" value="<%=model.getCard4()%>" readonly="readonly">
						</td>
					</tr>
				</table>
			</div>
		</div>
		</form>
		<div class="col text-center">
			<input class="btn btn-secondary" type="button" value="목록으로" onclick="location.href='adminMain.jsp?center=Order_List_Group.jsp&buy_type=<%=model.getBuy_type()%>'">&nbsp;
		</div>
	</article>
</body>
</html>

</body>
</html>