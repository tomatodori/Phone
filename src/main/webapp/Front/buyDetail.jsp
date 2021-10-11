<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<%
	String PK = request.getParameter("buy_no");

	Tab_Buy buy = new Tab_Buy();
	
	GetSet model = buy.Select_One_Record(PK);
	
	if(model.getMessage()==null)
		model.setMessage("입력하신 배송메세지가 없습니다.");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>주문정보 상세조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
h3 {
	margin-top: 20px;
	margin-bottom: 20px;
}
tr{
	width:700px;
	text-align:center;
}
</style>
</head>

<body>
	<h3 align="center">주문정보 상세조회</h3>
	<article>
		<div class="container">
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<tr>
						<td>주문단계</td>
						 <td>
	                     <%switch(model.getBuy_type()){ 
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
		<div class="col text-center">
			<%if(model.getBuy_type()<2){ %>
			<input class="btn btn-secondary" type="button" value="배송정보 수정하기" onclick="location.href='mainPage.jsp?center=buyUpdate.jsp&buy_no=<%=model.getBuy_no()%>'">&nbsp;
			<input class="btn btn-secondary" type="button" value="해당주문 취소하기" onclick="location.href='mainPage.jsp?center=buyCancel.jsp&buy_no=<%=model.getBuy_no()%>'">
			<%}else{ %>
			<input class="btn btn-secondary" type="button" value="배송정보 수정하기" onclick="alert('주문신청,배송중 인 주문내역만 수정가능합니다!')">&nbsp;
			<input class="btn btn-secondary" type="button" value="해당주문 취소하기" onclick="alert('주문신청,배송중 인 주문내역만 취소가능합니다!')">
			<%} %>
			<input class="btn btn-secondary" type="button" value="주문목록으로" onclick="location.href='mainPage.jsp?center=MyBuy.jsp'">&nbsp;
		</div>
	</article>
</body>

</html>

