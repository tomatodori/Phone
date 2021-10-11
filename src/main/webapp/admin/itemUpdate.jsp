<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MVC.*"%>
<%@ page import="java.util.*"%>
<%
	Tab_Item item = new Tab_Item();

	String PK = request.getParameter("item_no");

	GetSet OneItem = item.Select_One_Record(PK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/itemUpdate.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var group = "<%=OneItem.getItem_group() %>";
	
	$('select[name="item_group"]').val(group).prop("selected",true);
	
	var options = "<%=OneItem.getItem_option() %>";
	
	var option = options.split('/');
	
	for(var i in option)
		$("input[name=item_option][value="+option[i]+"]").prop("checked",true);
})
</script>
<style>
#iteminsert {
padding-top : 100px;
}
</style>
</head>
<body>
	<p id = "iteminsert"></p>
	<h2 align = "center" >상품수정</h2>
	<form action="../Back/itemUpdatePro.jsp" method="post" enctype="multipart/form-data">
		<table align = "center" border = "1" width = "600">
			<tr height = "50">
				<td align = "center" width = "100">상품이름</td>
				<td><input type="text" name="item_name" value=<%=OneItem.getItem_name() %>></td>
			</tr>
			<tr height="50">
            	<td align="center" width="100">상품기종</td>
            	<td>
					<select name="item_group">
						<option value="galaxy">갤럭시</option>
                  		<option value="iphone">아이폰</option>
                  		<option value="other">기타</option>
               		</select>
            	</td> 
         	</tr>   
            <tr height = "50">
               <td align = "center" width = "100">상품옵션</td>
               <td>
                  <input type="checkbox" name="item_option" value="A">A&nbsp;
                  <input type="checkbox" name="item_option" value="B">B&nbsp; 
                  <input type="checkbox" name="item_option" value="C">C&nbsp;
                  <input type="checkbox" name="item_option" value="D">D&nbsp;
                  <input type="checkbox" name="item_option" value="E">E&nbsp;
               </td>
            </tr>
            <tr height = "50">
               <td align = "center" width = "100">상품가격</td>
               <td><input type="text" name="item_price" value="<%=OneItem.getItem_price() %>">원</td>
            </tr>
             <tr height = "50">
               <td align = "center" width = "100">등록된 상품사진</td>
               <td>
			   		<img alt="item" src="../img/<%=OneItem.getItem_photo()%>" width="160">
               </td>
            </tr>
            <tr height = "50">
               <td align = "center" width = "100">수정할 상품사진</td>
               <td>
               		<input type="file" name="item_photo" id="item_photo" accept="image/*">
               		<div style="font-size:0.3rem;color:red;">첨부이미지를 선택하지 않으시면 기존 저장값 그대로 유지됩니다.</div>
               		<input type="hidden" name="currentPhoto" value="<%=OneItem.getItem_photo() %>">
               </td>
            </tr>
            <tr height = "50">
               <td align = "center" width = "100">등록된 상품상세사진</td>
               <td>
               		<img alt="desc" src="../img/<%=OneItem.getItem_desc() %>" width="160">
               </td>
            </tr>
            <tr height = "50">
               <td align = "center" width = "100">수정할 상품상세사진</td>
               <td>
               		<input type="file" name="item_desc" id="item_desc" accept="image/*">
               		<div style="font-size:0.3rem;color:red;">첨부이미지를 선택하지 않으시면 기존 저장값 그대로 유지됩니다.</div>
               		<input type="hidden" name="currentDesc" value="<%=OneItem.getItem_desc() %>">
               </td>
            </tr>
            <tr height = "50">
               <td colspan = "2"  align = "center">
               	  <input type="hidden" name="item_no" value="<%=PK %>" />
                  <input type = "submit" value = "상품수정"/>&nbsp;
                  <input type = "button" value = "되돌리기" onclick="location.href='adminMain.jsp?center=itemUpdate.jsp?&item_no=<%=OneItem.getItem_no()%>'"/>&nbsp;
                  <input type="button" value="수정취소" onclick="location.href='adminMain.jsp?center=aditemDetail.jsp&item_no=<%=OneItem.getItem_no()%>'">
               </td>
            </tr>   
         </table>
      </form>   
</body>
</html>