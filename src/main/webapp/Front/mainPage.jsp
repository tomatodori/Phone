<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String center = request.getParameter("center");
	String action = request.getParameter("action");
	
	if (center == null)
		center = "center.jsp";
	
	if (action != null)
		out.println("<script>alert('" + action + "');</script>");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>MyPhone</title>
</head>
<body>
	<table align="center" width="700">
		<tr height="100">
			<td align="center"><jsp:include page="top.jsp" /></td>
		</tr>
		<tr>
		
			<td align="center" width="500"><jsp:include page="<%=center%>" /></td>
		</tr>
		<tr height="100">
			<td align="center"><jsp:include page="bottom.jsp" />
			</td>
		</tr>
	</table>
</body>
</html>