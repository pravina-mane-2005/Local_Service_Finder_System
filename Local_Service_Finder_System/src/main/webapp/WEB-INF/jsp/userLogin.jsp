<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Login | Admin Panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

    <!-- App favicon -->
    <link rel="shortcut icon" href="/Project/assets/images/logo-sm.png">

    <!-- CSS -->
    <link rel="stylesheet" href="/Project/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Project/assets/css/icons.min.css">
    <link rel="stylesheet" href="/Project/assets/css/app.min.css">

    <style>
        .login-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        }
        .hero-section {
            background: #f8f9fa;
        }
        .login-btn {
            background: #0d6efd;
            color: #fff;
        }
    </style>
</head>
<body>

<div class="position-relative min-vh-100">
    <div class="row gx-0">

        <!-- LEFT: Hero Section / Image -->
        <div class="col-xl-7 d-none d-md-block hero-section">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="text-center px-4">
                    <h1 class="display-5 fw-normal mb-3">
                        Smart Local Service Finder System
                    </h1>
                    <p class="fs-14 mb-4">
                        Login securely and access trusted local services.
                    </p>
                    <img src="/Project/assets/images/userLogin.jpg"
                         class="img-fluid rounded-3 shadow"
                         style="max-width: 850px;">
                </div>
            </div>
        </div>

        <!-- RIGHT: Login Form -->
        <div class="col-xl-5">
            <div class="row justify-content-center align-items-center p-10 min-vh-100 bg-body-secondary">
                <div class="col-md-8 login-card">

                    <a href="/Project/index" class="d-block text-center mb-4">
                        <img src="/Project/assets/images/logo-sm.png" height="40">
                    </a>

                    <h3 class="mb-3">User Login</h3>
                    <p class="text-muted mb-4">Login to continue using our services.</p>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>

                   <form action="<c:url value='/userLogin'/>" method="post">


                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control"
                                   placeholder="Enter your email" required>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control"
                                   placeholder="Enter password" required>
                        </div>

                        <button type="submit" class="btn login-btn w-100 mb-3">
                            Login
                        </button>

                        <div class="text-center">
                            <p class="mb-0">
                                Don’t have an account?
                                <a href="/Project/uregister" class="text-primary fw-semibold">
                                    Register here
                                </a>
                            </p>
                        </div>

                    </form>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- JS -->
<script src="/Project/assets/js/bootstrap.bundle.min.js"></script>
<script src="/Project/assets/libs/jquery/jquery.min.js"></script>
<script src="/Project/assets/js/app.js"></script>

</body>
</html>
