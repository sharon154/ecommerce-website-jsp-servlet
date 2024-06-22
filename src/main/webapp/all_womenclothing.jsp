<%@page import="com.db.DBConnection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDaoImpl"%>
<%@page import="com.entity.ProductDetails"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Women's Clothing</title>
        <jsp:include page="template/css.jsp" />

    </head>
    <body>
        <jsp:include page="template/navbar.jsp" />
        <div class="conatiner-fluid">
            <div class="container">
                <div class="row mt-3">
                    <%
                    ProductDaoImpl dao4=new ProductDaoImpl(DBConnection.getConnection());
                    List<ProductDetails> list4=dao4.getAllWomenClothing();
                    for (ProductDetails p4:list4) {
                    %>
                    <div class="col-md-3">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img src="product/<%=p4.getImageName()%>" style="width:150px; height:200px" class="img-thumblin" alt="">
                                <h5><%=p4.getProduct_name()%></h5>
                                <p><%=p4.getDescription()%></p>
                                <%
                                if(p4.getStatus().equals("Not Available") || p4.getQuantity().equals("0") || p4.getQuantity() == null  || p4.getQuantity().equals("")){
                                %>
                                <p>Category: <%= p4.getCategory() %></p>
                                <h6 class="text-danger">Out of Stock</h6>

                                <div class="row p-2 d-flex justify-content-between">
                                    <a href="view_detail.jsp?product_id=<%=p4.getProduct_id()%>" class="btn btn-success btn-sm my-2 rounded-pill">View</a>
                                    <a href="#" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-indian-rupee-sign"></i> <%= p4.getPrice() %></a>
                                </div>
                                <%
                                } else {
                                %>
                                <p>Category: <%= p4.getCategory() %></p>
                                <div class="row p-2 d-flex justify-content-between">
                                    <!--<a href="#" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-cart-shopping"></i> Add to Cart</a>-->
                                    <a href="view_detail.jsp?product_id=<%=p4.getProduct_id()%>" class="btn btn-success btn-sm my-2 rounded-pill">View</a>
                                    <a href="view_detail.jsp?product_id=<%=p4.getProduct_id()%>" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-indian-rupee-sign"></i> <%= p4.getPrice() %></a>
                                </div>
                                <%
                                }
                                %>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>

                </div>
            </div>
        </div>
    </body>
</html>
