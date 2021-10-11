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
	
	if(model.getMessage()==null)
		model.setMessage("입력하신 배송메세지가 없습니다.");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>주문 정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/address.js"></script>
<script>
	$(document).ready(function(){
		var origin_tel1 = "<%=model.getTel1()%>";
		$('select[name="tel1"]').val(origin_tel1).prop("selected",true);
		$('input[name="tel2"]').val("<%=model.getTel2()%>");
		$('input[name="tel3"]').val("<%=model.getTel3()%>");
		$('#total').html("<%=model.getItem_price()*model.getCart_amount()%>");
		
		$('input[name="cart_amount"]').change(function(){
			
			var total = $(this).val() * <%=model.getItem_price() %>;
			
			$('#total').html(total);
		})
		
		var tel1 = "<%=USER.getTel1()%>";
		
		$('input[name="u_name"]').change(function(){
			if($(this).is(":checked") == true)
				$('input[name="name"]').val("<%=USER.getUser_name()%>");
			else
				$('input[name="name"]').val("");
		})
		$('input[name="u_tel"]').change(function(){
			if($(this).is(":checked") == true){
				$('select[name="tel1"]').val(tel1).prop("selected",true);
				$('input[name="tel2"]').val("<%=USER.getTel2()%>");
				$('input[name="tel3"]').val("<%=USER.getTel3()%>");
			}else{
				$('select[name="tel1"]').val("선택").prop("selected",true);
				$('input[name="tel2"]').val("");
				$('input[name="tel3"]').val("");
			}	
		})
		$('input[name="u_add"]').change(function(){
			if($(this).is(":checked") == true){
				$('input[name="add1"]').val("<%=USER.getAdd1()%>");
				$('input[name="add2"]').val("<%=USER.getAdd2()%>");
				$('input[name="add3"]').val("<%=USER.getAdd3()%>");
				$('input[name="add4"]').val("<%=USER.getAdd4()%>");
			}else{
				$('input[name="add1"]').val("");
				$('input[name="add2"]').val("");
				$('input[name="add3"]').val("");
				$('input[name="add4"]').val("");
			}	
		})
	})
</script>
<script src="../js/buyUpdate.js"></script>
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
	<h3 align="center">주문 정보 수정</h3>
	<form action="../Back/buyUpdatePro.jsp" method="post">
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
						<td>상품가격</td>
						<td><%=model.getItem_price() %>원</td>
					</tr>
					<tr>
						<td>상품수량</td>
						<td><input type="number" name="cart_amount" min="1" value="<%=model.getCart_amount()%>">개</td>
					</tr>
					<tr>
						<td width="300px">총 가격</td>
						<td><span id="total"></span>원</td>
					</tr>
					<tr>
						<td>주문자 이름<br>
						<div style="font-size:0.5rem;color:red;">(회원 이름과 동일&nbsp;<input type="checkbox" name="u_name">)</div>
						</td>
						<td>
							<input type="text" name="name" value="<%=model.getName()%>">&nbsp;
						</td>
					</tr>
					<tr>
						<td>주문 연락처<br>
						<div style="font-size:0.5rem;color:red;">(회원 전화번호와 동일&nbsp;<input type="checkbox" name="u_tel">)</div>
						</td>
						<td><select name="tel1">
				               <option>선택</option>
				               <option>010</option>
				               <option>011</option>
				               <option>016</option>
            				</select>&nbsp;-&nbsp;
            				<input type="text" size = "1" name="tel2">&nbsp;-&nbsp;
            				<input type="text" size = "1"  name="tel3">&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							배송지<br>
							<div style="font-size:0.5rem;color:red;">(회원 주소와 동일&nbsp;<input type="checkbox" name="u_add">)</div>
						</td>
						<td>
							<input type="text" name="add1" value="<%=model.getAdd1() %>" id="sample6_postcode" size="4" placeholder="우편번호" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-dark">
							<input type="button" onclick="FindAddress()" value="우편번호 찾기" class="mb-2 mr-2 btn btn-secondary active"><br>
							<input type="text" name="add2" id="sample6_address" value="<%=model.getAdd2() %>" placeholder="주소" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-dark"><br>
							<input type="text" name="add3" id="sample6_extraAddress" value="<%=model.getAdd3() %>" placeholder="참고항목" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-dark"><br>
							<input type="text" name="add4" id="sample6_detailAddress" value="<%=model.getAdd4() %>" placeholder="상세주소" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-dark">
						</td>
					</tr>
					<tr>
						<td>배송 메세지</td>
						<td><textarea rows="5" cols="30" name="message"><%=model.getMessage() %></textarea></td>
					</tr>
					<tr>
						<td>카드 번호</td>
						<td>
							<input type="text" size="2" name="card1" maxlength="4" value="<%=model.getCard1() %>">&nbsp;-&nbsp;
							<input type="text" size="2" name="card2" maxlength="4" value="<%=model.getCard2() %>">&nbsp;-&nbsp;
							<input type="text" size="2" name="card3" maxlength="4" value="<%=model.getCard3() %>">&nbsp;-&nbsp;
							<input type="text" size="2" name="card4" maxlength="4" value="<%=model.getCard4() %>">
						</td>
					</tr>
					<tr>
						<td>카드 비밀번호</td>
						<td><input type="password" name="card_pw" value="<%=model.getCard_pw()%>"></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="col text-center">
			<input type="hidden" name="buy_no" value="<%=model.getBuy_no() %>"> 
			<input class="btn btn-secondary" type="submit" value="수정하기">&nbsp;
			<input class="btn btn-secondary" type="button" value="다시쓰기" onclick="location.href='mainPage.jsp?center=buyUpdate.jsp&buy_no=<%=model.getBuy_no() %>'">&nbsp;
		</div>
	</article>
</form>
</body>

</html>