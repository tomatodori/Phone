/**
 * 
 */
$(document).ready(function(){
	$('input:submit').click(function(){
		var name = $('input[name=name]').val();
		var tel1 = $('select[name=tel1]').val();
		var tel2 = $('input[name=tel2]').val();
		var tel3 = $('input[name=tel3]').val();
		var add1 = $('input[name=add1]').val();
		var add2 = $('input[name=add2]').val();
		var add3 = $('input[name=add3]').val();
		var add4 = $('input[name=add4]').val();
		var card1 = $('input[name=card1]').val();
		var card2 = $('input[name=card2]').val();
		var card3 = $('input[name=card3]').val();
		var card4 = $('input[name=card4]').val();
		var card_pw = $('input[name=card_pw]').val();
		
		if(name.length==0||name==""){
			alert('이름을 입력하지 않으셨습니다.');
			$('input[name=name]').focus();
			return false;
		}else if(!(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test(name))){
			alert('이름은 한글만 사용가능합니다.');
			$('input[name=name]').val("");
			$('input[name=name]').focus();
			return false;
		}else if(!(/[가-힣]/.test(name))){
			alert('이름을 잘 못 입력하셨습니다.');
			$('input[name=name]').val("");
			$('input[name=name]').focus();
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
		}else if(add1.length==0||add1==""){
			alert('주소를 입력하지 않으셨습니다.');
			$('input[name=add1]').val("");
			$('input[name=add1]').focus();
			return false;
		}else if(add2.length==0||add2==""){
			alert('주소를 입력하지 않으셨습니다.');
			$('input[name=add2]').val("");
			$('input[name=add2]').focus();
			return false;
		}else if(add3.length==0||add3==""){
			alert('주소를 입력하지 않으셨습니다.');
			$('input[name=add3]').val("");
			$('input[name=add3]').focus();
			return false;
		}else if(add4.length==0||add4==""){
			alert('주소를 입력하지 않으셨습니다.');
			$('input[name=add4]').val("");
			$('input[name=add4]').focus();
			return false;
		}else if(card1.length==0||card1==""){
			alert('카드번호를 입력하지 않으셨습니다.');
			$('input[name=card1]').focus();
			return false;
		}else if(isNaN(card1)){
			alert('카드번호에는 숫자만 입력가능합니다.');
			$('input[name=card1]').val("");
			$('input[name=card1]').focus();
			return false;
		}else if(card2.length==0||card2==""){
			alert('카드번호를 입력하지 않으셨습니다.');
			$('input[name=card2]').focus();
			return false;
		}else if(isNaN(card2)){
			alert('카드번호에는 숫자만 입력가능합니다.');
			$('input[name=card2]').val("");
			$('input[name=card2]').focus();
			return false;	
		}else if(card3.length==0||card3==""){
			alert('카드번호를 입력하지 않으셨습니다.');
			$('input[name=card3]').focus();
			return false;
		}else if(isNaN(card3)){
			alert('카드번호에는 숫자만 입력가능합니다.');
			$('input[name=card3]').val("");
			$('input[name=card3]').focus();
			return false;	
		}else if(card4.length==0||card4==""){
			alert('카드번호를 입력하지 않으셨습니다.');
			$('input[name=card4]').focus();
			return false;
		}else if(isNaN(card4)){
			alert('카드번호에는 숫자만 입력가능합니다.');
			$('input[name=card4]').val("");
			$('input[name=card4]').focus();
			return false;
		}else if(card_pw.length==0||card_pw==""){
			alert('카드비밀번호를 입력하지 않으셨습니다.');
			$('input[name=card_pw]').focus();
			return false;									
		}else{
			var buy =confirm('입력하신 정보로 구매신청하시겠습니까?');
			return buy;
		}
	})
})