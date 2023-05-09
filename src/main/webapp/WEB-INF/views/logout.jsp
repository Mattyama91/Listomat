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

  <title>Listomat - logout</title>

  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">

</head>

<body id="page-top">

<div id="wrapper">

  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/app/index">
      <div class="sidebar-brand-icon rotate-n-15">
        <i class="fas fa-laugh-wink"></i>
      </div>
      <div class="sidebar-brand-text mx-3">Listomat</div>
    </a>

  </ul>

  <div id="content-wrapper" class="d-flex flex-column">

    <div id="content">

      <%@ include file="/header.jsp" %>

      <div class="container-fluid">

        <div class="card shadow mb-4">
          <div class="card-body">
            <div class="table-responsive">
              <table class="table">
                <tr>
                  <th>Are you sure you want to logout?</th>
                </tr>
                <tr>
                  <td>
                    <a href="/app/user/logout" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> YES </a>
                  </td>
                  <td>
                    <a href="/app/index" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> NO </a>
                  </td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>

    </div>

    <%@ include file="/footer.jsp" %>

  </div>

</div>

</body>

</html>
