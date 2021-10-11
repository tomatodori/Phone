<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="MVC.*"%>
<%
   String PK="";
   if(session.getAttribute("user_id")!=null)
      PK=(String)session.getAttribute("user_id");
   
   Tab_User user = new Tab_User();

   GetSet model = user.Select_One_Record(PK);
   
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
<title>MyInfo.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
   $(document).ready(function(){

      $('#update').click(function(){
         var check = prompt('본인확인을 위해 비밀번호를 입력해주세요.');
         if(check==<%=model.getUser_pw()%>){
            alert('비밀번호가 일치합니다! 회원정보 수정 화면으로 넘어갑니다.');
            location.href='../Front/mainPage.jsp?center=MyInfoUpdate.jsp';
         }else
            alert('비밀번호가 일치하지 않습니다.');
      })
   })
</script>
</head>
<body>
   <h2 align="center">내 회원 정보</h2>
      <article>
         <div class="container">
            <div class="table-responsive">
               <table class="table table-striped table-sm">
                  <tr width="700px" align="center">

                     <td width="300px">아이디</td>
                     <td><%=model.getUser_id()%></td>

                  </tr>
                  <tr width="700px" align="center">
                     <td>이름</td>
                     <td><%=model.getUser_name()%></td>
                  </tr>
                  <tr width="700px" align="center">
                     <td>이메일</td>
                     <td><%=model.getMail1()%>@ <%=model.getMail2()%></td>
                  </tr>
                  <tr width="700px" align="center">
                     <td>전화번호</td>
                     <td>+82) &nbsp; <%=model.getTel1()%>- <%=model.getTel2()%>-
                        <%=model.getTel3()%></td>
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
            <button id="update" class="btn btn-secondary">수정하기</button>&nbsp;
            <button id="delete" class="btn btn-secondary" onclick="location.href='mainPage.jsp?center=Leave.jsp'">탈퇴하기</button>&nbsp;
         </div>
      </article>
</body>
</html>

