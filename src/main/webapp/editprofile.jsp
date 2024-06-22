

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce : Edit Profile</title>
        <jsp:include page="template/css.jsp" />

    </head>
    <body>
        <jsp:include page="template/navbar.jsp" />

        <div class="container">
            <div class="row mt-4">
                <div class="col-4 offset-4">
                    <div class="card">
                        <div class="card-body">

                            <h3 class="text-center text-primary"> Edit your Profile </h3>
                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg }</p>
                                <c:remove var="failedMsg" scope="session"/>

                            </c:if>

                            <c:if test="${not empty successMsg}">
                                <p class="text-center text-success">${successMsg }</p>
                                <c:remove var="successMsg" scope="session"/>

                            </c:if>

                            <form action="update_profile" method="post" id="updateProfileForm">
                                <input type="hidden" value="${userobj.id}" name="id">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" class="form-control" id="user_name" name="user_name" aria-describedby="emailHelp" value="${userobj.name}" required>
                                    <span id="nameError" class="error text-danger"></span>

                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email_id" name="email_id" value="${userobj.email}" required>
                                    <span id="emailError" class="error text-danger"></span>

                                </div>



                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input type="number" class="form-control" id="phone" name="phone" aria-describedby="emailHelp" value="" required>
                                    <span id="phoneError" class="error text-danger"></span>

                                </div>

                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" aria-describedby="emailHelp" value="" placeholder="Enter your current password" required>
                                </div>


                                <div class="d-flex justify-content-center mt-3">
                                    <button class="btn btn-primary" type="submit">Update</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="template/footer.jsp" />
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const form = document.getElementById('updateProfileForm');
                const nameInput = document.getElementById('user_name');
                const emailInput = document.getElementById('email_id');
                const phoneInput = document.getElementById('phone');
                const nameError = document.getElementById('nameError');
                const emailError = document.getElementById('emailError');
                const phoneError = document.getElementById('phoneError');

                form.addEventListener('submit', (event) => {
                    let valid = true;

                    // Clear previous error messages
                    nameError.textContent = '';
                    emailError.textContent = '';
                    phoneError.textContent = '';

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

                    // Phone validation
                    const phoneValue = phoneInput.value;
                    if (!validatePhone(phoneValue)) {
                        phoneError.textContent = 'Phone number must be of 10 digits.';
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

                function validatePhone(phone) {
                    const re = /^\d{10}$/;
                    return re.test(phone);
                }

            });

        </script>
    </body>
</html>
