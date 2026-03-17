<!-- Stats Cards -->
<div class="row mt-3">
    <div class="col-md-6 col-xl-3">
        <div class="card bg-primary text-white shadow-sm">
            <div class="card-body d-flex justify-content-between align-items-center">
                <div>
                    <h6 class="text-uppercase fw-bold">Total Users</h6>
                    <h3>${totalUsers}</h3>
                </div>
                <i class="mdi mdi-account-multiple-outline fs-30"></i>
            </div>
        </div>
    </div>

    <div class="col-md-6 col-xl-3">
        <div class="card bg-success text-white shadow-sm">
            <div class="card-body d-flex justify-content-between align-items-center">
                <div>
                    <h6 class="text-uppercase fw-bold">Service Providers</h6>
                    <h3>${totalProviders}</h3>
                </div>
                <i class="mdi mdi-briefcase-account-outline fs-30"></i>
            </div>
        </div>
    </div>

    <div class="col-md-6 col-xl-3">
        <div class="card bg-warning text-dark shadow-sm">
            <div class="card-body d-flex justify-content-between align-items-center">
                <div>
                    <h6 class="text-uppercase fw-bold">Pending Requests</h6>
                    <h3>${pendingRequests}</h3>
                </div>
                <i class="mdi mdi-timer-sand fs-30"></i>
            </div>
        </div>
    </div>

    <div class="col-md-6 col-xl-3">
        <div class="card bg-danger text-white shadow-sm">
            <div class="card-body d-flex justify-content-between align-items-center">
                <div>
                    <h6 class="text-uppercase fw-bold">Completed Requests</h6>
                    <h3>${completedRequests}</h3>
                </div>
                <i class="mdi mdi-check-circle-outline fs-30"></i>
            </div>
        </div>
    </div>
</div>

<!-- Recent Requests Table -->
<div class="row mt-4">
    <div class="col-12">
        <div class="card shadow-sm">
            <div class="card-header bg-light">
                <h5 class="mb-0">Recent Service Requests</h5>
            </div>
            <div class="card-body table-responsive">
                <table class="table table-striped table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th>User Name</th>
                            <th>Service</th>
                            <th>Provider</th>
                            <th>Status</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="req" items="${recentRequests}" varStatus="st">
                            <tr>
                                <td>${st.index + 1}</td>
                                <td>${req.userName}</td>
                                <td>${req.service}</td>
                                <td>${req.providerName}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${req.status eq 'Pending'}">
                                            <span class="badge bg-warning">Pending</span>
                                        </c:when>
                                        <c:when test="${req.status eq 'Completed'}">
                                            <span class="badge bg-success">Completed</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger">${req.status}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${req.request_date}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>