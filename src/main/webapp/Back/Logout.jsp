<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("user_id");
	session.removeAttribute("user_pw");
	session.invalidate();
	out.println("<script>alert('로그아웃되었습니다!');location.href='../Front/mainPage.jsp'</script>");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 프로세스</title>
</head>
<body>

</body>
</html>