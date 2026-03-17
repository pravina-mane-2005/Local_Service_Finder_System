<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Local Service Finder</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta content="Admin & Dashboard Template" name="description">
    <meta content="Codebucks" name="author">

    <link rel="shortcut icon" href="<c:url value='/assets/images/logo-sm.png'/>">

    <!-- CSS Libraries -->
    <link href="<c:url value='/assets/libs/select2/css/select2.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/libs/simplebar/simplebar.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/css/bootstrap.min.css'/>" id="bootstrap-style" rel="stylesheet">
    <link href="<c:url value='/assets/css/icons.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/css/app.min.css'/>" id="app-style" rel="stylesheet">


</head>

<body>
<div id="layout-wrapper">

    <!-- TOPBAR -->
    <header id="page-topbar">
        <div class="navbar-header">
            <div class="navbar-logo-box">
                <a href="<c:url value='/'/>" class="logo logo-dark">
                    <span class="logo-sm">
                        <img src="<c:url value='/assets/images/logo-sm.png'/>" alt="logo-sm-dark" height="22">
                    </span>
                    <span class="logo-lg">
                        <img src="<c:url value='/assets/images/logo-dark.png'/>" alt="logo-dark" height="20">
                    </span>
                </a>

                <a href="<c:url value='/'/>" class="logo logo-light">
                    <span class="logo-sm">
                        <img src="<c:url value='/assets/images/logo-sm.png'/>" alt="logo-sm-light" height="22">
                    </span>
                    <span class="logo-lg">
                        <img src="<c:url value='/assets/images/logo-light.png'/>" alt="logo-light" height="20">
                    </span>
                </a>

                <button type="button" class="btn btn-icon top-icon sidebar-btn" id="sidebar-btn">
                    <i class="mdi mdi-menu-open align-middle fs-17"></i>
                </button>
            </div>

            <div class="d-flex justify-content-between menu-sm px-4 ms-auto">
                <div class="d-flex align-items-center gap-3">
                    <form class="app-search d-none d-lg-block me-2">
                        <div class="position-relative">
                            <input type="text" class="form-control" placeholder="Search...">
                            <i data-eva="search-outline" class="align-middle"></i>
                        </div>
                    </form>

                    <div class="dropdown d-inline-block">
                        <button type="button" class="btn btn-icon top-icon dropdown-toggle" data-bs-toggle="dropdown" onclick="loadNotifications()">
                            <i class="mdi mdi-bell-ring-outline fs-17"></i>
                        </button>
                        <div id="myNotificationMenu" class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0">
                            <div class="p-4 border-bottom">
                                <h6 class="m-0">Notifications</h6>
                            </div>
                            <div id="notificationContent" style="max-height:230px; overflow:auto;">
                                <div class="p-3 text-center text-muted">Loading...</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </header>

    <!-- SIDEBAR -->
    <div class="sidebar-left">
        <div class="sidebar-slide h-100" data-simplebar>
            <div id="sidebar-menu">
                <ul class="left-menu list-unstyled" id="side-menu">
                    <li>
                        <a href="javascript:void(0);" class="has-arrow">
                            <i data-eva="compass-outline"></i>
                            <span>Dashboard</span>
                        </a>
                        <ul class="sub-menu">
                            <li><a href="#" onclick="loadUsers()">Users</a></li>
                            <li><a href="javascript:void(0);" onclick="loadProviderRequests()">Service Provider</a></li>
                            <li><a href="<c:url value='/admin_dashboard_fragment'/>">Admin</a></li>
                        </ul>
                    </li>
                    <li class="menu-title">Categories</li>
                    <li>
                        <a href="javascript:void(0);" class="has-arrow">
                            <i data-eva="heart-outline"></i>
                            <span>Gallery</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

   <!-- MAIN CONTENT -->
<!-- ============================================================== -->
    <div class="main-content">

        <div class="page-content">
            <div class="container-fluid">
            <div id="contentArea">


                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-xxl-5">
                                <div class="card overflow-hidden card-h-100">
                                    <div class="card-body d-flex flex-column h-100 justify-content-between">
                                        <div>
                                            <h4 class="fw-medium mb-4">Welcome Back, Charlie!</h4>
                                            <p class="mb-6 text-muted fs-14 lh-base max-w-96">Here’s a quick look at your store’s performance today.Stay on top of your sales, orders, and customers.</p>
                                        </div>
                                        <div>
                                            <h3 class="fw-normal mb-2">$25,56k</h3>
                                            <p class="text-muted fs-14 mb-6">Monthly Sales <span class="text-success me-1"><i data-eva="trending-up" class="size-4 me-1"></i>5.2%</span></p>
                                            <a href="#!" class="btn btn-primary">View Reports</a>
                                        </div>
                                        <img src="assets/images/dashboard/ecommerce/welcome.png" alt="Welcome" class="img-fluid position-absolute z-2 welcome-vector">
                                        <div class="position-absolute h-44 w-44 bg-primary me-16 bottom-0 end-0 rounded-circle blury-effect"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xxl-7">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title">Sales Summary</h5>
                                        <div class="dropdown">
                                            <a href="#!" class="text-muted dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" aria-label="more">Monthly</a>
                                            <ul class="dropdown-menu dropdown-menu-animated dropdown-menu-end">
                                                <li><a class="dropdown-item" href="#!">Weekly</a></li>
                                                <li><a class="dropdown-item" href="#!">Monthly</a></li>
                                                <li><a class="dropdown-item" href="#!">Yearly</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div id="salesSummaryChart" data-colors='["var(--bs-primary)"]' class="apex-charts" dir="ltr"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-xxl-3">
                                <div class="card shadow-sm border-0">
                                    <div class="card-body">
                                        <div class="d-flex align-items-start justify-content-between mb-6">
                                            <div>
                                                <h6 class="mb-3">Total Sales</h6>
                                                <p class="text-muted mb-0"><span class="text-success me-1"><i data-eva="trending-up" class="size-4 me-1"></i>8.5%</span> vs last week</p>
                                            </div>
                                            <div class="position-relative d-inline-block avatar-progress progress-75">
                                                <svg class="position-absolute top-0 start-0 progress-svg">
                                                    <circle class="progress-bg"></circle>
                                                    <circle class="progress-circle stroke-info"></circle>
                                                </svg>
                                                <div class="avatar size-11 avatar-label-info avatar-circle">
                                                    <i data-eva="shopping-bag-outline"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h4 class="mb-0 fw-medium"><span data-counter="35780" data-prefix="$"></span> <span class="small fw-normal text-muted">/weekly</span></h4>
                                            <div class="dropdown">
                                                <a href="#!" class="text-muted" data-bs-toggle="dropdown" aria-label="more"><i data-eva="more-horizontal-outline" class="size-4"></i></a>
                                                <ul class="dropdown-menu dropdown-menu-animated dropdown-menu-end">
                                                    <li><a class="dropdown-item" href="#!">Today</a></li>
                                                    <li><a class="dropdown-item" href="#!">This Week</a></li>
                                                    <li><a class="dropdown-item" href="#!">This Month</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-xxl-3">
                                <div class="card shadow-sm border-0">
                                    <div class="card-body">
                                        <div class="d-flex align-items-start justify-content-between mb-6">
                                            <div>
                                                <h6 class="mb-3">Revenue</h6>
                                                <p class="text-muted mb-0"><span class="text-success me-1"><i data-eva="trending-up" class="size-4 me-1"></i>5.7%</span> vs last week</p>
                                            </div>
                                            <div class="position-relative d-inline-block avatar-progress progress-80">
                                                <svg class="position-absolute top-0 start-0 progress-svg">
                                                    <circle class="progress-bg"></circle>
                                                    <circle class="progress-circle stroke-success"></circle>
                                                </svg>
                                                <div class="avatar size-11 avatar-label-success avatar-circle">
                                                    <i data-eva="credit-card-outline"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h4 class="mb-0 fw-medium"><span data-counter="2458" data-prefix="$"></span> <span class="small fw-normal text-muted">/weekly</span></h4>
                                            <div class="dropdown">
                                                <a href="#!" class="text-muted" data-bs-toggle="dropdown" aria-label="more"><i data-eva="more-horizontal-outline" class="size-4"></i></a>
                                                <ul class="dropdown-menu dropdown-menu-animated dropdown-menu-end">
                                                    <li><a class="dropdown-item" href="#!">Today</a></li>
                                                    <li><a class="dropdown-item" href="#!">This Week</a></li>
                                                    <li><a class="dropdown-item" href="#!">This Month</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-xxl-3">
                                <div class="card shadow-sm border-0">
                                    <div class="card-body">
                                        <div class="d-flex align-items-start justify-content-between mb-6">
                                            <div>
                                                <h6 class="mb-3">Total Orders</h6>
                                                <p class="text-muted mb-0"><span class="text-danger me-1"><i data-eva="trending-down" class="size-4 me-1"></i>2.1%</span> vs last week</p>
                                            </div>
                                            <div class="position-relative d-inline-block avatar-progress progress-60">
                                                <svg class="position-absolute top-0 start-0 progress-svg">
                                                    <circle class="progress-bg"></circle>
                                                    <circle class="progress-circle stroke-warning"></circle>
                                                </svg>
                                                <div class="avatar size-11 avatar-label-warning avatar-circle">
                                                    <i data-eva="shopping-cart-outline"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h4 class="mb-0 fw-medium"><span data-counter="1245"></span> <span class="small fw-normal text-muted">/weekly</span></h4>
                                            <div class="dropdown">
                                                <a href="#!" class="text-muted" data-bs-toggle="dropdown" aria-label="more"><i data-eva="more-horizontal-outline" class="size-4"></i></a>
                                                <ul class="dropdown-menu dropdown-menu-animated dropdown-menu-end">
                                                    <li><a class="dropdown-item" href="#!">Today</a></li>
                                                    <li><a class="dropdown-item" href="#!">This Week</a></li>
                                                    <li><a class="dropdown-item" href="#!">This Month</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-xxl-3">
                                <div class="card shadow-sm border-0">
                                    <div class="card-body">
                                        <div class="d-flex align-items-start justify-content-between mb-6">
                                            <div>
                                                <h6 class="mb-3">New Customers</h6>
                                                <p class="text-muted mb-0"><span class="text-success me-1"><i data-eva="trending-up" class="size-4 me-1"></i>12%</span> vs last week</p>
                                            </div>
                                            <div class="position-relative d-inline-block avatar-progress progress-66">
                                                <svg class="position-absolute top-0 start-0 progress-svg">
                                                    <circle class="progress-bg"></circle>
                                                    <circle class="progress-circle stroke-danger"></circle>
                                                </svg>
                                                <div class="avatar size-11 avatar-label-danger avatar-circle">
                                                    <i data-eva="people-outline"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h4 class="mb-0 fw-medium"><span data-counter="320"></span> <span class="small fw-normal text-muted">/weekly</span></h4>
                                            <div class="dropdown">
                                                <a href="#!" class="text-muted" data-bs-toggle="dropdown" aria-label="more"><i data-eva="more-horizontal-outline" class="size-4"></i></a>
                                                <ul class="dropdown-menu dropdown-menu-animated dropdown-menu-end">
                                                    <li><a class="dropdown-item" href="#!">Today</a></li>
                                                    <li><a class="dropdown-item" href="#!">This Week</a></li>
                                                    <li><a class="dropdown-item" href="#!">This Month</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
      
                <div class="row">
                 <div class="col-xxl-12">
    <div class="card">
        <div class="card-header">
            <h5 class="card-title mb-0">Local Service Finder - System Overview</h5>
        </div>

        <div class="card-body">
            <div class="table-responsive text-nowrap">
                <table class="table align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>Category</th>
                            <th>Total Count</th>
                            <th>Status</th>
                            <th>Last Updated</th>
                            <th class="text-end">Details</th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td>Total Services Available</td>
                            <td>25</td>
                            <td><span class="badge bg-success">Active</span></td>
                            <td>23 Feb 2026</td>
                            <td class="text-end">
                                <button class="btn btn-sm btn-primary">View</button>
                            </td>
                        </tr>

                        <tr>
                            <td>Registered Service Providers</td>
                            <td>120</td>
                            <td><span class="badge bg-success">Verified</span></td>
                            <td>22 Feb 2026</td>
                            <td class="text-end">
                                <button class="btn btn-sm btn-info">Manage</button>
                            </td>
                        </tr>

                        <tr>
                            <td>Registered Users</td>
                            <td>350</td>
                            <td><span class="badge bg-primary">Growing</span></td>
                            <td>21 Feb 2026</td>
                            <td class="text-end">
                                <button class="btn btn-sm btn-secondary">View</button>
                            </td>
                        </tr>

                        <tr>
                            <td>Total Service Requests</td>
                            <td>540</td>
                            <td><span class="badge bg-warning">Pending 12</span></td>
                            <td>23 Feb 2026</td>
                            <td class="text-end">
                                <button class="btn btn-sm btn-success">Track</button>
                            </td>
                        </tr>

                        <tr>
                            <td>Completed Services</td>
                            <td>498</td>
                            <td><span class="badge bg-success">Completed</span></td>
                            <td>23 Feb 2026</td>
                            <td class="text-end">
                                <button class="btn btn-sm btn-dark">Report</button>
                            </td>
                        </tr>

                        <tr>
                            <td>Top Requested Service</td>
                            <td>Home Cleaning</td>
                            <td><span class="badge bg-info">52 Requests</span></td>
                            <td>20 Feb 2026</td>
                            <td class="text-end">
                                <button class="btn btn-sm btn-warning">Details</button>
                            </td>
                        </tr>

                        <tr>
                            <td>Active Locations</td>
                            <td>Pune (120)</td>
                            <td><span class="badge bg-success">High Demand</span></td>
                            <td>23 Feb 2026</td>
                            <td class="text-end">
                                <button class="btn btn-sm btn-primary">Explore</button>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
                            </div>
                        </div>
                    </div>
                    
             </div>
            </div><!-- container-fluid -->
        </div><!-- End Page-content -->

        <!-- Begin Footer -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <script>document.write(new Date().getFullYear())</script> © Aquiry.
                    </div>
                    <div class="col-sm-6">
                        <div class="text-sm-end d-none d-sm-block">
                            Crafted with <i class="mdi mdi-heart text-danger"></i> by <a href="http://codebucks.in/" target="_blank" class="text-muted">Codebucks</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- END Footer -->
        <!-- Begin scroll top -->
          <div class="progress-wrap" id="progress-scroll">
            <svg class="progress-circle" width="100%" height="100%" viewBox="-1 -1 102 102">
              <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98" />
            </svg>
          </div>
        <!-- END scroll top -->
    </div><!-- end main content-->

    <!-- FOOTER -->
   <!--  <footer class="footer">
        <div class="container-fluid">
            <script>document.write(new Date().getFullYear())</script> © Aquiry.
        </div>
    </footer> -->

</div>

<!-- JS -->
<script src="<c:url value='/assets/libs/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/assets/libs/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/assets/libs/metismenu/metisMenu.min.js'/>"></script>
<script src="<c:url value='/assets/libs/simplebar/simplebar.min.js'/>"></script>
<script src="<c:url value='/assets/libs/eva-icons/eva.min.js'/>"></script>
<script src="<c:url value='/assets/js/scroll-top.init.js'/>"></script>
<script src="<c:url value='/assets/libs/select2/js/select2.min.js'/>"></script>
<script src="<c:url value='/assets/libs/apexcharts/apexcharts.min.js'/>"></script>
<script src="<c:url value='/assets/js/progress-bar.js'/>"></script>
<script src="<c:url value='/assets/js/dashboard/index.init.js'/>"></script>
<script src="<c:url value='/assets/js/app.js'/>"></script>

<script>



function loadUsers() {
    fetch('${pageContext.request.contextPath}/usersFirst')
        .then(response => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.text();
        })
        .then(data => {
            document.getElementById("contentArea").innerHTML = data;
        })
        .catch(error => {
            console.error("Error loading page:", error);
        });
}
</script>
<script>
function loadServices() {

    const service = document.querySelector("[name='service']").value;
    const area = document.querySelector("[name='area']").value;

    fetch('${pageContext.request.contextPath}/findServices', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'service=' + service + '&area=' + area
    })
    .then(response => response.text())
    .then(data => {
        document.getElementById("contentArea").innerHTML = data;
    });
}
</script>
<script>
function sendRequest(providerId) {

    if (!confirm("Are you sure you want to send this request?")) {
        return;
    }

    const userId = "${sessionScope.loggedInUserId}";
    const userEmail = "${sessionScope.loggedInUserEmail}";

    alert("Provider: " + providerId +
          "\nUserId: " + userId +
          "\nEmail: " + userEmail);

    fetch('${pageContext.request.contextPath}/sendRequest', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'providerId=' + providerId +
              '&userId=' + userId +
              '&userEmail=' + userEmail
    })
    .then(response => response.text())
    .then(data => alert(data))
    .catch(err => console.error(err));
}


</script>
<script>
function loadProviderRequests() {

    fetch('${pageContext.request.contextPath}/provider_dashboard')
        .then(response => response.text())
        .then(data => {
            document.getElementById("contentArea").innerHTML = data;
        })
        .catch(err => console.log(err));
}

</script>
<script>
function updateStatus(requestId, status) {

    if (!confirm("Are you sure?")) {
        return;
    }

    fetch('${pageContext.request.contextPath}/updateRequestStatus', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'requestId=' + requestId + '&status=' + status
    })
    .then(response => {
        if (!response.ok) {
            throw new Error("HTTP error " + response.status);
        }
        return response.text();
    })
    .then(data => {
        
        loadProviderRequests();
    })
    .catch(error => {
        console.error("Error:", error);
    });
}
</script>
<script>
function loadNotifications() {

    

    fetch('${pageContext.request.contextPath}/userNotifications', {
        method: "GET",
        credentials: "same-origin"
    })
    .then(resp => resp.json())
    .then(data => {

        const content = document.querySelector("#notificationContent");
        content.innerHTML = "";

        if (!data || data.length === 0) {
            content.innerHTML =
                '<div class="p-3 text-center text-muted">No notifications</div>';
            return;
        }

        data.forEach(function(req) {

            let badgeClass = "bg-warning";

            if (req.status === "Accepted")
                badgeClass = "bg-success";
            else if (req.status === "Rejected")
                badgeClass = "bg-danger";

            const item =
                '<a href="#" class="dropdown-item d-flex justify-content-between align-items-center">' +
                    '<span>' +
                        'Request ' + req.id + '<br>' +
                        '<small class="text-muted">' + req.providerEmail + '</small>' +
                    '</span>' +
                    '<span class="badge ' + badgeClass + '">' +
                        req.status +
                    '</span>' +
                '</a>';

            content.insertAdjacentHTML("beforeend", item);
        });

    })
    .catch(err => console.error("Notification error:", err));
}
// Optional: auto-refresh every 20 seconds
//setInterval(loadNotifications, 20000);
</script>

<script>
function loadMyProfile() {

    fetch('${pageContext.request.contextPath}/viewProfile')
        .then(response => response.text())
        .then(data => {
            document.getElementById("contentArea").innerHTML = data;
        })
        .catch(err => console.log(err));
}
</script>
<!-- <script>
function loadAdminDashboard() {
    fetch('${pageContext.request.contextPath}/adminDashboard')
        .then(response => {
            if(response.redirected){
                window.location.href = response.url; // session expired / access denied
                return;
            }
            return response.text();
        })
        .then(data => {
            if(data){
                document.getElementById("contentArea").innerHTML = data;
            }
        })
        .catch(err => console.log(err));
}
</script> -->


</body>
</html>
