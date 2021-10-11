<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="MVC.*"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	Tab_Board board = new Tab_Board();
	
	String user_id=	"";
	if(session.getAttribute("user_id")!=null)
		user_id=(String)session.getAttribute("user_id");
	
	int board_type= Integer.parseInt(request.getParameter("board_type"));
	
	String board_category= (board_type==0) ? "QnA" : "리뷰";
	
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	
	String PK = Integer.toString(board_no);
	
	GetSet model = board.Select_One_Record(PK);
	
	if(model.getUser_id().equals("admin"))
		user_id="admin";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>board</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("input[name=hidden]:radio[value="+<%=model.getHidden() %>+"]").prop("checked",true);
	})
</script>
<script src="../js/boardUpdate.js"></script>
</head>
<body>
	<h3 align="center"><%=board_category %> 글 수정</h3>
	<form action="../Back/BoardUpdatePro.jsp" method="post" enctype = "multipart/form-data">
	<article>
		<div class="container">
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<tr>
						<td width="300px">아이디</td>
						<td><%=user_id%></td>
					</tr>
					<tr>
						<td>글 카테고리</td>
						<td><%=board_category%></td>
					</tr>
					<tr>
						<td>글 상태</td>
						<td>
							<label><input type="radio" name="hidden" value="0">공개글</label>&nbsp;&nbsp;
     						<label><input type="radio" name="hidden" value="1">비밀글</label>
     					</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" size="45" value = "<%=model.getTitle()%>"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="50" name="content"><%=model.getContent() %></textarea></td>
					</tr>
					<tr>
						<td>첨부이미지</td>
						<td>
						<%if(model.getBoard_photo() != null ){%>
							<input type="hidden" name="currentImg" value="<%=model.getBoard_photo() %>">
							<img alt="photo" src="../img/<%=model.getBoard_photo() %>" width="500"><br>
						<%}%>	
							<input type="file" name="board_photo" accept="image/*"><br>
							<div style="font-size:0.3rem;color:red;">첨부이미지를 선택하지 않으시면 기존 저장값 그대로 유지됩니다.</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="col text-center">
		<input type="hidden" name="user_id" value="<%=user_id %>" />
		<input type="hidden" name="board_type" value="<%=board_type %>" />
		<input type="hidden" name="board_no" value="<%=board_no %>" />
			<input class="btn btn-secondary" type="submit" value="글 수정">&nbsp;
			<input class="btn btn-secondary" type="reset" value="다시쓰기">&nbsp;
		</div>
		
	</article>
</form>
</body>

</html>

