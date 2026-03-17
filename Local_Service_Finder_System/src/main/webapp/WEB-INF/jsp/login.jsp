<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Smart Local Service Finder System - Admin Panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/css/icons.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/css/app.min.css'/>">

    <style>
        /* REMOVE SCROLL */
        html, body {
            height: 100%;
            margin: 0;
            overflow: hidden;  
        }

        body {
            background: #f4f6fb;
        }

        /* TOP TITLE */
        .page-title {
            height: 90px;
            background: #ffffff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        /* MAIN AREA */
        .main-area {
            height: calc(100vh - 90px);
        }

        
        .login-card {
            background: #ffffff;
            padding: 45px;
            border-radius: 18px;
            width: 460px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.12);
        }

        .form-control {
            padding: 12px 15px;
            font-size: 16px;
        }

        .btn-primary {
            padding: 12px;
            font-size: 17px;
        }
    </style>
</head>

<body>

<!-- ===== TITLE (ALWAYS VISIBLE) ===== -->
<div class="page-title">
    <h2 class="fw-bold mb-1">Smart Local Service Finder System</h2>
    <p class="text-muted mb-0">Admin & Service Management Portal</p>
</div>

<!-- ===== MAIN CONTENT ===== -->
<div class="container-fluid main-area">
    <div class="row h-100">

        <!-- LEFT : LOGIN -->
        <div class="col-xl-5 d-flex align-items-center justify-content-center">
            <div class="login-card">

                <div class="text-center mb-4">
                    <img src="<c:url value='/assets/images/logo-sm.png'/>" height="40">
                </div>

                <h3 class="text-center mb-2">Admin Sign In</h3>
                <p class="text-muted text-center mb-4">
                    Login to manage users & services
                </p>

                <form action="<c:url value='/login'/>" method="post">

                    <div class="mb-4">
                        <label class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" placeholder="Enter username" required>
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">
                        Sign In
                    </button>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger mt-3 text-center">
                            ${error}
                        </div>
                    </c:if>

                </form>
            </div>
        </div>

        <!-- RIGHT : BIG IMAGE -->
        <div class="col-xl-7 d-none d-md-flex align-items-center justify-content-center bg-light">
            <img src="/Project/assets/images/adminpic.jpg"
                 class="img-fluid rounded-4 shadow-lg"
                 style="max-width: 800px; max-height: 85%;">
        </div>

    </div>
</div>

<!-- JS -->
<script src="<c:url value='/assets/libs/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/assets/js/app.js'/>"></script>

</body>
</html>
