
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce : Login</title>
        <jsp:include page="template/css.jsp" />

    </head>
    <body>
        <jsp:include page="template/navbar.jsp" />
        <div class="container-fluid d-flex justify-content-center align-items-center bgimage">
            <div class="bg-white rounded-pill w-50 shadow-lg login-box">

                <!-- Image column now takes full width -->
                <div class="col-12 d-flex justify-content-center mb-1 img-box">
                    <img src="img/login1.jpg" class="img-fluid" alt="LOGO">
                </div>
                <!-- Content column also takes full width and comes below the image -->
                <div class="col px-3 pb-3">

                    <h2 class="mt-2 text-center">Sign In</h2>
                    <c:if test="${not empty failedMsg}">
                        <p class="text-center text-danger">${failedMsg }</p>
                        <c:remove var="failedMsg" scope="session"/>

                    </c:if>

                    <c:if test="${not empty successMsg}">
                        <p class="text-center text-success">${successMsg }</p>
                        <c:remove var="successMsg" scope="session"/>

                    </c:if>
                    <form method="post" action="login">

                        <div class="mt-1 px-5 d-flex mb-2">
                            <label for="exampleInputEmail1" class="form-label d-flex align-items-center justify-content-center"><i class="fa-solid fa-envelope me-2"></i></label>
                            <input type="email" class="form-control login-control" id="exampleInputEmail1" name="email_id" placeholder="Enter your email" required>
                            <span id="emailError" class="error text-danger"></span>

                        </div>

                        <div class="mt-2 px-5 d-flex">
                            <label for="exampleInputPassword1" class="form-label d-flex align-items-center justify-content-center"><i class="fa-solid fa-lock me-2"></i></label>
                            <input type="password" class="form-control login-control" id="exampleInputPassword1" name="password" placeholder="Enter your password" required>                             <span id="passwordError" class="error text-danger"></span>

                        </div>
                        <div class="text-center fs-6">
                            <a href="" class="text-decoration-none">Forgot Email or Password?</a>
                        </div>

                        <div class="d-flex justify-content-center mt-3">
                            <button class="btn btn-primary" type="submit">Login</button>
                        </div>



                        <div class="d-flex justify-content-center align-items-center mt-1 p-3">
                            <span>Don't have an account?</span><a href="register.jsp" class="text-decoration-none">Sign Up</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
