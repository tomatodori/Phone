<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//user_id 혹은 user_pw 
	String info = request.getParameter("info");
	//info(user_id,user_pw) 중에 해당하는 결과값
	String result = request.getParameter("result");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW 찾기 요청에서 결과값을 클라이언트에게 보여주는 페이지</title>
</head>
<body>
	<%if(info.equals("user_id")){ %>
		<h2 align="center">요청하신 회원님의 아이디</h2>
	<%}else if(info.equals("user_pw")){ %>
		<h2 align="center">요청하신 회원님의 비밀번호</h2>
	<%} %>
		<h5><%=result %></h5>
	<div>
		<a href='mainPage.jsp?center=Login.jsp'>로그인하러 가기</a>
	</div>
</body>
</html>