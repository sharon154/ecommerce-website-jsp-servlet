<%@page import="com.dao.ProductDaoImpl"%>
<%@page import="com.entity.ProductDetails"%>
<%@page import="com.db.DBConnection"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.UserDaoImpl"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce : Product Detail</title>
        <jsp:include page="template/css.jsp" />
        <style type="text/css">
            .detail-box:hover {
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <jsp:include page="template/navbar.jsp" />

        <c:if test="${not empty successMsg}">
            <p class="text-center text-success fw-bold">${successMsg }</p>
            <c:remove var="successMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty failedMsg}">
            <p class="text-center text-danger fw-bold">${failedMsg }</p>
            <c:remove var="failedMsg" scope="session"/>

        </c:if>


        <%
        User user=(User)session.getAttribute("userobj");
        %>

        <%
                            int product_id = Integer.parseInt(request.getParameter("product_id"));
                            ProductDaoImpl dao=new ProductDaoImpl(DBConnection.getConnection());
                            ProductDetails p=dao.getProductById(product_id);
                            
                            
        %>
        <div class="container">
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body crd-ho d-flex justify-content-center">

                            <img src="product/<%=p.getImageName()%>" alt="Product image" style="height:80vh; width:auto;">
                        </div>
                    </div>
                </div>
                <div class="col-md-6 px-3 detail-box" style="background-color: #f0f0f0";>

                    <h1 class="lh-lg fw-bold"><%=p.getProduct_name()%></h1>
                    <h5 class="lh-md fw-bold">Description:</h5> <h6><%=p.getDescription()%></h6>
                    <h5 class="lh-md fw-bold">Category:</h5> <h5> <%=p.getCategory()%></h6>
                        <%
                        if(p.getStatus().equals("Not Available") || p.getQuantity().equals("0") || p.getQuantity() == null || p.getQuantity().equals("")) {
                        %>
                        <h4 class="text-center text-danger fw-bold">Out of Stock</h4>
                        <%
                    }else {%>
                        <h4 class="text-success fw-bold">In Stock</h4>
                        <h6 class="lh-md fw-bold">Quantity Available: <%=p.getQuantity()%></h6>
                        <%if(user==null) {
                        %>
                        <div class="mt-4 d-flex justify-content-center">

                            <button class="btn btn-danger btn-md rounded-pill" type="submit" data-bs-toggle="modal" data-bs-target="#loginModal">Add to Cart</button>
                            <a data-bs-toggle="modal" data-bs-target="#loginModal" class="btn btn-success btn-md ms-3 rounded-pill">Buy Now</a>
                        </div>

                        <!-- Modal -->
                        <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="loginModalLabel"></h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p class="text-center fs-6">Please <a href="login.jsp" class="text-decoration-none">login</a> to continue shopping</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                         }else {
                        %>


                        <form action="cart?product_id=<%=p.getProduct_id()%>&&id=<%=user.getId()%>" method="post">

                            <label for="quantity">Select Quantity to purchase: </label>
                            <input type="number" min="1" max="10" id="productQuantity" name="productQuantity" value="productQuantity" required>

                            <button class="btn btn-danger btn-md rounded-pill" type="submit">Add to Cart</button>
                        </form>
                        <div class="mt-4 d-flex justify-content-center">
                            <%--<a href="#" class="btn btn-danger btn-md rounded-pill"><i class="fa-solid fa-cart-shopping"></i> Add to Cart</a>--%>
                            <a href="#" class="btn btn-success btn-md ms-3 rounded-pill">Buy Now</a>
                        </div>
                        <%
                        }
                        %>
                        <%
                            }
                        %>

                        <a href="index.jsp" class="d-flex justify-content-center text-decoration-none"><i class="fa-solid fa-circle-chevron-left text-warning p-3"> Go Back</i></a>

                </div>
            </div>
        </div>
        <jsp:include page="template/footer.jsp" />

    </body>
</html>
