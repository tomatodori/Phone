<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="MVC.*"%>
<jsp:useBean id="model" class="MVC.GetSet"/>
<jsp:setProperty property="*" name="model"/>
<%
	Tab_User user = new Tab_User();

	int result = Common.UserCheck(model);
	
	out.println("<script>");
	
	if(result!=2){
		out.println("alert('비밀번호가 일치하지 않습니다!');history.go(-1);");
	}else{
		user.Delete_One_Record(model.getUser_id());
		session.removeAttribute("user_id");
		session.removeAttribute("user_pw");
		session.invalidate();
		out.println("alert('회원님의 정보를 모두 삭제하였습니다. ㅂㅂ~');location.href='../Front/mainPage.jsp'");
	}
	out.println("</script>");
	
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