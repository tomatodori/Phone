<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<%
	Tab_User User = new Tab_User();

	String user_id = request.getParameter("user_id");

	User.Out_Of_User(user_id);
	
	String action ="";
	
	action=URLEncoder.encode("해당 회원을 삭제하였습니다.", "UTF-8");
	response.sendRedirect("adminMain.jsp?center=UserList.jsp&action="+action);
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