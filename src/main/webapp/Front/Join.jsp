<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="../css/join.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/address.js"></script>
<script type="text/javascript" src="../js/join.js"></script>
</head>
<body>
	<form action = "../Back/JoinPro.jsp" method = "post">
  	<label>
    	<p class="label-txt">아이디</p>
    		<input type="text" name="user_id" class="input">
    		<div class="line-box">
      			<div class="line"></div>
    		</div>
 	</label>
	<label>
    	<p class="label-txt">비밀번호</p>
			<input type="password" name="user_pw" class="input">
			<div class="line-box">
				<div class="line"></div>
			</div>
 	</label>
	<label>
    	<p class="label-txt">비밀번호 확인</p>
			<input type="password" name="check_pw" class="input"><br>
			<div class="line-box">
				<div class="line"></div>
			</div>
	</label>
	<label>
		<p class="label-txt">이름</p>
			<input type="text" name="user_name" class="input">
			<div class="line-box">
				<div class="line"></div>
			</div>
	</label>
	<label>
		<p class="label-txt">이메일</p>
			<input type="text" size="8" name="mail1" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-secondary">&nbsp; @ &nbsp;
			<select name="mail2" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-secondary">
				<option>선택</option>
				<option>daum.net</option>
				<option>naver.com</option>
				<option>gmail.com</option>
            </select>
			<div class="line-box">
      			<div class="line"></div>
			</div>
  	</label>
	<label>
    	<p class="label-txt">전화번호</p>
		<select name="tel1" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-secondary">
			<option>선택</option>
			<option>010</option>
			<option>011</option>
			<option>016</option>
		</select>&nbsp;-&nbsp;
		<input type="text" size = "1" name="tel2" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-secondary">&nbsp;-&nbsp;
		<input type="text" size = "1"  name="tel3" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-secondary">
		<div class="line-box">
			<div class="line"></div>
		</div>
	</label>
	<label>
    	<p class="label-txt">주소</p>
    	<input type="text" name="add1" id="sample6_postcode" size="4" placeholder="우편번호" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-dark">
		<input type="button" onclick="FindAddress()" value="우편번호 찾기" class="mb-2 mr-2 btn btn-secondary active"><br>
		<input type="text" name="add2" id="sample6_address" placeholder="주소" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-dark"><br>
		<input type="text" name="add3" id="sample6_extraAddress" placeholder="참고항목" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-dark"><br>
		<input type="text" name="add4" id="sample6_detailAddress" placeholder="상세주소" class="mb-2 mr-2 border-0 btn-transition btn btn-outline-dark">
    	<div class="line-box">
      		<div class="line"></div>
    	</div>
	</label>
	<label>
    	<p class="label-txt">생년월일</p>
		<%int CurrentYear = Calendar.getInstance().get(Calendar.YEAR);%>
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
		<div class="line-box">
			<div class="line"></div>
		</div>
	</label>
  	<button type="submit" id="join">회원가입</button>
    <button type="reset" onclick="return confirm('리셋하시겠습니까?')">초기화</button>
    <button type="button" onclick="location.href='../Front/mainPage.jsp'">사이트 메인</button>
</form>

</body>
</html>