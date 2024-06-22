
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>

<%@page import="com.dao.ProductDaoImpl"%>
<%@page import="com.entity.ProductDetails"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.UserDaoImpl"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.dao.CartDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce : Cart Checkout</title>
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
    <body style="background-color: #fff9ea">
        <jsp:include page="template/navbar.jsp" />
        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp">
            </c:redirect>
        </c:if>
        <div class="container">

            <div class="row px-5 mx-5 pt-2">
                <div class="col px-5 mx-2">
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

                    <h2 class="text-center my-3 fw-bold">Hello ${userobj.name}! Your Cart</h2>

                    <%
                    CartDaoImpl dao=new CartDaoImpl(DBConnection.getConnection());
                    List<Cart> list=dao.getProductByUser(user.getId());
                              
                           
                    for(Cart c:list) {
                    ProductDaoImpl dao2=new ProductDaoImpl(DBConnection.getConnection());

                    ProductDetails p=dao2.getProductById(c.getProduct_id().getProduct_id());
                            
                    %>

                    <div class="card mb-3 px-2 crd-ho">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-10 ps-2">
                                    <a href="view_detail.jsp?product_id=<%=p.getProduct_id()%>">
                                        <h3><%=c.getProduct_name()%></h3>
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
                                <div class="d-flex justify-content-end">
                                    <a href="remove_cart?cartId=<%=c.getCartId()%>&&id=<%=user.getId()%>" class="btn btn-primary btn-sm me-2"><i class="fa-solid fa-file-pen"></i> Remove</a>
                                    <a href="checkout.jsp?cartId=<%=c.getCartId()%>&&id=<%=user.getId()%>" class="btn btn-primary btn-sm"><i class="fa-solid fa-file-pen"></i> Checkout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }

                    %>
                </div>



            </div>
        </div>
        <jsp:include page="template/footer.jsp" />

    </body>
</html>
