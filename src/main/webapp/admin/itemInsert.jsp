<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>상품 등록 페이지</title>
<style>
#iteminsert {
padding-top : 100px;
}
h3 {
   margin-top: 20px;
   margin-bottom: 20px;
}
tr{
   width:700px;
   
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/itemInsert.js"></script>
</head>
<body>
	<p id = "iteminsert"></p>
	<h3 align="center">상품등록</h3>
	<form action="../Back/NewItemPro.jsp" method="post" enctype="multipart/form-data">
		<article>
			<div class="container">
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<colgroup>
							<col style="width: 50%;" />
							<col style="width: 50%;" />
               			</colgroup>
               			<tr>
               				<td align = "center" width = "100">상품이름</td>
               				<td><input type="text" name="item_name"></td>
            			</tr>
         				<tr>
         					<td align="center" width="100">상품기종</td>
            				<td>
               					<select name="item_group">
               						<option>--선택--</option>
                  					<option value="galaxy">갤럭시</option>
				                    <option value="iphone">아이폰</option>
				                    <option value="other">기타</option>
				                </select>
            				</td> 
						</tr>   
						<tr>
               				<td align = "center" width = "100">상품옵션</td>
               				<td>
                  				<input type="checkbox" name="options" value="A">A&nbsp;
                  				<input type="checkbox" name="options" value="B">B&nbsp; 
                  				<input type="checkbox" name="options" value="C">C&nbsp;
                  				<input type="checkbox" name="options" value="D">D&nbsp;
                  				<input type="checkbox" name="options" value="E">E&nbsp;
               				</td>
            			</tr>
            			<tr height = "50">
               				<td align = "center" width = "100">상품가격</td>
               				<td><input type="text" name="item_price">원</td>
            			</tr>
            			<tr height = "50">
               				<td align = "center" width = "100">상품사진</td>
               				<td><input type="file" name="item_photo" id="item_photo" accept="image/*"></td>
            			</tr>
            			<tr height = "50">
               				<td align = "center" width = "100">상품상세사진</td>
               				<td><input type="file" name="item_desc" id="item_desc" accept="image/*"></td>
            			</tr>
            			<tr height = "50">
               				<td colspan = "2"  align = "center">
                  				<input type = "submit" value = "상품등록"/>&nbsp;
                  				<input type = "reset" value = "다시입력"/>&nbsp;
                  				<input type = "button" value = "상품목록" onclick = "location.href = 'adminMain.jsp?center=adItemListGroup.jsp&group=iphone'"/>
               				</td>
						</tr>   
					</table>
				</div>
			</div>
		</article>
	</form>       
</body>
</html>