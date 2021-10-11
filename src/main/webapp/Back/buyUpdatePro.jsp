<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="model" class="MVC.GetSet"/>
<jsp:setProperty property="*" name="model"/>
<%
	Tab_Buy buy = new Tab_Buy();

	int result = buy.Update_Record(model);
	
	if(result!=1)
		out.println("<script>alert('구매정보를 수정하는데 실패하였습니다.');history.go(-1);</script>");
	else
		out.println("<script>alert('구매정보를 수정하였습니다.');location.href='../Front/mainPage.jsp?center=buyDetail.jsp&buy_no="+model.getBuy_no()+"';</script>");
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매정보 수정 프로세스</title>
</head>
<body>

</body>
</html>