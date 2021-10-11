/**
 * 
 */
$(document).ready(function(){
	$('#addCart').click(function(){
		var item_model = $('select[name=item_model]').val();
		var item_option = $('select[name=item_option]').val();
		var cart_amount = $('input[name=cart_amount]').val();
		if(item_model=='--기종을 선택해주세요--'){
			alert('기종을 선택해주세요!');
			$('select[name=item_model]').focus();
			return false;
		}else if(item_option=='--옵션을 선택해주세요--'){
			alert('옵션을 선택해주세요!');
			$('select[name=item_option]').focus();
			return false;
		}else if(cart_amount<=0){
			alert('장바구니에 담으실 수량은 최소 1개를 선택해주세요.');
			$('input[name=cart_amount]').val();
			$('input[name=cart_amount]').focus();
			return false;
		}
	})
})