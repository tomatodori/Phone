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
	
	
	String item_name = multi.getParameter("item_name");
	int item_no = Integer.parseInt(multi.getParameter("item_no"));
	String item_group = multi.getParameter("item_group");
	
	String[] option = multi.getParameterValues("item_option");
	String item_option = "";
	for(String element : option){
		item_option+= (element + "/");
	}
	int item_price = Integer.parseInt(multi.getParameter("item_price"));
	
	String currentPhoto = multi.getParameter("currentPhoto");
	String currentDesc = multi.getParameter("currentDesc");
	
	Enumeration files = multi.getFileNames();
	
	String Photo = (String)files.nextElement();
	
	String item_photo = multi.getFilesystemName(Photo);
	
	String Desc = (String)files.nextElement();
	
	String item_desc = multi.getFilesystemName(Desc);
	
	
	if(item_photo==null)
		item_photo=currentPhoto;
	
	if(item_desc==null)
		item_desc=currentDesc;
	
	
	GetSet model = new GetSet();
	
	model.setItem_no(item_no);
	model.setItem_price(item_price);
	model.setItem_name(item_name);
	model.setItem_group(item_group);
	model.setItem_option(item_option);
	model.setItem_photo(item_photo);
	model.setItem_desc(item_desc);
	
	
	Tab_Item item = new Tab_Item();
	int result=item.Update_Record(model);
	
	out.println("<script>");
	
	if(result==1)
		out.println("alert('상품수정이 완료되었습니다.');location.href='../admin/adminMain.jsp?center=adItemListGroup.jsp&group="+item_group+"';");
	else
		out.println("alert('상품 수정과정에서 오류가 발생했습니다. 다시 시도해주세요.');history.go(-1);");
	
	out.println("</script>");
	
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