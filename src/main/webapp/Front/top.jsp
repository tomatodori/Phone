<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "";

	if(session.getAttribute("user_id")!=null)
		id = (String)session.getAttribute("user_id");
	else
		id = "guest";		
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPhone-top</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<style type="text/css">
img {
	display: block;
	margin: 0px auto;
}

li {
	list-style-type : none;
	float: left;
	font-size: 20px;
	margin-left: 50px;
	margin-right: 50px;
	text-align: center;
	list-style-type: none;
}
a:link {
	text-decoration: none;
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color : skyblue;
}
</style>
</head>
<body>
	<p align = "center" font-size = "10">
	<%if(id.equals("guest")){%>
		<%=id %>님&nbsp;<button class="btn btn-outline-dark" onclick="location.href='mainPage.jsp?center=Login.jsp'">로그인</button>
	<%} else{ %>
		<%=id %>님&nbsp;<button class="btn btn-outline-dark" onclick="location.href='../Back/Logout.jsp'">로그아웃</button>			
	<%}%>
	</p>
	<div id = "top">
	<table align="center" width="700">
		<tr height="100">
			<td colspan = "8">
				<img src="../img/LogoFinal.png" alt="Logo" align="center" width="200"
				height="200">
				</td>
			</tr>
		<tr height="100">
			<ul>
				<td><li><a href="mainPage.jsp">Home</a></li></td>
				<td><li><a href="mainPage.jsp?center=Item_List_Group.jsp&group=iphone">IPhone</a></li></td>
				<td><li><a href="mainPage.jsp?center=Item_List_Group.jsp&group=galaxy">Galaxy</a></li></td>
				<td><li><a href="mainPage.jsp?center=Item_List_Group.jsp&group=other">Other</a></li></td>
				<td><li><a href="mainPage.jsp?center=BoardList.jsp?board_type=0">Q&A</a></li></td>
				<td><li><a href="mainPage.jsp?center=BoardList.jsp?board_type=1">Review</a></li></td>
				<td><li>
				<%if(id!="guest"){ %>
					<a href="mainPage.jsp?center=MyPage.jsp">
						<img src="../img/user.png" alt="myPage" width="20">
					</a>
				<%}else{ %>
					<a href="mainPage.jsp?center=Login.jsp">
						<img src="../img/user.png" alt="Login" width="20">
					</a>
				<%} %>	
				</li></td>
				<td><li>
				<%if(id!="guest"){ %>
					<a href="mainPage.jsp?center=MyCart.jsp">
						<img src="../img/cart.png" alt="cart" width="20">
					</a>
				<%}else{ %>	
					<a href="javascript:alert('로그인 후 이용가능합니다.')">
						<img src="../img/cart.png" alt="cart" width="20">
					</a>
				<%} %>
				</li></td>
			</ul>
		</tr>
	</table>
	</div>
	<br>
	<hr>
</body>
</html>