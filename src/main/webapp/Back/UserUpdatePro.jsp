<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "MVC.*" %> 
<%request.setCharacterEncoding("UTF-8");%> 
<jsp:useBean id="model" class="MVC.GetSet"/>
<jsp:setProperty name="model" property="*"/>
<%
	Tab_User User = new Tab_User();

	int result=User.Update_Record(model);
	
	out.println("<script>");
	
	if(result==1)
		out.println("alert('회원정보를 수정하였습니다.');location.href='../admin/adminMain.jsp?center=UserList.jsp'");
	else
		out.println("alert('회원정보를 수정하는데 실패하였습니다.');history.go(-1);");
	
	out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원정보 수정 프로세스</title>
</head>
<body>
</body>
</html>