<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDaoImpl"%>
<%@page import="com.entity.ProductDetails"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.UserDaoImpl"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce : Index</title>
        <jsp:include page="template/css.jsp" />
        <style type="text/css">
            /*
            .back-img {
                background: url("img/home.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                height:50vh;
                width: 100%;
                
            }
            */
            .carousel-inner {
                height:50vh;
                width:100%;
            }
            .carousel-caption {
                position: absolute;
                z-index: 1;
                display:table;
                width:100%;
                height:100%;
                background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black overlay */
                top: 0;
                left: 0;
            }

            .absolute-div {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
            }

            .carousel-caption h5 {
                display:table-cell;
                vertical-align: text-bottom;
                text-align:center;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5); /* Text shadow for better contrast */
            }

            .carousel-item {
                position:relative;
            }



        </style>
    </head>
    <body>
        <%
        User user=(User)session.getAttribute("userobj");
        %>
        <jsp:include page="template/navbar.jsp" />
        <%-- Background Image
        <div class="container-fluid back-img">
            <h2 class="text-center text-light">Clothing Ecommerce System
            </h2>
        </div>
        --%>


        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="2500">
                    <a href="#womens_clothingsection">
                        <img src="img/indeximage5.jpg" class="d-block w-100" alt="...">
                        <div class="absolute-div text-center">
                            <div class="carousel-caption align-items-center">
                                <h1>Shop Exclusive Women's Wear</h1>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="carousel-item" data-bs-interval="2500">
                    <a href="#mens_clothingsection">
                        <img src="img/indeximage6.jpg" class="d-block w-100" alt="...">
                        <div class="absolute-div">
                            <div class="carousel-caption">
                                <h1>Shop Exclusive Men's Wear</h1>
                            </div>
                        </div>

                    </a>
                </div>
                <div class="carousel-item" data-bs-interval="2500">
                    <a href="#kids_clothingsection">
                        <img src="img/index9.jpg" class="d-block w-100" alt="...">
                        <div class="absolute-div">
                            <div class="carousel-caption">
                                <h1>Shop Exclusive Kid's Wear</h1>
                            </div>
                        </div>

                    </a>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <%--
        Connection con=DBConnection.getConnection();
        out.println(con);
        --%>

        <div class="container-fluid mt-1">
            <div class="container mt-2" id="womens_clothingsection">
                <h3 class="text-center">Women's Clothing</h3>
                <div class="row">

                    <%
                    ProductDaoImpl dao=new ProductDaoImpl(DBConnection.getConnection());
                    List<ProductDetails> list=dao.getWomenClothing();
                    for (ProductDetails p:list) {
                    %>
                    <div class="col-md-3">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img src="product/<%=p.getImageName()%>" style="width:150px; height:200px" class="img-thumblin" alt="">
                                <h5><%=p.getProduct_name()%></h5>
                                <p><%=p.getDescription()%></p>
                                <%
                                if(p.getStatus().equals("Not Available") || p.getQuantity().equals("0") || p.getQuantity() == null || p.getQuantity().equals("")){

                                %>
                                <p>Category: <%= p.getCategory() %></p>
                                <h6 class="text-danger">Out of Stock</h6>

                                <div class="row p-2 d-flex justify-content-between">
                                    <a href="#" class="btn btn-success btn-sm my-2 rounded-pill">View</a>
                                    <a href="#" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-indian-rupee-sign"></i> <%= p.getPrice() %></a>
                                </div>
                                <%
                                } else {
                                %>
                                <p>Category: <%= p.getCategory() %></p>
                                <div class="row p-2 d-flex justify-content-between">
                                    <%--
                                    <%if(user==null) {
                                    %>
                                    <a href="login.jsp" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-cart-shopping"></i> Add to Cart</a>
                                    <%
                                        }else {
                                    %>
                                    <a href="" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-cart-shopping"></i> Add to Cart</a>
                                    <%
                                    }
                                    %>

--%>
                                    <a href="view_detail.jsp?product_id=<%=p.getProduct_id()%>" class="btn btn-success btn-sm my-2 rounded-pill">View</a>
                                    <a href="view_detail.jsp?product_id=<%=p.getProduct_id()%>" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-indian-rupee-sign"></i> <%= p.getPrice() %></a>
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

                    <div class="text-center">                                
                        <a href="all_womenclothing.jsp" class="btn btn-danger btn-sm mt-2">View All</a>
                    </div>
                </div>
            </div>
            <hr>

            <div class="container mt-2" id="mens_clothingsection">

                <h3 class="text-center">Men's Clothing</h3>
                <div class="row">

                    <%
                    ProductDaoImpl dao2=new ProductDaoImpl(DBConnection.getConnection());
                    List<ProductDetails> list2=dao2.getMenClothing();
                    for (ProductDetails p2:list2) {
                    %>
                    <div class="col-md-3">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img src="product/<%=p2.getImageName()%>" style="width:150px; height:200px" class="img-thumblin" alt="">
                                <h5><%=p2.getProduct_name()%></h5>
                                <p><%=p2.getDescription()%></p>
                                <%
                                if(p2.getStatus().equals("Not Available") || p2.getQuantity().equals("0") || p2.getQuantity() == null || p2.getQuantity().equals("")) {
                                %>
                                <p>Category: <%= p2.getCategory() %></p>
                                <h6 class="text-danger">Out of Stock</h6>

                                <div class="row p-2 d-flex justify-content-between">
                                    <a href="#" class="btn btn-success btn-sm my-2 rounded-pill">View</a>
                                    <a href="#" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-indian-rupee-sign"></i> <%= p2.getPrice() %></a>
                                </div>
                                <%
                                } else {
                                %>
                                <p>Category: <%= p2.getCategory() %></p>
                                <div class="row p-2 d-flex justify-content-between">
                                    <!--<a href="#" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-cart-shopping"></i> Add to Cart</a>-->
                                    <a href="view_detail.jsp?product_id=<%=p2.getProduct_id()%>" class="btn btn-success btn-sm my-2 rounded-pill">View</a>
                                    <a href="view_detail.jsp?product_id=<%=p2.getProduct_id()%>" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-indian-rupee-sign"></i> <%= p2.getPrice() %></a>
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

                    <div class="text-center">                                
                        <a href="all_menclothing.jsp" class="btn btn-danger btn-sm mt-2">View All</a>
                    </div>
                </div>
            </div>
            <hr>

            <div class="container mt-2" id="kids_clothingsection">
                <h3 class="text-center">Kid's Clothing</h3>
                <div class="row">

                    <%
                    ProductDaoImpl dao3=new ProductDaoImpl(DBConnection.getConnection());
                    List<ProductDetails> list3=dao3.getKidsClothing();
                    for (ProductDetails p3:list3) {
                    %>
                    <div class="col-md-3">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img src="product/<%=p3.getImageName()%>" style="width:150px; height:200px" class="img-thumblin" alt="">
                                <h5><%=p3.getProduct_name()%></h5>
                                <p><%=p3.getDescription()%></p>
                                <%
                                if(p3.getStatus().equals("Not Available") || p3.getQuantity().equals("0") || p3.getQuantity() == null  || p3.getQuantity().equals("")){
                                %>
                                <p>Category: <%= p3.getCategory() %></p>
                                <h6 class="text-danger">Out of Stock</h6>

                                <div class="row p-2 d-flex justify-content-between">
                                    <a href="view_detail.jsp?product_id=<%=p3.getProduct_id()%>" class="btn btn-success btn-sm my-2 rounded-pill">View</a>
                                    <a href="#" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-indian-rupee-sign"></i> <%= p3.getPrice() %></a>
                                </div>
                                <%
                                } else {
                                %>
                                <p>Category: <%= p3.getCategory() %></p>
                                <div class="row p-2 d-flex justify-content-between">
                                    <!--<a href="#" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-cart-shopping"></i> Add to Cart</a>-->
                                    <a href="view_detail.jsp?product_id=<%=p3.getProduct_id()%>" class="btn btn-success btn-sm my-2 rounded-pill">View</a>
                                    <a href="view_detail.jsp?product_id=<%=p3.getProduct_id()%>" class="btn btn-danger btn-sm rounded-pill"><i class="fa-solid fa-indian-rupee-sign"></i> <%= p3.getPrice() %></a>
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

                    <div class="text-center">                                
                        <a href="all_kidclothing.jsp" class="btn btn-danger btn-sm my-2">View All</a>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="template/footer.jsp" />
    </body>
</html>
