<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*" %>    
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="model" class="MVC.GetSet"/>
<jsp:setProperty property="*" name="model"/>
<%	
	Tab_Buy buy = new Tab_Buy();
	
	int result = Common.UserCheck(model);
	
	out.println("<script>");
	
	if(result!=2){
		out.println("alert('비밀번호가 일치하지 않습니다!');history.go(-1);");
	}else{
		buy.Cancel_Buy(model);
		out.println("alert('해당 구매내역의 취소(환불) 신청이 완료되었습니다.');location.href='../Front/mainPage.jsp?center=buyDetail.jsp&buy_no="+model.getBuy_no()+"';");
	}
	out.println("</script>");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역 취소(환불) 신청 프로세스</title>
</head>
<body>

</body>
</html>