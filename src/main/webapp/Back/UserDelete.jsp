<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>
<%
	Tab_User user = new Tab_User();

	String user_id=request.getParameter("user_id");

	user.Out_Of_User(user_id);
	
	String action="";
	
	
	session.removeAttribute("user_id");
	session.removeAttribute("user_pw");
	session.invalidate();
	action=URLEncoder.encode("회원님의 모든 정보를 삭제하였습니다. ㅂㅂ", "UTF-8");//해당 게시글이 없으므로 Mypage 로 이동.
	response.sendRedirect("../Front/mainPage.jsp");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 프로세스</title>
</head>
<body>

</body>
</html>