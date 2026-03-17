<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h4>User Service Requests</h4>

<c:if test="${empty requests}">
    <div class="alert alert-warning">
        No Requests Found
    </div>
</c:if>

<c:if test="${not empty requests}">
    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <th>User Email</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <c:forEach var="req" items="${requests}">
            <tr>
                <td>${req.id}</td>
                <td>${req.userEmail}</td>
                <td>${req.status}</td>
                <td>
                    <c:if test="${req.status == 'Pending'}">
                        <button class="btn btn-success btn-sm"
                                onclick="updateStatus(${req.id}, 'Accepted')">
                            Accept
                        </button>
                        <button class="btn btn-danger btn-sm"
                                onclick="updateStatus(${req.id}, 'Rejected')">
                            Reject
                        </button>
                    </c:if>
                    <c:if test="${req.status != 'Pending'}">
                        <span class="badge bg-info">${req.status}</span>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>

    <!-- Page Bottom: View Profile button -->
		   <div style="margin-top: 20px;">
		    <button class="btn btn-primary"
		            onclick="loadMyProfile()">
		        View My Profile
		    </button>
		</div>
		   
</c:if>