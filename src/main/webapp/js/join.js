/**
 * 
 */
$(document).ready(function(){
	$('input[name=check_pw]').blur(function(){
		var pw = $('input[name=user_pw]').val();
		var check_pw = $('input[name=check_pw]').val();
		if(pw.length==0||pw==""){
			alert('비밀번호를 입력하지 않으셨습니다.');
			$('input[name=check_pw]').val("");
			$('input[name=user_pw]').focus();
		}else if(pw.length<8||pw.length>20){
			alert('비밀번호는 8~20 자리로 입력해주세요!');
			$('input[name=user_pw]').val("");
			$('input[name=check_pw]').val("");
			$('input[name=user_pw]').focus();
		}else if(pw!=check_pw){
			alert('입력하신 비밀번호가 일치하지 않습니다!');
			$('input[name=user_pw]').val("");
			$('input[name=check_pw]').val("");
			$('input[name=user_pw]').focus();
		}else{
			alert('비밀번호가 일치합니다.');
		}
	})
	$('#join').click(function(){
		var id = $('input[name=user_id]').val();
		var pw = $('input[name=user_pw]').val();
		var check_pw = $('input[name=check_pw]').val();
		var user_name = $('input[name=user_name]').val();
		var mail1 = $('input[name=mail1]').val();
		var mail2 = $('select[name=mail2]').val();
		var tel1 = $('select[name=tel1]').val();
		var tel2 = $('input[name=tel2]').val();
		var tel3 = $('input[name=tel3]').val();
		if(id.length==0||id==""){
			alert('ID를 입력하지 않으셨습니다.');
			$('input[name=user_id]').focus();
			return false;
		}else if(id.length<8||id.length>20){
			alert('ID는 8~20 자리로 입력해주세요!');
			$('input[name=user_id]').focus();
			return false;
		}else if(isNaN(id)=='true'){
			alert('ID는 8~20 자리의 영문 혹은 영문+숫자 조합으로 입력해주세요!');
			$('input[name=user_id]').focus();
			return false;
		}else if(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test(id)){
			alert("아이디로 한글은 사용하실 수 없습니다.");
			$('input[name=user_id]').focus();
			return false;
		}else if(pw.length==0||pw==""){
			alert('비밀번호를 입력하지 않으셨습니다.');
			$('input[name=check_pw]').val("");
			$('input[name=user_pw]').focus();
			return false;
		}else if(check_pw.length==0||check_pw==""||pw!=check_pw){
			alert('"비밀번호 확인"란에서 입력하신 비밀번호를 다시 입력해주세요!');
			$('input[name=user_pw]').focus();
			$('input[name=user_pw]').val("");
			$('input[name=check_pw]').val("");
			return false;
		}else if(user_name.length==0||user_name==""){
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
		}else if(tel1=='선택'){
			alert('전화번호 앞 3자리[010,011,016]를 선택해주세요.');
			$('select[name=tel1]').focus();
			return false;
		}else if(tel2.length==0||tel2==""){
			alert('전화번호 중간 4자리를 입력하지 않으셨습니다.');
			$('input[name=tel2]').focus();
			return false;
		}else if(isNaN(tel2)){
			alert('전화번호에는 숫자만 입력가능합니다.');
			$('input[name=tel2]').val("");
			$('input[name=tel2]').focus();
			return false;
		}else if(tel2.length<3){
			alert('전화번호(가운데 번호)는 3~4 자리로 입력해주세요.');
			$('input[name=tel2').val("");
			$('input[name=tel2').focus();
			return false;
		}else if(tel3.length==0||tel3==""){
			alert('전화번호 마지막 4자리를 입력하지 않으셨습니다.');
			$('input[name=tel3]').focus();
			return false;
		}else if(isNaN(tel3)){
			alert('전화번호에는 숫자만 입력가능합니다.');
			$('input[name=tel3]').val("");
			$('input[name=tel3]').focus();
			return false;
		}else if(tel3.length!=4){
			alert('전화번호(끝 번호)는 4 자리로 입력해주세요.');
			$('input[name=tel3').val("");
			$('input[name=tel3').focus();
			return false;	
		}else{
			var join =confirm('주소와 생년월일은 입력하지 않으셔도 회원가입 가능합니다. 입력하신 정보로 가입하시겠습니까?');
			return join;
		}
	})
})