<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<%
	Tab_Board board = new Tab_Board();

	String board_no = request.getParameter("board_no");

	board.Delete_One_Record(board_no);
	
	String board_type = request.getParameter("board_type");
	
	String action ="";
	
	action=URLEncoder.encode("해당 게시글을 삭제하였습니다.", "UTF-8");//해당 게시글이 없으므로 Mypage 로 이동.
	response.sendRedirect("adminMain.jsp?center=adminBoardList.jsp&board_type="+board_type+"&action="+action);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제 프로세스</title>
</head>
<body>
</body>
</html>