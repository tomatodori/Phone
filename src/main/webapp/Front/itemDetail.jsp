<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>	
<%@ page import="java.util.*" %>
<%
	Tab_Item item = new Tab_Item();

	String user_id="";

	if(session.getAttribute("user_id")!=null)
		user_id=(String)session.getAttribute("user_id");
	
	String PK = request.getParameter("item_no");
	
	GetSet OneItem = item.Select_One_Record(PK);
%>	
<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Item</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/itemInfostyles.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/cart.js"></script>
</head>
<body>
<form action="../Back/NewCartPro.jsp" method="post">
	<input type="hidden" value="<%=OneItem.getItem_no() %>" name="item_no">
	<input type="hidden" value="<%=user_id %>" name="user_id">
	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="../img/<%=OneItem.getItem_photo() %>" alt = "item"/>
				</div>
				<div class="col-md-6">
					<h1 class="display-5 fw-bolder"><%=OneItem.getItem_name() %></h1>
					<div class="fs-5 mb-5">
						 <span>￦ <%=OneItem.getItem_price() %></span>
					</div>
					<p class="lead">
					<p>기종 
						<select name="item_model">
							<option>--기종을 선택해주세요--</option>
							<%if(OneItem.getItem_group().equals("iphone")){ %>
								<option>아이폰12 Pro</option>
								<option>아이폰12</option>
								<option>아이폰11 Pro</option>
								<option>아이폰11</option>
							<%}else if(OneItem.getItem_group().equals("galaxy")){ %>		
								<option>갤럭시12</option>
								<option>갤럭시11</option>
								<option>갤럭시10</option>
								<option>갤럭시9</option>
							<%}else{ %>		
								<option>LG 기종</option>
								<option>모토로라</option>
								<option>블랙베리</option>
								<option>샤오미폰</option>
							<%} %>						
						</select>
					</p>
					<%StringTokenizer option = new StringTokenizer(OneItem.getItem_option(),"/");%>	
					<p>옵션 
						<select name="item_option">
							<option>--옵션을 선택해주세요--</option>
						<%while(option.hasMoreTokens()){ %>
							<option><%=option.nextToken() %></option>
						<%} %>		
						</select>
					</p>
					<p>
						수량 <input type="number" name="cart_amount" min="1">
					</p>
					<p>
					<%if(user_id==""){ %>
						<button type="button" class="btn btn-outline-dark flex-shrink-0" onclick="alert('로그인 후 이용해주세요.!')">
							<i class="bi-cart-fill me-1"></i>Add to cart
						</button>
					<%}else{ %>
						<button type="submit" id="addCart" class="btn btn-outline-dark flex-shrink-0" id="submit">
							<i class="bi-cart-fill me-1"></i>Add to cart
						</button>
					<%} %>
					</p>
				</div>
			</div>
		</div>
		<h1 align = "center">details</h1>
		<div id = "info">
			<img src="../img/<%=OneItem.getItem_desc() %>" width="700">
		</div>
	</section>
	</form>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../js/scripts_itemInfo.js"></script>
</body>
</html>
