<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPhone Login</title>
<style>

h3 {
	font-weight: 500;
 	color : #333333;
 	margin-bottom : 25px;
 	margin-top : 50px;
}

#div1 {
	width : 360px;
	align : center;
	margin : 0px auto;
}

#log {
	font-size : small;
	color : #333333;

}
input[type=text],input[type=password] {
	AutoSize: False;
	width: 350px;
	height: 35px;
	border : 1.5px solid  #333333;
	margin-bottom: 10px;
}

.btn1 {
	AutoSize: False;
	width: 200px;
	height: 45px;
	border : 2px solid  black;
	background-color : white;
	margin-top:20px;
	align : center;
	
}

small {

align : center;

}

a:link {
	text-decoration: none;
	color: #333333;
}

a:visited {
	color: #333333;
}

a:hover {
	text-decoration: underline;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/login.js"></script>
</head>
<body>
	<div id = "div1">
		<h3 align = "left">로그인</h3>
	
		<form action="../Back/LoginPro.jsp" method = "post">
		<p align = "left" id = "log">아이디</p>
			<label> 
			<input type="text" name="user_id">
			</label><br> 
			<p align = "left" id = "log" >비밀번호</p>
			<label> 
			<input type="Password" name="user_pw">
			</label>
			<br> 
	 <SMALL><a href="mainPage.jsp?center=findID.jsp">아이디찾기</a> </SMALL>/
	 <SMALL><a href="mainPage.jsp?center=findPW.jsp">비밀번호찾기</a> </SMALL>
	<br>
		<input type="submit" value="로그인하기" class = "btn1"><br>
		<input type = "button" value = "회원 가입하기" onclick = "location.href='mainPage.jsp?center=Join.jsp'" class = "btn1">
	</form>
	</div>
</body>
</html>