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
	
	int board_no = Integer.parseInt(multi.getParameter("board_no"));
	int board_type = Integer.parseInt(multi.getParameter("board_type"));
	int hidden = Integer.parseInt(multi.getParameter("hidden"));
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	String user_id = multi.getParameter("user_id");
	
	String currentImg = multi.getParameter("currentImg");
	
	Enumeration files = multi.getFileNames();
	
	String PHOTO = (String)files.nextElement();
	
	String board_photo= multi.getFilesystemName(PHOTO);
	
	if(board_photo==null)
		board_photo=currentImg;
		
	GetSet model = new GetSet();
	
	model.setBoard_no(board_no);
	model.setHidden(hidden);
	model.setTitle(title);
	model.setContent(content);
	model.setBoard_photo(board_photo);
	
	Tab_Board board = new Tab_Board();
	
   int x=board.Update_Record(model);
   
   out.println("<script>");
   
   if(x==1){
	   out.println("alert('글 수정이 완료되었습니다.');");
	   
	   if(user_id.equals("admin"))
		   out.println("location.href='../admin/adminMain.jsp?center=adminBoardList.jsp&board_type="+board_type+"'");
	   else
		   out.println("location.href='../Front/mainPage.jsp?center=BoardList.jsp&board_type="+board_type+"'");
		  
   }else{
	   out.println("alert('글 수정이 실패하였습니다. 다시 시도해주세요.');history.go(-1);");
   }
   
   out.println("</script>");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 업데이트 프로세스</title>
</head>
<body>

</body>
</html>