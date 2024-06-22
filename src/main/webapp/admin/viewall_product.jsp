<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.dao.ProductDaoImpl"%>
<%@ page import="com.db.DBConnection"%>
<%@ page import="com.entity.ProductDetails"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin : All Product</title>
        <jsp:include page="adcss.jsp" />

    </head>
    <body>
        <jsp:include page="adnavbar.jsp" />

        <h1 class="text-center">Hello Admin!</h1>

        <c:if test="${not empty successMsg}">
            <p class="text-center text-success">${successMsg }</p>
            <c:remove var="successMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty failedMsg}">
            <p class="text-center text-danger">${failedMsg }</p>
            <c:remove var="failedMsg" scope="session"/>

        </c:if>

        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp">
            </c:redirect>
        </c:if>

        <table class="table table-warning table-hover table-bordered border-black">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Image</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Category</th>
                    <th scope="col">Price</th>
                    <th scope="col">Status</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Edit/Delete</th>

                </tr>
            </thead>
            <tbody>
                <% 
                ProductDaoImpl dao=new ProductDaoImpl(DBConnection.getConnection());
                List<ProductDetails> list=dao.getAllProducts();
                for(ProductDetails p:list) { 
                %>
                <tr>
                    <td><%=p.getProduct_id()%></td>
                    <td><img src="../product/<%=p.getImageName()%>" style="width:100px; height:100px;"></td>
                    <td><%=p.getProduct_name()%></td>
                    <td><%=p.getDescription()%></td>
                    <td><%=p.getCategory()%></td>
                    <td><%=p.getPrice()%></td>
                    <td><%=p.getStatus()%></td>
                    <td><%=p.getQuantity()%></td>
                    <td><a href="edit_product.jsp?product_id=<%=p.getProduct_id()%>" class="btn btn-primary me-2 mb-2"><i class="fa-solid fa-file-pen"></i> Edit</a>
                        <a href="../delete?product_id=<%=p.getProduct_id()%>" class="btn btn-danger"><i class="fa-solid fa-square-minus"></i> Delete</a></td>

                </tr>

                <% } %>

            </tbody>
        </table>
    </body>
</html>
