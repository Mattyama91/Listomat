<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Listomat</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
<%--  <link href="css/sb-admin-2.min.css" rel="stylesheet">--%>

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

  <!-- Sidebar -->
  <!-- Sidebar -->
  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/app/index">
      <div class="sidebar-brand-icon rotate-n-15">
        <i class="fas fa-laugh-wink"></i>
      </div>
      <div class="sidebar-brand-text mx-3">Listomat</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Divider -->
    <hr class="sidebar-divider">

    <li class="nav-item">
      <a class="nav-link collapsed" href="/app/user" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
        <i class="fas fa-fw fa-cog"></i>
        <span>Edit user data</span>
      </a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
      <a class="nav-link collapsed" href="/app/user/logout/comfirm" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
        <i class="fas fa-fw fa-folder"></i>
        <span>Logout</span>
      </a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

  </ul>
  <!-- End of Sidebar -->

  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

      <!-- Topbar -->
      <%@ include file="/header.jsp" %>
      <!-- End of Topbar -->

      <!-- Begin Page Content -->
      <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
          <a href="/app/index" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class="fas fa-download fa-sm text-white-50"></i> Yours shopping lists</a>
        </div>
        <div class="card shadow mb-4">
          <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Add product to shopping list</h6>
          </div>
          <div class="card-body">
            <form:form action="/app/product/add" method="post" modelAttribute="product">
              <form:hidden path="shoppingList.id" value="${sessionList.id}"/>
<%--              <form:hidden path="shoppingList.id" value="${sessionList.id}" />--%>
<%--            <form method="post">--%>
              <div class="form-group">
                <label for="Name">Name</label>
                <form:input path="productName" cssClass="form-control" id="Name" placeholder="Product name"/>
                <form:errors path="productName" />
<%--                <input name="userName" type="text" class="form-control" id="userName" placeholder="Nazwa użytkownika">--%>
              </div>
              <div class="form-group">
                <label for="quantity">Quantity</label>
                <form:input path="quantity" cssClass="form-control" id="quantity" placeholder="Product quantity"/>
<%--                <input name="userEmail" type="email" class="form-control" id="userEmail" placeholder="Email użytkownika">--%>
              </div>
<%--              <div class="form-group">--%>
<%--                <label for="userPassword">Hasło</label>--%>
<%--                <input name="userPassword" type="password" class="form-control" id="userPassword" placeholder="Hasło użytkownika">--%>
<%--              </div>--%>
              <input type="submit" value="Add" class="btn btn-primary">
<%--              <button type="submit" class="btn btn-primary">Zapisz</button>--%>
              </form:form>
<%--            </form>--%>

          </div>
        </div>

        <div class="card shadow mb-4">
          <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Added products in your shopping list:</h6>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table">
                <tr>
                  <%--                                    <th>Id</th>--%>
                  <th>Product name</th>
                  <th>Quantity</th>
                  <th>Actions</th>
                </tr>
                <c:forEach items="${products}" var="product">
                  <tr>
                      <%--                                        <td>Shopping list name</td>--%>
                    <td>${product.productName}</td>
                    <td>${product.quantity}</td>
                    <td>
                      <a href='<c:url value="/app/product/comfirm/${product.id}"/>'>Usuń</a>
<%--&lt;%&ndash;                      <a href='<c:url value="/user/edit?id=${user.id}"/>'>Edit</a>&ndash;%&gt;--%>
                    </td>
                  </tr>
                </c:forEach>
              </table>
            </div>
          </div>
        </div>

      </div>
      <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <!-- Footer -->
    <%@ include file="/footer.jsp" %>
    <!-- End of Footer -->

  </div>
  <!-- End of Content Wrapper -->

</div>

</body>

</html>


