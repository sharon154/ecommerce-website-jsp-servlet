

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.dao.ProductDaoImpl"%>
<%@ page import="com.entity.ProductDetails"%>
<%@ page import="com.db.DBConnection"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Edit Product</title>
        <jsp:include page="adcss.jsp" />

    </head>
    <body style="background-color: #f0f2f2;">
        <jsp:include page="adnavbar.jsp" />

        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp">
            </c:redirect>
        </c:if>

        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-4">
                        <div class="card-body">
                            <h4 class="text-center">Edit Product</h4>

                            <%
                            int product_id=Integer.parseInt(request.getParameter("product_id"));
                            ProductDaoImpl dao=new ProductDaoImpl(DBConnection.getConnection());
                            ProductDetails p=dao.getProductById(product_id);
                            %>

                            <!--<h6 class="text-center">Product Id: <%--=p.getProduct_id()--%></h6>
                            <input type="hidden" name="product_id" value="<%--=p.getProduct_id()--%>">-->


                            <form action="../edit_products" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="product_id" value="<%=p.getProduct_id()%>">
                                <div class="form-group mb-2">
                                    <label for="bookName" class="form-label">Product Name:</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="pname" value="<%=p.getProduct_name()%>" required>
                                    <div id="emailHelp" class="form-text" required></div>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="productDescription" class="form-label">Product Description:</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1" name="pdescription" value="<%=p.getDescription()%>"required>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="productPrice" class="form-label">Price:</label>
                                    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="pPrice" required value="<%=p.getPrice()%>">
                                    <div id="emailHelp" class="form-text"></div>
                                </div>

                                <div class="form-group mb-2">
                                    <label for="productCategory" class="form-label">Category:</label>
                                    <select id="productCategory" name="pCategory" class="form-control">
                                        <% if("men_clothing".equals(p.getCategory())) {
                                        %>
                                        <option value="Men's Clothing">Men's Clothing</option>
                                        <option value="Women's Clothing">Women's Clothing</option>
                                        <option value="Kid's Clothing">Kid's Clothing</option>

                                        <%
                                        }else if("women_clothing".equals(p.getCategory())){
                                        %>
                                        <option value="Women's Clothing">Women's Clothing</option>
                                        <option value="Men's Clothing">Men's Clothing</option>
                                        <option value="Kid's Clothing">Kid's Clothing</option>

                                        <%
                                              }else {
                                        %>
                                        <option value="Kid's Clothing">Kid's Clothing</option>
                                        <option value="Women's Clothing">Women's Clothing</option>
                                        <option value="Men's Clothing">Men's Clothing</option>
                                        <%
                                                    }
                                        %>

                                    </select>
                                </div>

                                <div class="form-group mb-2">
                                    <label for="productStatus" class="form-label">Status:</label>
                                    <select id="productStatus" name="productStatus" class="form-control">
                                        <% if("Available".equals(p.getStatus())) {
                                        %>
                                        <option value="Available">Available</option>
                                        <option value="Not Available">Not Available</option>

                                        <%
                                        }else {
                                        %>
                                        <option value="Not available">Not Available</option>
                                        <option value="Available">Available</option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="form-group mb-2">
                                    <label for="productQuantity" class="form-label">Quantity:</label>
                                    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="pQuantity" value="<%=p.getQuantity()%>">
                                    <div id="emailHelp" class="form-text"></div>
                                </div>

                                <%--
                            <div class="form-group mb-3">
                                <label for="exampleFormControlFile1" class="form-label">Product Image:</label>
                                <input type="file" class="form-control-file" id="exampleFormControlFile1" aria-describedby="emailHelp" name="pimg">

                                </div>
                                --%>
                                <%--
                                                                <div class="form-group mb-3">
                                                                    <label for="exampleFormControlFile1" class="form-label">Product Image:</label>
                                                                    <% if(p.getImageName() != null) { %>
                                                                    <!-- Display the existing image -->
                                                                    <img src="../product/<%= p.getImageName() %>" alt="" style="width:100px; height:100px;">
                                                                    <!--<input type="hidden" name="existingImage" value="<%= p.getImageName() %>">-->

                                    <h6 class="text-center mt-1">Change Image:</h6>
                                    <input type="file" class="form-control-file" id="exampleFormControlFile1" aria-describedby="emailHelp" name="pimg">
                                    <% } else { %>
                                    <!-- Allow user to upload a new image -->
                                    <input type="file" class="form-control-file" id="exampleFormControlFile1" aria-describedby="emailHelp" name="pimg">
                                    <% } %>
                                </div>

                                --%>

                                <div class="d-flex justify-content-center">
                                    <button type="submit" class="btn btn-primary">Save Changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
