<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Listomat - Register</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
<%--    <link href="css/sb-admin-2.min.css" rel="stylesheet">--%>

</head>

<body class="bg-gradient-primary">

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register-image">
                    <img src="theme/img/LISTOMAT.png" alt="Listomat logo">
                </div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                        </div>
                        <form:form action="/save" method="post" modelAttribute="user" cssClass="user">
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <form:input path="firstName" cssClass="form-control form-control-user" id="exampleFirstName" placeholder="First Name"/>
                                    <form:errors path="firstName" cssClass="text-danger"/>
                                </div>
                                <div class="col-sm-6">
                                    <form:input path="lastName" cssClass="form-control form-control-user" id="exampleFirstName" placeholder="Last Name"/>
                                    <form:errors path="lastName" cssClass="text-danger"/>
<%--                                    <input type="text" class="form-control form-control-user" id="exampleLastName" placeholder="Last Name">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <form:input path="email" cssClass="form-control form-control-user" id="exampleInputEmail" placeholder="Email Address"/>
                                <form:errors path="email" cssClass="text-danger"/>
                                <p class="text-danger">
                                    <c:out value="${loginAlert}"/>
                                </p>
<%--                                <input type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Email Address">--%>
                            </div>
<%--                            <div class="form-group">--%>
<%--                                <form:password path="password" cssClass="form-control form-control-user" id="exampleInputPassword" placeholder="Password"/>--%>
<%--                                <form:errors path="password" />--%>
<%--                            </div>--%>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <form:password path="password" cssClass="form-control form-control-user" id="exampleInputPassword" placeholder="Password"/>
<%--                                    <form:errors path="password" cssClass="text-danger"/>--%>
<%--                                    <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">--%>
                                </div>
                                <div class="col-sm-6">
                                    <form:password path="repassword" cssClass="form-control form-control-user" id="exampleInputPassword" placeholder="Repeat Password"/>
<%--                                    <input type="password" id="repassword" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">--%>
                                </div>
                            </div>
                            <div class="form-group text-danger">
<%--&lt;%&ndash;                                <p><c:out value="${alert}" default=""/></p>&ndash;%&gt;--%>
                                <c:out value="${alert}"/>
                            </div>
                            <input type="submit" value="Register Account" class="btn btn-primary btn-user btn-block">
                            <hr>
<%--                            <hr>--%>
                        </form:form>
<%--                        <div class="text-center">--%>
<%--                            <a class="small" href="forgot-password.html">Forgot Password?</a>--%>
<%--                        </div>--%>
                        <div class="text-center">
                            <a class="small" href="/login">Already have an account? Login!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Bootstrap core JavaScript-->
<%--<script src="vendor/jquery/jquery.min.js"></script>--%>
<%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>

<%--<!-- Core plugin JavaScript-->--%>
<%--<script src="vendor/jquery-easing/jquery.easing.min.js"></script>--%>

<%--<!-- Custom scripts for all pages-->--%>
<%--<script src="js/sb-admin-2.min.js"></script>--%>

</body>

</html>

