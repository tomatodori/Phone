/**
 * 
 */
$(document).ready(function(){
	$('input:submit').click(function(){
		var content = $('textarea').val();
		if(content.length==0||content==""){
			alert('게시글의 내용을 입력해주세요.');
			$('textarea').focus();
			return false;	
		}else{
			var ripple = confirm('입력하신 내용으로 답글을 작성하시겠습니까?');
			return ripple;
		}
	})
})