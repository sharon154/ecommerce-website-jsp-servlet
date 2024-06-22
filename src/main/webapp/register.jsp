

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce : Register</title>
        <jsp:include page="template/css.jsp" />
        <style>

        </style>
    </head>
    <body>
        <jsp:include page="template/navbar.jsp" />
        <div class="container-fluid d-flex justify-content-center align-items-center bgimage">
            <div class="bg-white rounded-pill w-50 shadow-lg login-box">

                <!-- Image column now takes full width -->
                <div class="col-12 d-flex justify-content-center mb-1 img-box">
                    <img src="img/signupimage2.jpg" class="img-fluid" alt="LOGO">
                </div>
                <!-- Content column also takes full width and comes below the image -->
                <div class="col px-3 pb-3">

                    <h2 class="mt-2 text-center">Sign Up</h2>
                    <c:if test="${not empty successMsg}">
                        <p class="text-center text-success">${successMsg }</p>
                        <c:remove var="successMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty failedMsg}">
                        <p class="text-center text-danger">${failedMsg }</p>
                        <c:remove var="failedMsg" scope="session"/>

                    </c:if>
                    <form id="registrationForm" method="post" action="register">
                        <div class="mt-1 px-5 d-flex mb-2">
                            <label for="exampleInputName1" class="form-label d-flex align-items-center justify-content-center"><i class="fa-solid fa-user me-2"></i></label>
                            <input type="text" class="form-control login-control" id="exampleInputName1" name="user_name" placeholder="Enter your name" required>

                        </div>
                        <div class="mt-2 px-5 d-flex mb-2">
                            <label for="exampleInputEmail1" class="form-label d-flex align-items-center justify-content-center"><i class="fa-solid fa-envelope me-2"></i></label>
                            <input type="email" class="form-control login-control" id="exampleInputEmail1" name="email_id" placeholder="Enter your email" required>
                            <span id="emailError" class="error text-danger"></span>

                        </div>

                        <div class="mt-2 px-5 d-flex">
                            <label for="exampleInputPassword1" class="form-label d-flex align-items-center justify-content-center"><i class="fa-solid fa-lock me-2"></i></label>
                            <input type="password" class="form-control login-control" id="exampleInputPassword1" name="password" placeholder="Enter your password" required>                            
                            <span id="passwordError" class="error text-danger"></span>

                        </div>


                        <div class="d-flex justify-content-center mt-3">
                            <button class="btn btn-success" type="submit">Register</button>
                        </div>

                        <div class="d-flex justify-content-center align-items-center mt-1 p-1"  style="font-size: 0.95rem">
                            <span>Already have an account?</span><a href="login.jsp" class="text-decoration-none">Sign In</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const form = document.getElementById('registrationForm');
                const nameInput = document.getElementById('user_name');
                const emailInput = document.getElementById('exampleInputEmail1');
                const passwordInput = document.getElementById('exampleInputPassword1');
                const nameError = document.getElementById('nameError');
                const emailError = document.getElementById('emailError');
                const passwordError = document.getElementById('passwordError');

                form.addEventListener('submit', (event) => {
                    let valid = true;

                    // Clear previous error messages
                    nameError.textContent = '';
                    emailError.textContent = '';
                    passwordError.textContent = '';

                    // Name validation
                    const nameValue = nameInput.value;
                    if (!validateName(nameValue)) {
                        nameError.textContent = 'Name should contain only alphabets.';
                        valid = false;
                    }

                    // Email validation
                    const emailValue = emailInput.value;
                    if (!validateEmail(emailValue)) {
                        emailError.textContent = 'Please enter a valid email address.';
                        valid = false;
                    }

                    // Password validation
                    const passwordValue = passwordInput.value;
                    if (!validatePassword(passwordValue)) {
                        passwordError.textContent = 'Password must be 8 to 16 characters long, include at least one uppercase letter, one special character, and one number.';
                        valid = false;
                    }

                    if (!valid) {
                        event.preventDefault();
                    }
                });
                
                function validateName(name) {
                    const re = /^[A-Za-z]+$/;
                    return re.test(name);
                }

                function validateEmail(email) {
                    // Basic email pattern
                    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    return re.test(String(email).toLowerCase());
                }

                function validatePassword(password) {
                    // Password pattern: 6 to 8 characters, at least one uppercase letter, one special character, and one number
                    const re = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;
                    return re.test(password);
                }
            });

        </script>
    </body>
</html>
