<%@page import="java.net.URLEncoder"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<%@ page import="java.util.*" %>    
<% request.setCharacterEncoding("UTF-8");
	
	String action="";
	
	String UploadPath = request.getRealPath("img");
	int MaxSize = 10 * 1024 * 1024;
	
	MultipartRequest multi = new MultipartRequest(request,UploadPath,MaxSize,"UTF-8",new DefaultFileRenamePolicy());
	
	
	String item_name = multi.getParameter("item_name");
	String item_group = multi.getParameter("item_group");
	String[] options = multi.getParameterValues("options");
	String item_option="";
	for(String element : options){
		item_option+= (element + "/");
	}
	int item_price = Integer.parseInt(multi.getParameter("item_price"));
	
	Enumeration files = multi.getFileNames();
	
	String Photo = (String)files.nextElement();
	
	String item_photo = multi.getFilesystemName(Photo);
	
	String Desc = (String)files.nextElement();
	
	String item_desc = multi.getFilesystemName(Desc);
	
	GetSet model = new GetSet();

	model.setItem_price(item_price);
	model.setItem_name(item_name);
	model.setItem_group(item_group);
	model.setItem_option(item_option);
	model.setItem_photo(item_photo);
	model.setItem_desc(item_desc);
	
	Tab_Item item = new Tab_Item();
	int x=item.New_Record(model);
	
	
	action=URLEncoder.encode("새로운 상품을 등록하였습니다.", "UTF-8");
	response.sendRedirect("../admin/adminMain.jsp?center=adItemListGroup.jsp&action="+action+"&group="+item_group);
	
	%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 아이템 등록 프로세스</title>
</head>
<body>

</body>
</html>