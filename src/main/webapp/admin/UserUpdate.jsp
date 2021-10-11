<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="MVC.*"%>
<%
   String PK="";
  
   String user_id = request.getParameter("user_id");
   
   PK = user_id;
   
   Tab_User user = new Tab_User();

   GetSet model = user.Select_One_Record(PK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/address.js"></script>
<script>
	$(document).ready(function(){
	   var tel1 = "<%=model.getTel1()%>";
	   var mail2 = "<%=model.getMail2()%>";
	   var year = "<%=model.getYear()%>";
	   var month = "<%=model.getMonth()%>";
	   var day = "<%=model.getDay()%>";
	   
	   $('select[name="tel1"]').val(tel1).prop("selected",true);
	   $('select[name="mail2"]').val(mail2).prop("selected",true);
	   $('select[name="year"]').val(year).prop("selected",true);
	   $('select[name="month"]').val(month).prop("selected",true);
	   $('select[name="day"]').val(day).prop("selected",true);
	   
	   var add1 = "<%=model.getAdd1()%>";
	   var add2 = "<%=model.getAdd2()%>";
	   var add3 = "<%=model.getAdd3()%>";
	   var add4 = "<%=model.getAdd4()%>";
	   
	   if(add1!='null')
		   $('input[name=add1]').val(add1);
	   if(add2!='null')
		   $('input[name=add2]').val(add2);
	   if(add3!='null')
		   $('input[name=add3]').val(add3);
	   if(add4!='null')
		   $('input[name=add4]').val(add4);
	})
</script>
<script type="text/javascript" src="../js/userUpdate.js"></script>
<style type="text/css">
h3 {
   margin-top: 20px;
   margin-bottom: 20px;
}
tr{
   width:1000px;
   text-align:center;
}
</style>
</head>
<body>
	<h3 align="center">관리자 회원 정보 수정</h3>
	<form action = "../Back/UserUpdatePro.jsp" method = "post">
  		<article>
      		<div class="container">
         		<div class="table-responsive">
            		<table class="table table-striped table-sm">
                  		<tr>
                  			<td width = "300">아이디</td>
							<td><input type="text" name="user_id" value=<%=model.getUser_id() %> readonly="readonly"></td>
                  		</tr>
                  		<tr>
                     		<td>비밀번호</td>
                     		<td><input type="text" name="user_pw" value=<%=model.getUser_pw() %> readonly="readonly"></td>
                  		</tr>
                  		<tr>
                     		<td>이름</td>
                    		<td><input type="text" name="user_name" value=<%=model.getUser_name() %>></td>
                  		</tr>
                  		<tr>
                     		<td>이메일</td>
                     		<td><input type="text" value="<%=model.getMail1() %>" size="8" name="mail1" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-secondary">&nbsp; @ &nbsp;
              					<select name="mail2" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-secondary">
                    				<option>선택</option>
			                        <option>daum.net</option>
			                        <option>naver.com</option>
			                        <option>gmail.com</option>
                     			</select>
                     		</td>
                     	</tr>	
                  		<tr>
                     		<td>전화번호</td>
                     		<td> 
                     			<select name="tel1" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-secondary">
									<option>선택</option>
									<option>010</option>
									<option>011</option>
									<option>016</option>
                        		</select>&nbsp;-&nbsp;
                           		<input type="text" size = "1" value=<%=model.getTel2() %> name="tel2" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-secondary">&nbsp;-&nbsp;
                           		<input type="text" size = "1" value=<%=model.getTel3() %> name="tel3" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-secondary">
                           	</td>
                  		</tr>
                  		<tr>
                     		<td>주소</td>
                     		<td><input type="text" name="add1" id="sample6_postcode" size="4" placeholder="우편번호" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-dark">
                        	<input type="button" onclick="FindAddress()" value="우편번호 찾기" class="mb-2 mr-2 btn btn-secondary active"><br>
                        	<input type="text" name="add2" id="sample6_address" placeholder="주소" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-dark"><br>
                        	<input type="text" name="add3" id="sample6_extraAddress" placeholder="참고항목" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-dark"><br>
                        	<input type="text" name="add4" id="sample6_detailAddress" placeholder="상세주소" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-dark"></td>
                  		</tr>
                  		<tr>
                     		<td>생년월일</td>
                     	<%int CurrentYear = Calendar.getInstance().get(Calendar.YEAR);%>	
                     		<td>
                     			<select name="year" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-secondary">
									<option>선택</option>
								<%for(int i=CurrentYear;i>=1900;i--){%>
									<option><%=i %></option>   
								<%} %>
								</select>&nbsp; 년 &nbsp;
								<select name="month" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-secondary">
									<option>선택</option>
								<%for(int i=1;i<=12;i++){%>
									<option><%=i %></option>   
								<%} %>
								</select> &nbsp; 월 &nbsp;
								<select name="day" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-secondary">
									<option>선택</option>
								<%for(int i=1;i<=31;i++) {%>
					   				<option><%=i %></option>
								<%} %>   
								</select> &nbsp; 일 &nbsp;
							</td>
                  		</tr>
               		</table>
               </div>
			</div>
		</article>
     	<button type="submit" id="update" class="mb-2 mr-2 btn-transition btn btn-outline-info">수정하기</button>
    	<button type="button" onclick="location.href='adminMain.jsp?center=UserUpdate.jsp?user_id=<%=PK %>'" class="mb-2 mr-2 btn-transition btn btn-outline-info">초기화</button>
    	<button type="button" onclick="location.href='adminMain.jsp?center=UserList.jsp'" class="mb-2 mr-2 btn-transition btn btn-outline-info">사이트 메인</button>
	</form>
</body>
</html>