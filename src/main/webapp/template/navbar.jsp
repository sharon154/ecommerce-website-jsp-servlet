<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>


<div class="container-fluid p-4 text-center" style="background-color: #ffcc80;">
    <div class="row align-items-center">
        <div class="col">
            <a href="index.jsp"><i class="fa-solid fa-shop fs-5 text-dark-emphasis"> ClothingStore</i></a>
        </div>
        <div class="col-6">
            <form class="d-flex" role="search" action="search.jsp" method="post">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
                <button class="btn btn-outline-dark" type="submit">Search</button>
            </form>
        </div>
        <c:if test="${not empty userobj}">
        <div class="col d-flex justify-content-center">
            <a href="cart.jsp"><i class="fa-solid fa-cart-shopping fa-2x me-3 text-black text-center"></i></a>
            <a href="login.jsp" class="btn btn-success me-2"><i class="fa-solid fa-user"></i> ${userobj.name}</a>
            <a href="logout" class="btn btn-primary"><i class="fa-solid fa-right-to-bracket"></i> Logout</a>
        </div>
        </c:if>
        
        <c:if test="${empty userobj}">
        <div class="col">
            <a href="login.jsp" class="btn btn-success me-2"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
            <a href="register.jsp" class="btn btn-primary"><i class="fa-solid fa-user-pen"></i> Register</a>
        </div>
        </c:if>
    </div>
</div>

<nav class="navbar navbar-expand-lg">

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto mb-lg-0 fs-6 d-flex justify-content-start">
            <li class="nav-item mx-1">
                <a class="nav-link px-3" aria-current="page" href="index.jsp"><i class="fa-solid fa-house"></i> Home</a>
            </li>
            <li class="nav-item mx-1">
                <a class="nav-link px-3" href="all_menclothing.jsp"><i class="fa-solid fa-person"></i> Men's Clothing</a>
            </li>
            <li class="nav-item mx-1">
                <a class="nav-link px-3" href="all_womenclothing.jsp"><i class="fa-solid fa-person-dress"></i> Women's Clothing</a>
            </li>
            <li class="nav-item mx-1">
                <a class="nav-link px-3" href="all_kidclothing.jsp"><i class="fa-solid fa-child-reaching"></i> Kid's Section</a>
            </li>
        </ul>

        <form class="d-flex">

            <a href="settings.jsp" class="btn btn-secondary homebtn-custom ms-3 me-2" type="submit"><i class="fa-solid fa-sliders"></i> Settings</a>
            <a href="helpcentre.jsp" class="btn btn-secondary homebtn-custom me-5" type="submit"><i class="fa-solid fa-address-card"></i> Contact Us</a>

        </form>
    </div>
</nav>