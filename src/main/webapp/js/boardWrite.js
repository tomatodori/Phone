/**
 * 
 */
$(document).ready(function(){
	$('input:submit').click(function(){
		
		var count = 0;
		
		var hidden = $('input[name=hidden]');
		for(var i=0; i <hidden.length;i++){
			if(hidden[i].checked == true)
				count++;
		} 
		var title = $('input[name=title]').val();
		var content = $('textarea').val();
		
		if(count==0){
			alert('글 상태(공개글,비밀글) 여부를 체크하시기 바랍니다.');
			return false;
		}else if(title.length==0||title==""){
			alert('게시글의 제목을 입력하지 않으셨습니다.');
			$('input[name=title]').focus();
			return false;
		}else if(content.length==0||content==""){
			alert('게시글의 내용을 입력하지 않으셨습니다.');
			$('textarea').focus();
			return false;
		}else{
			var write = confirm('첨부이미지는 선택하지 않으셔도 작성하실 수 있습니다. 입력하신 내용으로 새로운 게시글을 작성하시겠습니까?');
			return write;
		}
	})
})