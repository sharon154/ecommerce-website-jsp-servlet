<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin : All Order</title>
        <jsp:include page="adcss.jsp" />

    </head>
    <body>
        <jsp:include page="adnavbar.jsp" />

    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp">
        </c:redirect>
    </c:if>
    
    <h1 class="text-center">Hello Admin!</h1>

    <table class="table table-warning table-hover table-bordered border-black">
        <thead>
            <tr>
                <th scope="col">Order Id</th>
                <th scope="col">Customer Name</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
                <th scope="col">Phone</th>
                <th scope="col">Product Name</th>
                <th scope="col">Description</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>


            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td><a href="" class="btn btn-primary me-2">Edit
                        <a href="" class="btn btn-danger">Delete</td>

                            </tr>

                            </tbody>
                            </table>
                            </body>
                            </html>
