<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="model" class="MVC.GetSet"/> 
<jsp:setProperty property="*" name="model"/>
<%
	Tab_Cart cart = new Tab_Cart();

	String cart_no = request.getParameter("cart_no");

	GetSet CART = cart.Select_One_Record(cart_no);
	
	model.setItem_no(CART.getItem_no());
	model.setItem_price(CART.getItem_price());
	model.setCart_amount(CART.getCart_amount());
	model.setItem_photo(CART.getItem_photo());
	model.setCart_item(CART.getCart_item());
	model.setUser_id(CART.getUser_id());
	
	Tab_Buy buy = new Tab_Buy();
	
	int result =buy.New_Record(model);
	
	out.println("<script>");
	if(result==0){
		out.println("alert('해당상품을 주문하는데 실패하였습니다.');history.go(-1);");
	}else{
		cart.Delete_One_Record(cart_no);
		out.println("alert('해당상품을 주문하였습니다.');location.href='../Front/mainPage.jsp?center=MyBuy.jsp'");
	}
	out.println("</script>");

%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>