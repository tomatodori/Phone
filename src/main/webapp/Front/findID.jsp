<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/findID.js"></script>
</head>
<body>
	<div class="user_join">
		<div class="user_title">
			<div class="heading">
				<span class='sub_title'>아이디 찾기</span>
			</div>
		</div>
		<div class="summary">
			아이디가 기억나지 않으십니까?<br />
			아래 해당하는 정보를 입력하시면 회원님의 아이디를 알려드립니다
		</div>
	</div>
	<form name="findIdForm" method="post" action="../Back/FindUser.jsp">
		<input type="hidden" name="find" value="user_id" />
		<div class="user_title2">
			<div class="left">아이디 찾기</div>
		</div>
		<div class="list_box2">
			<fieldset>
				<legend>아이디 찾기</legend>
				<div class="item">
					<label class="head2" for="code">성명</label>
					<div class="right">
						<input type="text" class="type-text" style="width: 180px; height: 17px;" id="code" name="user_name" title="성명"/>
					</div>
				</div>
				<div class="item">
					<label class="head2" for="email_name2">이메일</label>
					<div class="right">
						<input class="type-text" id="email_name2" name="mail1" style="width: 100px; height: 17px;"/> @
						<select name="mail2">
							<option>선택
							<option>naver.com
							<option>gmail.com
							<option>daum.net
						</select>
					</div>
				</div>
			</fieldset>
		</div>
		<div class="btn2">
			<span class="button small black strong"> 
				<input type="submit" class="" value="확인" title="확인" />
			</span> &nbsp; 
			<span class="button small black strong"> 
				<input type="button" class="" value="비밀번호 찾기" onclick="location='mainPage.jsp?center=findPW.jsp'" />
			</span>
		</div>
	</form>
</body>
</html>