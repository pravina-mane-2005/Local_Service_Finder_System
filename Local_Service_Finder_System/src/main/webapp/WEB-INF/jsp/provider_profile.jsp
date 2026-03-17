<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<style>
.id-card {
    width: 280px;   /* 👈 Size kami kela */
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0,0,0,0.18);
  
}

.id-header {
    background: linear-gradient(135deg, #20c997, #0d6efd);
    color: white;
    padding: 12px;   /* 👈 kami padding */
    text-align: center;
}

.id-header input {
    font-size: 14px;
}

.id-body {
    background: #ffffff;
    padding: 12px;   /* 👈 kami padding */
}

.id-body label {
    font-size: 12px;
    font-weight: 600;
}

.id-body input, 
.id-body select {
    font-size: 12px;
    padding: 3px 6px;
    margin-bottom: 8px;
}

.id-footer {
    background: #20c997;
    color: white;
    text-align: center;
    padding: 6px;   /* 👈 kami padding */
}

.id-footer button {
    font-size: 12px;
    padding: 4px 10px;
}
</style>

<div class="container mt-5 d-flex justify-content-center">

<c:if test="${not empty provider}">
    <form action="updateProviderProfile" method="post">
        <div class="id-card">

            <div class="id-header">
                <h5 class="mb-0">
                    <input type="text" name="name" 
                           value="${provider.name}" 
                           class="form-control text-center border-0 bg-transparent text-white fw-bold" required>
                </h5>
                <input type="text" name="serviceType" 
                       value="${provider.serviceType}" 
                       class="form-control text-center border-0 bg-transparent text-white">
            </div>

            <div class="id-body">

                <label>Email:</label>
                <input type="email" name="email" value="${provider.email}" class="form-control" required>

                <label>Phone:</label>
                <input type="text" name="phone" value="${provider.phone}" class="form-control" required>

                <label>City:</label>
                <input type="text" name="city" value="${provider.city}" class="form-control">
                
                <label>ServiceType:</label>
                <input type="text" name="serviceType" value="${provider.serviceType}" class="form-control" required>
                

                <label>Experience (Years):</label>
                <input type="number" name="experience" value="${provider.experience}" min="0" class="form-control">

                <label>Status:</label>
                <select name="status" class="form-select">
                    <option value="1" ${provider.status == 1 ? 'selected' : ''}>Active</option>
                    <option value="0" ${provider.status == 0 ? 'selected' : ''}>Inactive</option>
                </select>

            </div>

            <div class="id-footer">
                <button type="submit" class="btn btn-light btn-sm">
                    Save Changes
                </button>
			      <a href="${pageContext.request.contextPath}/"
			   class="btn btn-danger btn-sm">
			    Logout
			</a>
            </div>

        </div>
    </form>
</c:if>

<c:if test="${empty provider}">
    <div class="alert alert-warning text-center">
        Profile not found!
    </div>
</c:if>

</div>