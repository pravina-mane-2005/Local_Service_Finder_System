<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container mt-4">

    <div class="card shadow-lg border-0">
        <div class="card-body">

            <h4 class="mb-4 text-center">Available Service Providers</h4>

            <!-- If No Providers -->
            <c:if test="${empty providers}">
                <div class="alert alert-warning text-center">
                    No service providers found for selected service and area.
                </div>
            </c:if>

            <!-- If Providers Available -->
            <c:if test="${not empty providers}">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped text-center align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Service Type</th>
                                <th>City</th>
                                <th>Experience</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="sp" items="${providers}">
                                <tr>
                                    <td>${sp.name}</td>
                                    <td>${sp.email}</td>
                                    <td>${sp.phone}</td>
                                    <td>${sp.serviceType}</td>
                                    <td>${sp.city}</td>
                                    <td>${sp.experience} years</td>
                                    <td>
                                        <button class="btn btn-success btn-sm"
                                                onclick="sendRequest(${sp.providerId})">
                                            Send Request
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <!-- Logout Button Section -->
            <div class="d-flex justify-content-end mt-4">
                <a href="${pageContext.request.contextPath}/logout"
                   class="btn btn-danger px-4">
                    Logout
                </a>
            </div>

        </div>
    </div>

</div>
