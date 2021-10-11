/**
 * 
 */
$(document).ready(function(){
		$('input:submit').click(function(){
			var id = $('input[name=user_id]').val();
			var pw = $('input[name=user_pw]').val();
			if(id.length==0||id==""){
				alert('ID를 입력해주세요!');
				$('input[name=user_id]').focus();
				return false;
			}else if(pw.length==0||pw==""){
				alert('비밀번호를 입력해주세요!');
				$('input[name=user_pw]').focus();
				return false;
			}
		})
	})