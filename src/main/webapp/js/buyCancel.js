/**
 * 
 */
$(document).ready(function(){
	$('input:submit').click(function(){
		var message = $('textarea').val();
		var user_pw = $('input:password').val();
		if(message.length==0||message==""){
			alert('취소(환불) 사유를 입력하지 않으셨습니다.');
			$('textarea').focus();
			return false;
		}else if(user_pw.length==0||user_pw==""){
			alert('비밀번호를 입력하지 않으셨습니다.');
			$('input:password').focus();
			return false;
		}else {
			var cancel = confirm('해당 구매내역을 취소하시겠습니까?');
			return cancel;
		}
	})
})