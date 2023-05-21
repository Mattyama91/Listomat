<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%--    <link href="css/sb-admin-2.min.css" rel="stylesheet">--%>

</head>
<%--        ------------------------------%>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

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

        <!-- Nav Item - Dashboard -->
<%--        <li class="nav-item active">--%>
<%--            <a class="nav-link" href="index.html">--%>
<%--                <i class="fas fa-fw fa-tachometer-alt"></i>--%>
<%--                <span>Dashboard</span></a>--%>
<%--        </li>--%>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
<%--        <div class="sidebar-heading">--%>
<%--            User--%>
<%--        </div>--%>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="/app/user" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-cog"></i>
                <span>Edit user data</span>
            </a>
<%--            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">--%>
<%--                <div class="bg-white py-2 collapse-inner rounded">--%>
<%--                    <h6 class="collapse-header">Custom Components:</h6>--%>
<%--                    <a class="collapse-item" href="buttons.html">Buttons</a>--%>
<%--                    <a class="collapse-item" href="cards.html">Cards</a>--%>
<%--                </div>--%>
<%--            </div>--%>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">--%>
<%--                <i class="fas fa-fw fa-wrench"></i>--%>
<%--                <span>Utilities</span>--%>
<%--            </a>--%>
<%--            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">--%>
<%--                <div class="bg-white py-2 collapse-inner rounded">--%>
<%--                    <h6 class="collapse-header">Custom Utilities:</h6>--%>
<%--                    <a class="collapse-item" href="utilities-color.html">Colors</a>--%>
<%--                    <a class="collapse-item" href="utilities-border.html">Borders</a>--%>
<%--                    <a class="collapse-item" href="utilities-animation.html">Animations</a>--%>
<%--                    <a class="collapse-item" href="utilities-other.html">Other</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </li>--%>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
<%--        <div class="sidebar-heading">--%>
<%--            Addons--%>
<%--        </div>--%>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="/app/user/logout/comfirm" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-folder"></i>
                <span>Logout</span>
            </a>
<%--            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">--%>
<%--                <div class="bg-white py-2 collapse-inner rounded">--%>
<%--                    <h6 class="collapse-header">Login Screens:</h6>--%>
<%--                    <a class="collapse-item" href="login.html">Login</a>--%>
<%--                    <a class="collapse-item" href="register.html">Register</a>--%>
<%--                    <a class="collapse-item" href="forgot-password.html">Forgot Password</a>--%>
<%--                    <div class="collapse-divider"></div>--%>
<%--                    <h6 class="collapse-header">Other Pages:</h6>--%>
<%--                    <a class="collapse-item" href="404.html">404 Page</a>--%>
<%--                    <a class="collapse-item" href="blank.html">Blank Page</a>--%>
<%--                </div>--%>
<%--            </div>--%>
        </li>

        <!-- Nav Item - Charts -->
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link" href="charts.html">--%>
<%--                <i class="fas fa-fw fa-chart-area"></i>--%>
<%--                <span>Charts</span></a>--%>
<%--        </li>--%>

        <!-- Nav Item - Tables -->
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link" href="tables.html">--%>
<%--                <i class="fas fa-fw fa-table"></i>--%>
<%--                <span>Tables</span></a>--%>
<%--        </li>--%>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
<%--        <div class="text-center d-none d-md-inline">--%>
<%--            <button class="rounded-circle border-0" id="sidebarToggle"></button>--%>
<%--        </div>--%>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
<%--        ------------------------------%>

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@ include file="/header.jsp" %>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <a href="/app/list/add"  class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Add new shopping list</a>
                    <form action="/app/list/filter" method="post" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input name = "lName" type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <input type="submit" value="Search" class="btn btn-primary btn-user btn-block">
<%--                                <button class="btn btn-primary" type="button">--%>
<%--                                    <i class="fas fa-search fa-sm"></i>--%>
<%--                                </button>--%>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Yours shopping lists</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
<%--                                    <th>Id</th>--%>
                                    <th>Shopping list name</th>
                                    <th>Items</th>
                                    <th>Actions</th>
                                </tr>
                                <c:forEach items="${shoppingLists}" var="shoppingList">
                                    <tr>
<%--                                        <td>Shopping list name</td>--%>
                                        <td>${shoppingList.listName}</td>
                                        <td>30</td>
                                        <td>
                                            <a href='<c:url value="/app/list/comfirm/${shoppingList.id}"/>'>Delete</a>
                                            <a href='<c:url value="/app/list/edit/${shoppingList.id}"/>'>Edit</a>
<%--                                            <a href="/app/product/add">Edit</a>--%>
                                            <a href='<c:url value="/app/product/show/${shoppingList.id}"/>'>Show</a>
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
