<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration | Admin Panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

    <!-- App favicon -->
    <link rel="shortcut icon" href="/Project/assets/images/logo-sm.png">

    <!-- CSS libraries -->
    <link rel="stylesheet" href="/Project/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Project/assets/css/icons.min.css">
    <link rel="stylesheet" href="/Project/assets/css/app.min.css">

    <style>
        .register-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        }
        .hero-section {
            background: #f8f9fa;
        }
        .register-btn {
            background: #0d6efd;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="position-relative min-vh-120">
    <div class="row gx-0">

        <!-- LEFT: Registration Form -->
        <div class="col-xl-5">
            <div class="row justify-content-center align-items-center p-10 min-vh-100 bg-body-secondary">
                <div class="col-md-8 register-card">

                    <a href="/Project/index" class="d-block text-center mb-4">
                        <img src="/Project/assets/images/logo-sm.png" height="40">
                    </a>

                    <h3 class="mb-3">Register</h3>
                    <p class="text-muted mb-4">Create your account to access our services easily.</p>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>

                    <form action="<c:url value='/uregister'/>" method="post">

                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="name" class="form-control" placeholder="Enter username" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" placeholder="Enter email" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Mobile</label>
                            <input type="text" name="mobile" class="form-control" placeholder="Enter Mobile" required>
                        </div>

                        <div class="mb-4">
                            <label class="form-label"> Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                        </div>
                          <div class="mb-4">
                            <label class="form-label"> Role</label>
                            <input type="text" name="role" class="form-control" placeholder="Enter Role" required>
                        </div>

                        <button type="submit" class="btn register-btn w-100 mb-3">Register</button>

                    </form>
                </div>
            </div>
        </div>

        <!-- RIGHT: Hero / Image Section -->
        <div class="col-xl-7 d-none d-md-block hero-section">
            <div class="h-100 d-flex align-items-center justify-content-center position-relative">
                <div class="text-center px-4">
                    <h1 class="display-5 fw-normal mb-3">Welcome To Smart Local Service Finder System</h1>
                    <p class="fs-14 mb-4">Create your account to access our services easily and securely.</p>
                    <img src="/Project/assets/images/worker.webp"class="img-fluid rounded-3 shadow mt-2"
						     style="max-width: 490px;">
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
