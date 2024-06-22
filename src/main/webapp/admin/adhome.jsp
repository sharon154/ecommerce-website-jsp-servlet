<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin : Home</title>
        <jsp:include page="adcss.jsp" />
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
    <body style="background-color: #f8f8ff">
        <jsp:include page="adnavbar.jsp" />

    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp">
        </c:redirect>
    </c:if>

    <div class="container">
        <div class="row p-5">
            <div class="col-md-6">
                <a href="add_product.jsp">
                    <div class="card">
                        <div class="card-body crd-ho text-center">
                            <i class="fa-solid fa-plus fa-3x text-primary"></i>
                            <h4>Add Product</h4>
                        </div>
                    </div>
                </a>
            </div>


            <div class="col-md-6">
                <a href="viewall_product.jsp">

                    <div class="card">
                        <div class="card-body crd-ho text-center">
                            <i class="fa-solid fa-expand fa-3x text-success"></i>
                            <h4>View All Products</h4>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="row px-5 mt-1">

            <div class="col-md-4">
                <a href="viewall_user.jsp">

                    <div class="card">
                        <div class="card-body crd-ho text-center">
                            <i class="fa-solid fa-users-viewfinder fa-3x text-success"></i>
                            <h4>View All Users</h4>
                        </div>
                    </div>
                </a>
            </div>


            <div class="col-md-4">
                <a href="viewall_order.jsp">

                    <div class="card">
                        <div class="card-body crd-ho text-center">
                            <i class="fa-solid fa-bag-shopping fa-3x text-warning"></i>
                            <h4>View All Orders</h4>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
                    <div class="card">
                        <div class="card-body crd-ho text-center">
                            <i class="fa-solid fa-right-from-bracket fa-3x text-danger"></i>
                            <h4>Logout</h4>
                        </div>
                    </div>
                </a>
            </div>
        </div>

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
</body>
</html>
