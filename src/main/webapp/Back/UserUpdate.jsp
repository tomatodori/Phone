<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="model" class="MVC.GetSet"/>
<jsp:setProperty property="*" name="model"/>
<%
	Tab_User user = new Tab_User();
	
	int check=user.Update_Record(model);
	
	out.println("<script>");	
	
	if(check==1)
		out.println("alert('회원님의 정보를 수정하였습니다.');location.href='../Front/mainPage.jsp?center=MyInfo.jsp';");
	else
		out.println("alert('정보수정에 실패하였습니다. 다시 입력해주세요!');history.go(-1);");
	
	out.println("</script>");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserUpdate</title>
</head>
<body>

</body>
</html>