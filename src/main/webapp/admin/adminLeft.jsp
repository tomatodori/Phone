<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin - MyPhone Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="adminMain.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">My Phone</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="adminMain.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>메인 화면</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>상품 관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">product management</h6>
                        <a class="collapse-item" href="adminMain.jsp?center=itemInsert.jsp">상품 등록</a>
                        <a class="collapse-item" href="adminMain.jsp?center=adItemListGroup.jsp?group=iphone">IPhone 상품 목록</a>
                        <a class="collapse-item" href="adminMain.jsp?center=adItemListGroup.jsp?group=galaxy">Galaxy 상품 목록</a>
                         <a class="collapse-item" href="adminMain.jsp?center=adItemListGroup.jsp?group=other">Other 상품 목록</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>회원 / 주문 관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Member management</h6>
                        <a class="collapse-item" href="adminMain.jsp?center=UserList.jsp">회원 목록</a>
                        <h6 class="collapse-header">Order management</h6>
                        <a class="collapse-item" href="adminMain.jsp?center=OrderList.jsp">전체 주문 목록</a>
                        <a class="collapse-item" href="adminMain.jsp?center=Order_List_Group.jsp?buy_type=0">주문 신청 목록</a>
                        <a class="collapse-item" href="adminMain.jsp?center=Order_List_Group.jsp?buy_type=1">주문 배송 목록</a>
                        <a class="collapse-item" href="adminMain.jsp?center=Order_List_Group.jsp?buy_type=2">주문 완료 목록</a>
                         <a class="collapse-item" href="adminMain.jsp?center=Order_List_Group.jsp?buy_type=3">환불 신청 목록</a>
                         <a class="collapse-item" href="adminMain.jsp?center=Order_List_Group.jsp?buy_type=4">환불 완료 목록</a>
                    </div>
                </div>
            </li>
            
             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                   <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Board management</h6>
                        <a class="collapse-item" href="adminMain.jsp?center=adminBoardList.jsp?board_type=0">Q&A 목록</a>
                        <a class="collapse-item" href="adminMain.jsp?center=adminBoardList.jsp?board_type=1">Review 목록</a>
                </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

           
            <!-- Nav Item - Pages Collapse Menu -->
           

     

          

           

           

        </ul>
        </div>
        
        
        
          <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

</body>
</html>