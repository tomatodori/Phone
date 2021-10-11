<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="MVC.*" %>
<% 
	String Table = "shop_user";

	Tab_User user = new Tab_User();
	
	int CurrentPage = 1;
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum!=null)
		CurrentPage = Integer.parseInt(pageNum);
	
	Tab_Board board = new Tab_Board();

	int RowCount = Common.RowCount(Table);
	
	int MaxPage = (RowCount % 10 != 0) ? (RowCount/10 +1) : RowCount/10;
	
	int startPage = (CurrentPage % 10 !=0) ? CurrentPage/10 * 10 + 1 : (CurrentPage/10-1) * 10 +1;
	
	int endPage = (startPage + 9 > MaxPage) ? MaxPage : startPage + 9;
	
	int Plus10_Page = (CurrentPage + 10 > MaxPage) ? MaxPage : CurrentPage + 10;
	
	int Minus10_Page = (CurrentPage - 10 < 1) ? 1 : CurrentPage - 10;
	
	int StartNum = RowCount - (CurrentPage -1) * 10 ;	
	
	ArrayList<GetSet> Page = user.Page(StartNum);
	
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
h2 {
	text-align : center;
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>
<body>
	<article>
		<h2>회원 목록</h2>

		<div class="container">
			<div class="table-responsive">
				<table class="table table-striped table-sm">

					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>가입일</th>
						</tr>
					</thead>
					 <tbody>
               <%for (int i = 0; i < Page.size(); i++) {%>
               <tr>
       
                        <td><a href="adminMain.jsp?center=UserInfo.jsp?user_id=<%=Page.get(i).getUser_id() %>" style="text-decoration: none"><%=Page.get(i).getUser_id() %></a></td>
                        <td><%=Page.get(i).getUser_name()%></td>
                        <td><%=Page.get(i).getMail1()%> @ <%=Page.get(i).getMail2()%></td>
                        <td><%=Page.get(i).getTel1()%> - <%=Page.get(i).getTel2()%> - <%=Page.get(i).getTel3()%></td>
                        <td>
                        <%if(Page.get(i).getAdd1()!=null){ %>
                         	<%=Page.get(i).getAdd1()%>&nbsp; <%=Page.get(i).getAdd2()%>&nbsp;
                        	<%=Page.get(i).getAdd3()%>&nbsp; <%=Page.get(i).getAdd4()%>
                        <%}else{ %>	
                        	미입력
                        <%} %>
                        </td>
                        <td><%=Page.get(i).getJoin_date()%></td>
                     
                  
                  <%} %>
               </tr>   
               <%for (int i = Page.size(); i < 10; i++) {%>
                  <tr>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                  </tr>
               <%}%>
               </tbody>
				</table>
			</div>
		</div>
		<div class="col text-center">
		<a class="mb-2 mr-2 btn-transition btn btn-outline-info"  href="adminMain.jsp?center=UserList.jsp">처음으로</a>
		<a class="mb-2 mr-2 btn-transition btn btn-outline-info"  href="adminMain.jsp?center=UserList.jsp&pageNum=<%=Minus10_Page %>">-10</a>
		<a class="mb-2 mr-2 btn-transition btn btn-outline-info" 
		<%if(CurrentPage>1) {%>
			href="adminMain.jsp?center=UserList.jsp&pageNum=<%=CurrentPage-1 %>"
		<%}else{ %>
			href="#"
		<%} %>
		>이전</a>
		<%for(int i=startPage;i<=endPage;i++){ %>
			<a class="mb-2 mr-2 btn-transition btn btn-outline-info"  href="adminMain.jsp?center=UserList.jsp&pageNum=<%=i %>"><%=i %></a>
		<%} %>
		<a class="mb-2 mr-2 btn-transition btn btn-outline-info" 
		<%if(CurrentPage<MaxPage){ %>
			href="adminMain.jsp?center=UserList.jsp&pageNum=<%=CurrentPage+1 %>"
		<%}else{ %>
			href="#"
		<%} %>
		>다음</a>
		<a class="mb-2 mr-2 btn-transition btn btn-outline-info"  href="adminMain.jsp?center=UserList.jsp&pageNum=<%=Plus10_Page %>">+10</a>	
		<a class="mb-2 mr-2 btn-transition btn btn-outline-info"  href="adminMain.jsp?center=UserList.jsp&pageNum=<%=MaxPage %>">끝으로</a>	
		</div>
		

	</article>
</body>
</html>