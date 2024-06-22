<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>


<div class="container-fluid p-4 text-center" style="background-color: #ffcc80;">
    <div class="row align-items-center">
        <div class="col">
            <a href="index.jsp"><i class="fa-solid fa-shop fs-5 text-dark-emphasis"> ClothingStore</i></a>
        </div>
        <div class="col-md-6">
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-dark" type="submit">Search</button>
            </form>
        </div>
        <div class="col">
            <c:if test="${not empty userobj}">
                <a href="login.jsp" class="btn btn-success me-2"><i class="fa-solid fa-user-tie"></i> ${userobj.name}</a>       
                <a data-bs-toggle="modal" data-bs-target="#exampleModalCenter" class="btn btn-primary"><i class="fa-solid fa-right-to-bracket"></i> Logout</a>
            </c:if>
            <c:if test="${empty userobj}">
                <a href="../login.jsp" class="btn btn-success me-2"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                <a href="../register.jsp" class="btn btn-primary"><i class="fa-solid fa-user-pen"></i> Register</a>
            </c:if>

            <!-- Vertically centered modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel"></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h4>Do you want to logout?</h4>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <a href="../logout" class="btn btn-primary">Logout</a>

                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<nav class="navbar navbar-expand-lg">

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto mb-lg-0 fs-6 d-flex justify-contant-start">
            <li class="nav-item mx-1">
                <a class="nav-link px-3" aria-current="page" href="adhome.jsp"><i class="fa-solid fa-house"></i> Home</a>
            </li>

        </ul>

        <form class="d-flex">

            <button class="btn btn-secondary homebtn-custom ms-3 me-2" type="submit"><i class="fa-solid fa-sliders"></i> Settings</button>
            <button class="btn btn-secondary homebtn-custom me-5" type="submit"><i class="fa-solid fa-address-card"></i> Contact Us</button>

        </form>
    </div>
</nav>