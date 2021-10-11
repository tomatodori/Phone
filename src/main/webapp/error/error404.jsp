<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%
	response.setStatus(200);
%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>error 404</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<meta charset="UTF-8">
<title>404에러 페이지</title>
</head>
<body>
	<div class="container-fluid">

		<!-- 404 Error Text -->
		<div class="text-center">
			<div class="error mx-auto" data-text="404">404</div>
			<p class="lead text-gray-800 mb-5">Page Not Found</p>
			<p class="text-gray-500 mb-0">빠른 시간 내에 문제를 해결하도록 하겠습니다.</p>
			<a href="javascript:history.back();">&larr; Go to previous page</a>
		</div>

	</div>

</body>
</html>