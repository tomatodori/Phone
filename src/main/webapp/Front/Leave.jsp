<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%String user_id = (String)session.getAttribute("user_id");%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
   $(document).ready(function(){

      $('#leave').click(function(){
    	var user_pw = $('input:password').val();
    		if(user_pw.length==0||user_pw=="")
    			alert('비밀번호를 입력하지 않으셨습니다');
    		else{
    			var check=confirm('정말 탈퇴하시겠습니까?');
    			if(check)
    				$('form[name="leave"]').submit();
    		}
      })
   })
</script>
</head>
<body>
	<h4>회원 탈퇴</h4>
	<h5>탈퇴가 완료된 계정은 다시 복구할 수 없습니다. 탈퇴하시겠습니까?</h5>

	<form action="../Back/LeavePro.jsp" name="leave" method="post">
		<p>
			<input type="text" name="user_id" value="<%=user_id%>" readonly="readonly"><br>
			 <input type="password" name="user_pw" placeholder="비밀번호를 입력하세요."><br>
			<input type="button" id="leave" value="탈퇴">
			<input type="reset" value="다시입력">
	</form>
</body>
</html>



