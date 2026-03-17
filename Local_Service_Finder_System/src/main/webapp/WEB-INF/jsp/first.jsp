<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Smart Local Service Finder System</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-image: url('<c:url value="/assets/images/first.jpg"/>');
	        background-repeat: no-repeat; 
	        background-size: cover;       
	        background-position: center;   
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        h1 {
            width: 100%;
            text-align: center;
            color: #ffffff;
            margin-bottom: 50px;
            font-size: 3rem;
            text-shadow: 0 0 10px #000;
        }

        .role-card {
            background: rgba(255,255,255,0.9); /* image var text clear दिसण्यासाठी */
            border-radius: 20px;
            padding: 40px 30px;
            text-align: center;
            cursor: pointer;
            transition: transform 0.4s, box-shadow 0.4s;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
        }

        .role-card:hover {
            transform: scale(1.1);
            box-shadow: 0 0 25px #0ff, 0 0 35px #f0f, 0 0 45px #ff0;
        }

        .role-card i {
            font-size: 60px;
            color: #0d6efd;
            margin-bottom: 15px;
            transition: transform 0.5s, color 0.5s, text-shadow 0.5s;
        }

        .role-card:hover i {
            transform: rotate(360deg) scale(1.2);
            color: #ff5722;
            text-shadow: 0 0 10px #ff5722, 0 0 20px #0ff;
        }

        .role-card h3 {
            font-weight: 700;
            color: #333;
            transition: color 0.5s, text-shadow 0.5s;
        }

        .role-card:hover h3 {
            color: #0d6efd;
            text-shadow: 0 0 10px #0ff;
        }
    </style>
</head>

<body>

<div class="container">
    <h1>Smart Local Service Finder System</h1>

    <div class="row g-5 justify-content-center">

        <!-- User -->
        <div class="col-md-3">
            <div class="role-card" onclick="location.href='<c:url value="/userLogin/"/>'">
                <i class="fa-solid fa-user"></i>
                <h3>User</h3>
            </div>
        </div>

        <!-- Service Provider -->
        <div class="col-md-3">
            <div class="role-card" onclick="location.href='<c:url value="/provider_login"/>'">
                <i class="fa-solid fa-briefcase"></i>
                <h3>Service Provider</h3>
            </div>
        </div>

        <!-- Admin -->
        <div class="col-md-3">
            <div class="role-card" onclick="location.href='<c:url value="/login"/>'">
                <i class="fa-solid fa-user-shield"></i>
                <h3>Admin</h3>
            </div>
        </div>

    </div>
</div>

</body>
</html>
