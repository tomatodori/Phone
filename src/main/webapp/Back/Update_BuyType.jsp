<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %> 
<%
   Tab_Buy buy = new Tab_Buy();

   int buy_no = Integer.parseInt(request.getParameter("buy_no"));
   int buy_type= Integer.parseInt(request.getParameter("buy_type"));
         
   int result =buy.Up_Buy_Type(buy_no, buy_type);
   
   out.println("<script>");
   
   if(result==1)
      out.println("alert('주문상태 변경 성공!');location.href='../admin/adminMain.jsp?center=OrderInfo.jsp&buy_no="+buy_no+"';");
   else
      out.println("alert('주문상태를 변경하는데 실패하였습니다.');history.go(-1);");
   
   out.println("</script>");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상태 변경 프로세스</title>
</head>
<body>

</body>
</html>