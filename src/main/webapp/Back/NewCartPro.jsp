<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<jsp:useBean id="model" class="MVC.GetSet"/>
<%request.setCharacterEncoding("UTF-8"); 

	String item_no = request.getParameter("item_no");
	
	Tab_Item item_dao = new Tab_Item();

	GetSet ITEM = item_dao.Select_One_Record(item_no);
	
	String cart_item =
			ITEM.getItem_name() + "["
		  + request.getParameter("item_model") + ":"
		  + request.getParameter("item_option") + "]";
	
	System.out.println(cart_item);		
	
	//cart_no = 시퀀스 생성
	model.setItem_no(ITEM.getItem_no());
	model.setItem_price(ITEM.getItem_price());
	model.setCart_amount(Integer.parseInt(request.getParameter("cart_amount")));
	model.setCart_item(cart_item);
	model.setItem_photo(ITEM.getItem_photo());
	model.setUser_id((String)session.getAttribute("user_id"));
	//cart_date = sysdate
	
	Tab_Cart cart = new Tab_Cart();
	
	int result =cart.New_Record(model);
	
	out.println("<script>");
	
	if(result!=1)
		out.println("alert('장바구니에 담는데 실패하였습니다.');history.go(-1);");
	else
		out.println("alert('장바구니에 담았습니다.');location.href='../Front/mainPage.jsp?center=MyCart.jsp'");		
	
	out.println("</script>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 카트 프로세스</title>
</head>
<body>

</body>
</html>