<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="MVC.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");

   Tab_Board board = new Tab_Board();

	String user_id = request.getParameter("user_id");
	
	int board_type= Integer.parseInt(request.getParameter("board_type"));
	String board_category= (board_type==0) ? "QnA" : "리뷰";
	
	int board_no = Integer.parseInt(request.getParameter("board_no"));

	String PK = Integer.toString(board_no);

	GetSet model = board.Select_One_Record(PK);
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/adminReWrite.js"></script>
<title>답글 달기</title>
<style type="text/css">
h3 {
	margin-top: 20px;
	margin-bottom: 20px;
}
tr{
	width:700px;
	text-align:center;
}
</style>
</head>
<body>
	<h3 align="center">[<%=board_category %>] <%=model.getTitle() %>[답글]</h3>
	<form action="../Back/adminReWritePro.jsp" method="post" enctype = "multipart/form-data">
	<article>
		<div class="container">
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<tr>
						<td width="300px">아이디</td>
						<td><input type="text" value="관리자" readonly="readonly"></td>
					</tr>
					<tr>
						<td>글 카테고리</td>
						<td><%=board_category%></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" value="&nbsp;&nbsp;&nbsp;<%=user_id %>님, 답변드립니다!" readonly="readonly"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="50" name="content" placeholder="내용을 입력해주세요."></textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="board_photo" accept="image/*"></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="col text-center">
			<input type="hidden" value="<%=board_no %>" name="board_no">
			<input type="hidden" value="admin" name="user_id">
			<input class="btn btn-secondary" type="submit" value="답글 등록">&nbsp;
			<input class="btn btn-secondary" type="reset" value="다시쓰기">&nbsp;
		</div>
		
	</article>
</form>
</body>

</html>

