<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Service Provider Register</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            min-height: 100vh;
            background-image: url('<c:url value="/assets/images/servicep.jpg"/>');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .card {
            border-radius: 12px;
        }
    </style>
</head>

<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow">
                <div class="card-header text-center">
                    <h4>Provider Registration</h4>
                </div>

                <div class="card-body">

                    <form action="<c:url value='/providerRegister' />" method="post">
                        <input class="form-control mb-2" name="name" placeholder="Full Name" required>
                        <input class="form-control mb-2" type="email" name="email" placeholder="Email" required>
                        <input class="form-control mb-2" type="password" name="password" placeholder="Password" required>
                        <input class="form-control mb-2" name="serviceType" placeholder="Service Type (Electrician)" required>
                        <input class="form-control mb-2" name="city" placeholder="City" required>
                        <input class="form-control mb-2" name="phone" placeholder="Phone" required>
                        <input class="form-control mb-3" name="experience" placeholder="Experience (Years)">

                        <button class="btn btn-success w-100">Register</button>
                    </form>

                    <p class="text-success text-center mt-2">${msg}</p>

                    <p class="text-center mt-3">
                        Already Registered?
                        <a href="<c:url value='/provider_login' />">Login Here</a>
                    </p>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
