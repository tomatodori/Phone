<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<title>myPage.jsp</title>
<style>
td {
text-align : center;

}

</style>
</head>
<body>
<h3>My Page</h3>
<table align = "center">
	<tr width = "700px" height = "200px">
		<td style="width: 14%;"><a href="mainPage.jsp?center=MyInfo.jsp"><i class="fas fa-user-alt fa-8x" ></i></a></td>
		<td style="width: 14%;"></td>
		<td style="width: 14%;"><a href="../Front/mainPage.jsp?center=MyBoard.jsp?board_type=0"><i class="far fa-question-circle fa-8x"></i></a></td>
		<td style="width: 14%;"></td>
		<td style="width: 14%;"><a href = "../Front/mainPage.jsp?center=MyBoard.jsp?board_type=1"><i class="far fa-keyboard fa-8x"></i></a></td>
		<td style="width: 14%;"></td>
		<td style="width: 14%;"><a href = "../Front/mainPage.jsp?center=MyBuy.jsp"><i class="fas fa-shopping-cart fa-8x"></i></a></td>
		
	</tr>
	<tr width = "700px" height = "100px">
		<td><a href = "mainPage.jsp?center=MyInfo.jsp">내 정보</a></td>
		<td></td>
		<td><a href = "../Front/mainPage.jsp?center=MyBoard.jsp?board_type=0">Q&A 작성한 글</a></td>
		<td></td>
		<td><a href = "../Front/mainPage.jsp?center=MyBoard.jsp?board_type=1">Review 작성한 글</a></td>
		<td></td>
		<td><a href = "../Front/mainPage.jsp?center=MyBuy.jsp">상품주문내역</a></td>
	</tr>
</table>
</body>
</html>