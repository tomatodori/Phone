<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="model" class="MVC.GetSet"/>
<jsp:setProperty property="*" name="model"/>
<%
	int result = Common.UserCheck(model);

	out.println("<script>");
	switch(result){
	case 0:
		out.println("alert('존재하지 않는 ID입니다.');history.go(-1);");		
		break;
	case 1:
		out.println("alert('ID 또는 비밀번호를 잘못입력하셨습니다.');history.go(-1);");		
		break;
	case 2:
		session.setAttribute("user_id", model.getUser_id());
		session.setAttribute("user_pw", model.getUser_pw());
		session.setMaxInactiveInterval(30*60);
		out.println("alert('로그인 성공!');location.href='../Front/mainPage.jsp';");
		break;
	case 3:
		session.setAttribute("user_id", model.getUser_id());
		session.setAttribute("user_pw", model.getUser_pw());
		session.setMaxInactiveInterval(30*60);
		out.println("alert('관리자로 로그인하셨습니다.');location.href='../admin/adminMain.jsp';");
		break;
	}
	out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 프로세스</title>
</head>
<body>

</body>
</html>