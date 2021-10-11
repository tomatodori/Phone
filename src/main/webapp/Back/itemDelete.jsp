<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<%
	Tab_Item item = new Tab_Item();
	String PK = request.getParameter("item_no");

	item.Delete_One_Record(PK);
	
	
	String action ="";
	
	action=URLEncoder.encode("해당 상품을 삭제하였습니다.", "UTF-8");
	response.sendRedirect("../admin/adminMain.jsp?action="+action);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제 프로세스</title>
</head>
<body>

</body>
</html>