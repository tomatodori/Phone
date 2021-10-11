<%@page import="java.net.URLEncoder"%>
<%@page import="MVC.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>    

<jsp:useBean id="model" class="MVC.GetSet"/>
<jsp:setProperty property="*" name="model"/>
<%
/*
	String add1 = request.getParameter("add1");
	if(add1.equals(""))
		model.setAdd1("미입력");
	
	String add2 = request.getParameter("add2");
	if(add2.equals(""))
		model.setAdd2("미입력");
	
	String add3 = request.getParameter("add3");
	if(add3.equals(""))
		model.setAdd3("미입력");
	
	String add4 = request.getParameter("add4");
	if(add4.equals(""))
		model.setAdd4("미입력");
	
	String year = request.getParameter("year");
	if(year.equals(""))
		model.setYear("미입력");
	
	String month = request.getParameter("month");
	if(month.equals(""))
		model.setMonth("미입력");
	
	String day = request.getParameter("day");
	if(day.equals(""))
		model.setDay("미입력");
*/	
	Tab_User user = new Tab_User();
	String action = "";
	
	int x=Common.UserCheck(model);
	
	 if(x==0){
		x=user.New_Record(model);
		if(x==1){
			action=URLEncoder.encode("회원가입 성공!", "UTF-8");
			response.sendRedirect("../Front/mainPage.jsp?action="+action);
		}else{
			action=URLEncoder.encode("회원가입 실패!", "UTF-8");
			response.sendRedirect("../Front/mainPage.jsp?action="+action+"&center=../Front/Join.jsp");
		}
	}else{
		action=URLEncoder.encode("이미 존재하는 ID입니다.", "UTF-8");
		response.sendRedirect("../Front/mainPage.jsp?action="+action+"&center=../Front/Join.jsp");
	} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입프로세스</title>
</head>
<body>

</body>
</html>