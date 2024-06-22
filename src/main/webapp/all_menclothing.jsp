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
        <title>All Men's Clothing</title>
        <jsp:include page="template/css.jsp" />

    </head>
    <body>
        <jsp:include page="template/navbar.jsp" />
        <div class="conatiner-fluid">
            <div class="container">
                <div class="row mt-3">
                    <%
                    ProductDaoImpl dao5=new ProductDaoImpl(DBConnection.getConnection());
                    List<ProductDetails> list5=dao5.getAllMenClothing();
                    for (ProductDetails p5:list5) {
                    %>
                    <div class="col-md-3">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img src="product/<%=p5.getImageName()%>" style="width:150px; height:200px" class="img-thumblin" alt="">
                                <h5><%=p5.getProduct_name()%></h5>
                                <p><%=p5.getDescription()%></p>
                                <%
                                if(p5.getStatus().equals("Not Available") || p5.getQuantity().equals("0") || p5.getQuantity() == null  || p5.getQuantity().equals("")){
                                %>
                                <p>Category: <%= p5.getCategory() %></p>
                                <h6 class="text-danger">Out of Stock</h6>

                                <div class="row p-2 d-flex justify-content-between">
                                    <a href="view_detail.jsp?product_id=<%=p5.getProduct_id()%>" class="btn btn-success btn-sm my-2 rounded-pill">View</a>
                                    <a href="#" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-indian-rupee-sign"></i> <%= p5.getPrice() %></a>
                                </div>
                                <%
                                } else {
                                %>
                                <p>Category: <%= p5.getCategory() %></p>
                                <div class="row p-2 d-flex justify-content-between">
                                    <!--<a href="#" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-cart-shopping"></i> Add to Cart</a>-->
                                    <a href="view_detail.jsp?product_id=<%=p5.getProduct_id()%>" class="btn btn-success btn-sm my-2 rounded-pill">View</a>
                                    <a href="view_detail.jsp?product_id=<%=p5.getProduct_id()%>" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-indian-rupee-sign"></i> <%= p5.getPrice() %></a>
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
