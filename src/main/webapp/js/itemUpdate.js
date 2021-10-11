/**
 * 
 */
$(document).ready(function(){
	$('input:submit').click(function(){
		var item_name =$('input[name=item_name]').val();
		var item_group = $('select[name="item_group"]').val();
		var count = 0;
		var options = $('input[name=item_option]');
		for(var i=0; i <options.length;i++){
			if(options[i].checked == true)
				count++;
		} 
		var item_price = $('input[name="item_price"]').val();
		if(item_name.length==0||item_name==""){
			$('input[name=item_name]').focus();
			alert('상품명은 반드시 입력하셔야합니다.');
			return false;
		}else if(item_name.length<4||item_name.length>30){
			alert('상품명은 4~30자리 사이로 입력해주세요.');
			$('input[name=item_name]').focus();
			return false;
		}else if(item_group=='--선택--'){
			alert('등록하실 상품의 기종을 선택해주세요.');
			$('select[name="item_group"]').focus();
			return false;
		}else if(count==0){
			alert('반드시 한개 이상의 옵션을 체크하셔야 합니다.');
			return false;
		}else if(item_price.length==0||item_price==""){
			alert('상품가격을 입력하지 않으셨습니다.');
			$('input[name=item_price]').focus();
			return false;
		}else if(isNaN(item_price)){
			alert('상품가격에는 숫자만 입력해주시기 바랍니다.');
			$('input[name=item_price]').val("");
			$('input[name=item_price]').focus();
			return false;
		}else {
			var update = confirm('수정하신 내용으로 상품정보를 업데이트 하시겠습니까?');
			return update;
		}	
		
	})
})