

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.ProductDaoImpl"%>
<%@page import="com.entity.ProductDetails"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.dao.CartDaoImpl"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce : Checkout</title>
        <jsp:include page="template/css.jsp" />
        <style type="text/css">
            a {
                text-decoration: none;
            }
            a:hover {
                text-decoration: none;

            }
        </style>
    </head>
    <body style="background-color: #f0f2f2;">
        <jsp:include page="template/navbar.jsp" />
        <%
                            User user=(User)session.getAttribute("userobj");
                            int cartId = Integer.parseInt(request.getParameter("cartId"));
                            int id = Integer.parseInt(request.getParameter("id"));
                            
                            CartDaoImpl dao=new CartDaoImpl(DBConnection.getConnection());
                            Cart c=dao.getCartById(cartId,id);
                              
                           
                    ProductDaoImpl dao2=new ProductDaoImpl(DBConnection.getConnection());

                    ProductDetails p=dao2.getProductById(c.getProduct_id().getProduct_id());
                    
        %>

        <div class="container">
            <div class="row px-5 mx-5 pt-2">
                <div class="col px-5 mx-2">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="text-center">Order Confirmation</h2>
                            <hr>
                            <div class="row py-2">
                                <h4>Product Details</h4>
                                <div class="col-10 mt-2 ps-2">
                                    <a href="view_detail.jsp?product_id=<%=p.getProduct_id()%>">
                                        <h5><%=c.getProduct_name()%></h5>
                                    </a>
                                    <p>Description: <%=c.getDescription()%></p>
                                    <p>Category: <%=p.getCategory()%></p>
                                    <p>Price: <%=c.getPrice()%></p>
                                    <p>Quantity: <%=c.getQuantity()%></p>
                                    <span>Total Amount: <%=c.getTotal_amount()%></span>

                                </div>
                                <div class="col-2 d-flex justify-content-end pe-2 pt-3">
                                    <img src="product/<%=p.getImageName()%>" style="width:170px; height:200px;">
                                </div>
                            </div>
                            <hr>
                            <h4>Personal Details</h4>
                            <form>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" class="form-control" id="name" aria-describedby="emailHelp" value="${userobj.name}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" value="${userobj.email}" required>
                                </div>

                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input type="number" class="form-control" id="phone" aria-describedby="emailHelp" value="phone" required>
                                </div>
                                <hr>
                                <h4>Billing Address</h4>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="address" value="address" required>
                                </div>

                                <div class="mb-3">
                                    <label for="landmark" class="form-label">Landmark</label>
                                    <input type="text" class="form-control" id="landmark" aria-describedby="emailHelp" value="landmark" required>
                                </div>
                                <div class="mb-3">
                                    <label for="city" class="form-label">City</label>
                                    <input type="text" class="form-control" id="city" value="city" required>
                                </div>

                                <div class="mb-3">
                                    <label for="phone" class="form-label">State</label>
                                    <input type="text" class="form-control" id="state" aria-describedby="emailHelp" value="state" required>
                                </div>
                                <div class="mb-3">
                                    <label for="zip" class="form-label">Zip</label>
                                    <input type="text" class="form-control" id="zip" value="zip" required>
                                </div>
                                <hr>
                                <h4>Shipping Address</h4>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="address" value="address" required>
                                </div>

                                <div class="mb-3">
                                    <label for="landmark" class="form-label">Landmark</label>
                                    <input type="text" class="form-control" id="landmark" aria-describedby="emailHelp" value="landmark" required>
                                </div>
                                <div class="mb-3">
                                    <label for="city" class="form-label">City</label>
                                    <input type="text" class="form-control" id="city" value="city" required>
                                </div>

                                <div class="mb-3">
                                    <label for="phone" class="form-label">State</label>
                                    <input type="text" class="form-control" id="state" aria-describedby="emailHelp" value="state" required>
                                </div>
                                <div class="mb-3">
                                    <label for="zip" class="form-label">Zip</label>
                                    <input type="text" class="form-control" id="zip" value="zip" required>
                                </div>
                                <div class="d-flex justify-content-end">

                                    <button class="btn btn-success btn-md rounded-pill" type="submit">Make Payment</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <jsp:include page="template/footer.jsp" />

    </body>
</html>
