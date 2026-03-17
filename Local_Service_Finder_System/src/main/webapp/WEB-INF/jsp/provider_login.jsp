<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Provider Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

    <!-- App favicon -->
    <link rel="shortcut icon" href="<c:url value='/assets/images/logo-sm.png' />">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background: #f8f9fa;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            width: 100%;
            max-width: 400px;
        }

        .login-btn {
            background: #0d6efd;
            color: #fff;
        }

        .card-header h4 {
            margin: 0;
            font-weight: 600;
        }
    </style>
</head>
<body>

<div class="login-card">

    <!-- Logo -->
    <a href="<c:url value='/index' />" class="d-block text-center mb-4">
        <img src="<c:url value='/assets/images/logo-sm.png' />" height="40">
    </a>

    <h3 class="mb-3 text-center">Provider Login</h3>
    <p class="text-muted text-center mb-4">Access your provider dashboard securely.</p>

    <!-- Error Message -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger text-center">${error}</div>
    </c:if>

    <!-- Login Form -->
    <form action="<c:url value='/providerLogin' />" method="post">

        <div class="mb-3">
            <input type="email" name="email" class="form-control" placeholder="Email" required>
        </div>

        <div class="mb-4">
            <input type="password" name="password" class="form-control" placeholder="Password" required>
        </div>

        <button type="submit" class="btn login-btn w-100 mb-3">Login</button>
    </form>

    <!-- Link to Register -->
    <p class="text-center mt-3">
        New here? 
        <a href="<c:url value='/provider_register' />">Register Now</a>
    </p>
</div>

</body>
</html>
