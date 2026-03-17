<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="d-flex justify-content-center align-items-center" style="min-height: 75vh;">

    <div class="col-xl-6 col-lg-8">

        <div class="card shadow-lg border-0">
            <div class="card-body p-5">

                <!-- Title Section -->
                <div class="mb-4 text-center">
                    <h2 class="fw-bold mb-2" style="font-size: 28px;">
                        Local Service Finder
                    </h2>
                    <p class="text-muted" style="font-size: 16px;">
                        Select service type and your preferred area
                    </p>
                </div>

                <!-- Form -->
               <form onsubmit="event.preventDefault(); loadServices();">

                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <label class="form-label fw-semibold" style="font-size: 16px;">
                                Service Type
                            </label>
                            <select class="form-select form-select-lg" name="service" required>
                                <option value="">Choose Service</option>
                                <option>Plumber</option>
                                <option>Electrician</option>
                                <option>Carpenter</option>
                                <option>Painter</option>
                                <option>AC Repair</option>
                                <option>Cleaning Service</option>
                            </select>
                        </div>

                        <div class="col-md-6 mb-4">
                            <label class="form-label fw-semibold" style="font-size: 16px;">
                                Area
                            </label>
                            <select class="form-select form-select-lg" name="area" required>
                                <option value="">Choose Area</option>
                                <option>Gherdi</option>
                                <option>Sangola</option>
                                <option>Pare</option>
                                <option>Mahud</option>
                                <option>Jawale</option>
                                <option>Akluj</option>
                                <option>Laxmi Nagar</option>
                                <option>Vaki</option>
                                <option>Shivane</option>
                            </select>
                        </div>
                    </div>

                    <!-- Button -->
                    <div class="mt-4 text-center">
                        <button type="submit" class="btn btn-primary btn-lg px-5">
                            <i class="mdi mdi-magnify me-2"></i>
                            Find Services
                        </button>
                    </div>

                </form>

            </div>
        </div>

    </div>

</div>
