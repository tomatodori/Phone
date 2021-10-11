<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="MVC.*"%>
<%@ page import="java.util.*"%>
<%
   request.setCharacterEncoding("UTF-8");

      Tab_Item item = new Tab_Item();
   
   String name = request.getParameter("name");
   
   if(name.equals(""))
      out.println("<script>alert('검색어를 입력하지 않으셨습니다.');history.go(-1);</script>");
   
   int RowCount = Common.RowCount_Target("item", "item_name", name);
   
   if(RowCount==0)
      out.println("<script>alert('입력하신 "+name+"와(과) 일치하는 상품이 없습니다.');history.go(-1);</script>");
   
   int ContentBlock = 8;
   
   int MaxPage = RowCount / ContentBlock + 1;
   
   if(RowCount / ContentBlock != 0)
      MaxPage++;
   
   int CurrentPage = 1;
   
   String pageNum = request.getParameter("pageNum");
   if (pageNum != null)
      CurrentPage = Integer.parseInt(pageNum);
   
   int StartNum = RowCount - (CurrentPage - 1) * ContentBlock;
   
   ArrayList<GetSet> Page = item.Page_ItemName(name, StartNum);
   
   int startPage = (CurrentPage -1) / 10 * 10 +1;
   
   int endPage = startPage + 9;
   
   if (endPage > MaxPage)
      endPage = MaxPage;
   
   int Plus10_Page = CurrentPage + 10;
   
   if (Plus10_Page > MaxPage)
      Plus10_Page = MaxPage;
   
   int Minus10_Page = CurrentPage - 10;
   
   if (Minus10_Page < 1)
      Minus10_Page = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Item List</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<style>
#item {
  
  
  height : 300px;
  margin-top : 20px;
}

</style>
</head>
<body>
   <form action="mainPage.jsp">
   <input type="hidden" name="center" value="Item_List_Search.jsp">
   <table>
      <tr>
         <td>
            <input type="text" name="name" size="25" placeholder="상품의 이름을 입력해주세요.">
         </td>
         <td>
            <input type="submit" value="검색">
         </td>
      </tr>
   </table>   
   </form>
   <section class="py-5">
      <div class="container px-4 px-lg-5 mt-5">
         <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
          <%for (int i = 0; i < Page.size(); i++) {%>
            <div id = "item">
               <div class="card h-100">
                  <!-- Product image-->
                  <img class="card-img-top" alt="item"
                     src="../img/<%=Page.get(i).getItem_photo()%>" >
                  <!-- Product details-->
                  <div class="card-body p-4">
                     <div class="text-center">
                        <!-- Product name-->
                        <h5 class="fw-bolder"><%=Page.get(i).getItem_name()%></h5>
                        <!-- Product price-->
                        <%=Page.get(i).getItem_price()%>원
                     </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                     <div class="text-center">
                        <a class="btn btn-outline-dark mt-auto"
                           href="../Front/mainPage.jsp?center=itemDetail.jsp&item_no=<%=Page.get(i).getItem_no()%>">
                           상품 상세보기</a>
                     </div>
                  </div>
               </div>
            </div>
            <%}%>
            <%for (int i= Page.size(); i < 8; i++) {%>
            <div id = "item">
               <div class="card h-100">
                  <!-- Product image-->
                  <img class="card-img-top" alt="item"
                     src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"  width = "450" height = "300">
                  <!-- Product details-->
                  <div class="card-body p-4">
                     <div class="text-center">
                        <!-- Product name-->
                        <h5 class="fw-bolder">등록된 상품이 없습니다.</h5>
                        <!-- Product price-->
                        Not Sale
                     </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                     <div class="text-center">
                     </div>
                  </div>
               </div>
            </div>
            <%}%>
         </div>
      </div>
   </section>
   <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="../Front/mainPage.jsp?center=Item_List_Search.jsp&name=<%=name%>&pageNum=1">처음으로</a>
   <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="../Front/mainPage.jsp?center=Item_List_Search.jsp&name=<%=name%>&pageNum=<%=Minus10_Page%>">-10</a>
   
   <a class="mb-2 mr-2 btn-transition btn btn-outline-info" 
    <%if (CurrentPage > 1) {%>
       href="mainPage.jsp?center=Item_List_Search.jsp&name=<%=name%>&pageNum=<%=CurrentPage - 1%>"
    <%} else {%> 
       href="#" 
    <%}%>
    >이전</a>
    
   <%for (int i = startPage; i <= endPage; i++) {%>
         <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="mainPage.jsp?center=Item_List_Search.jsp&name=<%=name%>&pageNum=<%=i%>"><%=i%></a>
   <%}%>
   
   <a class="mb-2 mr-2 btn-transition btn btn-outline-info" 
   <%if (CurrentPage < MaxPage) {%>
         href="mainPage.jsp?center=Item_List_Search.jsp&name=<%=name%>&pageNum=<%=CurrentPage + 1%>"
   <%} else {%> 
         href="#" 
   <%}%>
   >다음</a>
   <a class="mb-2 mr-2 btn-transition btn btn-outline-info" href="mainPage.jsp?center=Item_List_Search.jsp&name=<%=name%>&pageNum=<%=Plus10_Page%>">+10</a>

   <!-- Bootstrap core JS-->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->
   <script src="../js/scripts.js"></script>

</body>
</html>