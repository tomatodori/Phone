/**
 * 
 */
$(document).ready(function(){
	$('input:submit').click(function(){
		var user_name = $('input[name=user_name]').val();
		var mail1 = $('input[name=mail1]').val();
		var mail2 = $('select[name=mail2]').val();
		if(user_name.length==0||user_name==""){
			alert('이름을 입력하지 않으셨습니다.');
			$('input[name=user_name]').focus();
			return false;
		}else if(!(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test(user_name))){
			alert('이름은 한글만 사용가능합니다.');
			$('input[name=user_name]').val("");
			$('input[name=user_name]').focus();
			return false;
		}else if(!(/[가-힣]/.test(user_name))){
			alert('이름을 잘 못 입력하셨습니다.');
			$('input[name=user_name]').val("");
			$('input[name=user_name]').focus();
			return false;
		}else if(mail1.length==0||mail1==""){
			alert('이메일을 입력하지 않으셨습니다.');
			$('input[name=mail1]').focus();
			return false;
		}else if(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test(mail1)){
			alert("이메일에 한글은 입력하실 수 없습니다.");
			$('input[name=mail1]').val("");
			$('input[name=mail1]').focus();
			return false;
		}else if(mail2=='선택'){
			alert('이메일의 도메인을 선택해주세요. ex) naver.com');
			$('select[name=mail2]').focus();
			return false;
		}
	})
})