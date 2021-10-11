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
<html lang="utf-8">
<head>
<script>
	function del_click() {
		
	 if (!confirm("상품을 삭제하시겠습니까? 삭제(예) 또는 취소(아니오)를 선택해주세요."))
	    alert("상품 삭제를 취소하였습니다.");
	 else
	    location.href='../Back/itemDelete.jsp?item_no=<%=OneItem.getItem_no()%>';
	    
	}
</script>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Item</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/itemInfostyles.css" rel="stylesheet" />
</head>
<body>
	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
			
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="../img/<%=OneItem.getItem_photo()%>" alt="item" />
				</div>
				
				<div class="col-md-6">
					<h1 class="display-5 fw-bolder"><%=OneItem.getItem_name()%></h1>
					<div class="fs-5 mb-5">
						<span>￦ <%=OneItem.getItem_price()%></span>
					</div>
					<p class="lead">
						<p>
							기종 : 
							<%if (OneItem.getItem_group().equals("iphone")) {%>
								아이폰12 Pro, 아이폰12, 아이폰11 Pro, 아이폰11
							<%} else if (OneItem.getItem_group().equals("galaxy")) {%>
								갤럭시12, 갤럭시11, 갤럭시10, 갤럭시9
							<%} else {%>
								LG 기종, 모토로라, 블랙베리, 샤오미폰
							<%}%>
						</p>
						<%StringTokenizer option = new StringTokenizer(OneItem.getItem_option(), "/");%>
						<p>
							옵션 : 
							<%while (option.hasMoreTokens()) {%>
								<%=option.nextToken()%>&nbsp;
							<%}%>
						</p>
						
						<button class="btn btn-outline-dark flex-shrink-0" onclick="location.href = '../admin/adminMain.jsp?center=itemUpdate.jsp?&item_no=<%=OneItem.getItem_no()%>'">수정하기</button>&nbsp;
						<button class="btn btn-outline-dark flex-shrink-0" id="del" onclick="del_click();">삭제하기</button>
					</div>
				</div>
			</div>

			<h1 align="center">details</h1>
			<div id="info">
				<img src="../img/<%=OneItem.getItem_desc()%>" width="700">
			</div>
		</section>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../js/scripts_itemInfo.js"></script>

</body>
</html>
