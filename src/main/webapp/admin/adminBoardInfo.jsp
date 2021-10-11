<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*"%>
<%@ page import="java.util.*"%>
<%
   Tab_Board board = new Tab_Board();
   
   int board_no = Integer.parseInt(request.getParameter("board_no"));
   
   board.ReadPlus(board_no);
   
   String PK = Integer.toString(board_no);
   
   GetSet model=board.Select_One_Record(PK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
   integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
   crossorigin="anonymous">
<title>board</title>
<style type="text/css">
h3 {
   margin-top: -30px;
   margin-bottom: 20px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function del(no){
		
	  var is = confirm("정말 삭제하시겠습니까?");  
	  
	  if(is)
		  location.href='adminBoardDelete.jsp?board_no='+<%=model.getBoard_no()%>+'&board_type='+<%=model.getBoard_type() %>;
	}
</script>

<meta charset="UTF-8">
<title>관리자모드 글 상세보기</title>
</head>
<body>
	<article>
		<div class="container" style="margin-top: 100px">
			<h3 align="center">글 상세보기</h3>
			<form action="adminMain.jsp?center=adminReWrite.jsp" method = "post">
				<input type="hidden" name="user_id" value="<%=model.getUser_id()%>" />
				<input type="hidden" name="board_type" value="<%=model.getBoard_type() %>" />
				<input type="hidden" name="board_no" value="<%=model.getBoard_no() %>" />
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<div class="card shadow">
							<div class="card-body">
								<div class="form-group">
									<label for="board_writer_name">작성자</label> 
									<input type="text" id="user_id" name="user_id" class="form-control" value="<%=model.getUser_id()%>" disabled="disabled" />
	                     		</div>
	                     		<div class="form-group">
	                        		<label for="board_date">작성날짜</label> <input type="text" id="reg_date" name="reg_date" class="form-control" value="<%=model.getReg_date() %>" disabled="disabled" />
	                     		</div>
	                     		<div class="form-group">
	                        		<label for="board_date">조회수</label> <input type="text" id="readcount" name="readcount" class="form-control" value="<%=model.getReadcount() %>" disabled="disabled" />
	                     		</div>
	                     		<div class="form-group">
	                        		<label for="board_subject">제목</label> 
	                        		<input type="text" id="title" name="title" class="form-control" value="<%=model.getTitle() %>" disabled="disabled" />
	                     		</div>
	                     		<div class="form-group">
	                        		<label for="board_content">내용</label>
	                        		<textarea id="content" name="content" class="form-control" rows="10" style="resize: none"disabled="disabled"><%=model.getContent() %></textarea>
	                     		</div>
	                      	<%if(model.getBoard_photo() != null ){%>
	                     		<div class="form-group">
	                        		<label for="board_file">첨부 이미지</label>
	                         		<img src="../img/<%=model.getBoard_photo() %>" width="100%" id="board_photo" name="board_photo"/>
	                     		</div>
	                     	<%} %>
	                     		<div class="form-group">
	                        		<div class="col text-center">
	                           			<input class="btn btn-secondary" type="button" onclick = "location.href = 'adminMain.jsp?center=../Front/BoardUpdate.jsp&board_no=<%=model.getBoard_no() %>&board_type=<%=model.getBoard_type()%>'" value="글 수정">&nbsp;
	                           			<input class="btn btn-secondary" type="submit" value="답글달기">&nbsp;
	                           			<input class="btn btn-secondary" type="button" value="글 삭제" onclick="del(${one.no})">&nbsp;
	                           			<input class="btn btn-secondary" type="button" onclick = "location.href = 'adminMain.jsp?center=adminBoardList.jsp&board_type=<%=model.getBoard_type()%>'" value="글 목록">&nbsp;
	                        		</div>
	                     		</div>
	                  		</div>
	               		</div>
	            	</div>
            		<div class="col-sm-3"></div>
         		</div>
			</form>
		</div>
	</article>
</body>
</html>