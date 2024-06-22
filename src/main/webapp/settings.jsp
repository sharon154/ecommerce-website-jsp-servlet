
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.entity.User"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce : Settings</title>

        <jsp:include page="template/css.jsp" />

        <style type="text/css">
            a{
                text-decoration: none;
                color:#000000;
            }

            a:hover{
                text-decoration: none;
                color:#000000;
            }
            .crd-ho:hover{
                background-color: #f0f2f2;
            }
        </style>

    </head>
    <body style="background-color: #fff9ea">
        <jsp:include page="template/navbar.jsp" />

        <%
                    User user=(User)session.getAttribute("userobj");
        %>
        <div class="container">
            <h2 class="text-center mt-4 fw-bold">Hello ${userobj.name}! </h2>
            <div class="row px-2 py-4">
                <div class="col-4">
                    <a href="editprofile.jsp">
                        <div class="card crd-ho py-5">
                            <div class="card-body text-center">
                                <div class="text-warning">
                                    <i class="fa-solid fa-user-pen fa-3x"></i>
                                    <h2>Edit Profile</h2>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>


                <div class="col-4">
                    <a href="userorder.jsp">
                        <div class="card crd-ho py-5">
                            <div class="card-body text-center">
                                <div class="text-danger">
                                    <i class="fa-solid fa-box-open fa-3x"></i>
                                    <h2>My Orders</h2>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-4">
                    <a href="helpcentre.jsp">
                        <div class="card crd-ho py-5">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-circle-question fa-3x"></i>
                                    <h2>Help Centre</h2>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <jsp:include page="template/footer.jsp" />

    </body>
</html>
