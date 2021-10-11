<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Tab_Buy buy = new Tab_Buy();

	Tab_User user = new Tab_User();

	String buy_no = request.getParameter("buy_no");	

	GetSet model =buy.Select_One_Record(buy_no);
	
	GetSet USER = user.Select_One_Record(model.getUser_id()); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>주문 취소(환불)</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/buyCancel.js"></script>
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
	<h3 align="center">주문 취소(환불)</h3>
	<form action="../Back/buyCancelPro.jsp" method="post">
	<article>
		<div class="container">
			<div class="table-responsive">
				<table class="table table-striped table-sm">
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
						<td width="300px">결제 금액</td>
						<td><%=model.getItem_price()*model.getCart_amount() %>원</td>
					</tr>
					<tr>
						<td>주문자 이름</td>
						<td><%=model.getName() %></td>
					</tr>
					<tr>
						<td>취소(환불) 사유</td>
						<td><textarea rows="5" cols="30" name="message" placeholder="취소(환불) 사유를 입력해주세요."></textarea></td>
					</tr>
					<tr>
						<td>(로그인)비밀번호</td>
						<td><input type="password" name="user_pw"></td>
					</tr>
					<tr>
						<td colspan="2">
							입력하신 비밀번호와 상품을 구입한 회원 비밀번호가 일치하면 해당 구매내역이 취소(환불) 신청 상태로 변경됩니다.<br>
							환불은 영업일 기준 2~3일 정도 소요되며 입력하신 카드번호로 결제하신 금액이 다시 환급됩니다.<br>
							<span style="color:red;">**취소(환불) 사유는 반드시 입력해주시기 바랍니다.**</span> 
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="col text-center">
			<input type="hidden" name="buy_no" value="<%=model.getBuy_no() %>"> 
			<input type="hidden" name="user_id" value="<%=model.getUser_id() %>"> 
			<input class="btn btn-secondary" type="submit" value="주문취소(환불)하기">&nbsp;
			<input class="btn btn-secondary" type="reset" value="다시쓰기">&nbsp;
		</div>
	</article>
</form>
</body>

</html>