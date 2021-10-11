<%@page import="java.net.URLEncoder"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<%@ page import="java.util.*" %>    
<% request.setCharacterEncoding("UTF-8");
	String UploadPath = request.getRealPath("img");
	int MaxSize = 10 * 1024 * 1024;
	
	MultipartRequest multi = new MultipartRequest(request,UploadPath,MaxSize,"UTF-8",new DefaultFileRenamePolicy());
	
	String user_id=multi.getParameter("user_id");
	String board_no = multi.getParameter("board_no");
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	
	Enumeration files = multi.getFileNames();
	
	String PHOTO = (String)files.nextElement();
	
	String board_photo= multi.getFilesystemName(PHOTO);
	
	GetSet model = new GetSet();
	
	model.setUser_id(user_id);
	model.setTitle(title);
	model.setContent(content);
	model.setBoard_photo(board_photo);
	
	Tab_Board board = new Tab_Board();
	
	GetSet BOARD = board.Select_One_Record(board_no);
	
	model.setRef(BOARD.getRef());
	model.setBoard_type(BOARD.getBoard_type());
	model.setHidden(BOARD.getHidden());
	
	int x=board.New_Record(model);
	 
	   String action = "";
	   
	   switch(x){
	   
	   case 0:
	      action=URLEncoder.encode("글 등록이 실패하였습니다. 다시 시도해주세요.", "UTF-8");
	      response.sendRedirect("../admin/adminMain.jsp?action="+action+"&center=../admin/adminBoardList.jsp&board_type="+BOARD.getBoard_type()+"");
	      break;
	   case 1:
	      action=URLEncoder.encode("글 등록이 완료되었습니다.", "UTF-8");
	      response.sendRedirect("../admin/adminMain.jsp?action="+action+"&center=../admin/adminBoardList.jsp&board_type="+BOARD.getBoard_type()+"");
	      break;
	   } 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>