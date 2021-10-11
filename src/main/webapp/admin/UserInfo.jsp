<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*"%>
<%@ page import="java.util.*"%>
<%
	Tab_User User = new Tab_User();

	String PK = request.getParameter("user_id");
	
	GetSet model = User.Select_One_Record(PK);
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
<title>memberInfo.jsp</title>
<style type="text/css">
h2 {
	text-align : center;
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>
<script>
function del(no){
	var is = confirm("정말 삭제하시겠습니까?");  
	if(is){
		location.href="UserDelete.jsp?user_id=<%=model.getUser_id()%>";
	   	return true;
	}else{
		return false;
	}
}
</script>
</head>
<body>
	<h2 align = "center" >회원 정보 상세보기</h2>
	<form action="adminMain.jsp?center=UserUpdate.jsp" method="post">
		<article>
			<div class="container">
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<tr width="700px" align="center">
							<td width="300px">아이디</td>
							<td><%=model.getUser_id()%></td>
						</tr>
						<tr width="700px" align="center">
							<td width="300px">비밀번호</td>
							<td><%=model.getUser_pw()%></td>
						</tr>
						<tr width="700px" align="center">
							<td>이름</td>
							<td><%=model.getUser_name()%></td>
						</tr>
						<tr width="700px" align="center">
							<td>이메일</td>
							<td><%=model.getMail1()%> @ <%=model.getMail2()%></td>
						</tr>
						<tr width="700px" align="center">
							<td>전화번호</td>
							<td>
								+82) &nbsp;<%=model.getTel1() %>-<%=model.getTel2()%>-<%=model.getTel3()%>
							</td>
						</tr>
						<tr width="700px" align="center">
							<td>주소</td>
							<td>
                     		<%if(model.getAdd1()!=null){ %>
                     			<%=model.getAdd1()%>&nbsp; <%=model.getAdd2()%>&nbsp;
                        		<%=model.getAdd3()%>&nbsp; <%=model.getAdd4()%>
							<%}else {%>                        
								미입력
							<%} %>
					 		</td>
						</tr>
						<tr width="700px" align="center">
							<td>생년월일</td>
							<td>
                     		<%if(model.getYear().equals("선택")){ %>
                     			미입력
 					 		<%}else{ %>                       
								<%=model.getYear()%>년&nbsp; <%=model.getMonth()%>월&nbsp;
                        		<%=model.getDay()%>일 					 	
 					 		<%} %>
                     		</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col text-center">
				<input type="hidden" name="user_id" value="<%=model.getUser_id()%>" />
				<input class="btn btn-secondary" type="submit" value="수정하기">&nbsp;
			<%if(!(model.getUser_id().equals("admin"))){ %>	
				<input class="btn btn-secondary" type="button" value="회원 삭제" onclick="del(${one.no})">&nbsp;
			<%} %>	
			</div>
		</article>
	</form>
</body>
</html>

</body>
</html>