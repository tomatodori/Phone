<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "MVC.*" %>  
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="model" class="MVC.GetSet"/>
<jsp:setProperty property="*" name="model"/>
<%
	Tab_User User = new Tab_User();

	int result = Common.UserCheck(model);
	
	out.println("<script>");
	
	if(result==2){
		result = User.Update_Record(model);
		if(result==1){
			out.println("alert('회원정보를 정상적으로 수정하였습니다.');location.href='../Front/mainPage.jsp?center=MyPage.jsp';");
		}else{
			out.println("alert('회원정보를 수정하는데 실패하였습니다.');history.go(-1);'");
		}
	}else{
		out.println("alert('비밀번호가 일치하지 않습니다.');history.go(-1);");
	}
	
	out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 프로세스</title>
</head>
<body>
</body>
</html>