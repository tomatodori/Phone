<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    

<%
	Tab_Cart cart = new Tab_Cart();

	String command=request.getParameter("command");
	
	String action="";

	String cart_no = request.getParameter("cart_nums");
	
	out.println("<script>");
	
	if(cart_no==null)
		out.println("alert('선택된 상품이 없습니다.');history.go(-1);");
	else{
		if(command.equals("order"))
			out.println("location.href='../Front/mainPage.jsp?center=Order.jsp&cart_no="+cart_no+"';");
		else if(command.equals("delete")){
			cart.Delete_One_Record(cart_no);
			out.println("alert('선택하신 상품을 장바구니에서 삭제하였습니다.');location.href='../Front/mainPage.jsp?center=MyCart.jsp';");
		}
	}
	
	out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카트 프로세스</title>
</head>
<body>
<!-- 
	장바구니리스트(CartList.jsp)에서 선택 상품 주문, 선택 상품 삭제 버튼을 클릭했을때 각각의 버튼마다
	다른 기능을 수행하는 역할을 한다.
	
	order 이면 cart_no 를 가지고 다시 배송지와 카드번호를 입력받는(Order.jsp)로 가고,
	delete 이면 requestParam:cart_no를 이용해 해당 cart_no 를 가진 Record 를 삭제한 후 다시 장바구니 리스트로 이동(MyCart.jsp)

 -->
</body>
</html>