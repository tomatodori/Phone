<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="model" class="MVC.GetSet"/>
<jsp:setProperty property="*" name="model"/>
<%
	String find = request.getParameter("find");

	Tab_User user = new Tab_User();

	String result="";

	if(find.equals("user_id"))
		result=user.FindID(model);
	else if(find.equals("user_pw"))
		result=user.FindPW(model);
	
	out.println("<script>");
	
	if(result.equals("")){
		out.println("alert('입력하신 조건에 맞는 ID 혹은 비밀번호가 존재하지 않습니다.');");
		out.println("history.go(-1);");
	}else{
		out.println("alert('입력하신 값에 해당하는 회원정보 알림페이지로 이동합니다.');");
		out.println("location.href='../Front/mainPage.jsp?center=FindResult.jsp&info="+find+"&result="+result+"'");
	}
	out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/비밀번호 찾기</title>
</head>
<body>

</body>
</html>