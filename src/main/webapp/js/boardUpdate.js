/**
 * 
 */
$(document).ready(function(){
	$('input:submit').click(function(){
		var title = $('input[name=title]').val();
		var content = $('textarea').val();
		if(title.length==0||title==""){
			alert('게시글의 제목을 입력하지 않으셨습니다.');
			$('input[name=title]').focus();
			return false;
		}else if(content.length==0||content==""){
			alert('게시글의 내용을 입력하지 않으셨습니다.');
			$('textarea').focus();
			return false;
		}else{
			var update = confirm('입력하신 내용으로 게시글을 수정하시겠습니까?');
			return update;
		}
	})
	
})