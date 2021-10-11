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
   
   
   String user_id = multi.getParameter("user_id");
   int board_type = Integer.parseInt(multi.getParameter("board_type"));
   int hidden = Integer.parseInt(multi.getParameter("hidden"));
   String title = multi.getParameter("title");
   String content = multi.getParameter("content");
  
   
   Enumeration files = multi.getFileNames();
   
   String Photo = (String)files.nextElement();
   
   String board_photo = multi.getFilesystemName(Photo);
   
 
   
   GetSet model = new GetSet();

   model.setUser_id(user_id);
   model.setBoard_type(board_type);
   model.setHidden(hidden);
   model.setTitle(title);
   model.setContent(content);
   model.setBoard_photo(board_photo);
   
   Tab_Board tb = new Tab_Board();
   int x=tb.New_Record(model);

   
   String action = "";
   
   
   switch(x){
   
   case 0:
      action=URLEncoder.encode("글 등록이 실패하였습니다. 다시 시도해주세요.", "UTF-8");
      response.sendRedirect("../Front/mainPage.jsp?action="+action+"&center=../Front/BoardList.jsp?board_type="+board_type+"");
      break;
   case 1:
      action=URLEncoder.encode("글 등록이 완료되었습니다.", "UTF-8");
      response.sendRedirect("../Front/mainPage.jsp?action="+action+"&center=../Front/BoardList.jsp?board_type="+board_type+"");
      break;
   }
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>newBoardWritePro.jsp</title>
</head>
<body>

</body>
</html>