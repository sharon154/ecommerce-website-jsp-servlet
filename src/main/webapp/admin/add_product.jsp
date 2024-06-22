

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Add Product</title>
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
                            <h4 class="text-center">Add Product</h4>
                            <c:if test="${not empty successMsg}">
                                <p class="text-center text-success">${successMsg }</p>
                                <c:remove var="successMsg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg }</p>
                                <c:remove var="failedMsg" scope="session"/>

                            </c:if>
                            <form action="../add_products" method="post" enctype="multipart/form-data">

                                <div class="form-group mb-2">
                                    <label for="bookName" class="form-label">Product Name:</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="pname">
                                    <div id="emailHelp" class="form-text" required></div>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="productDescription" class="form-label">Product Description:</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1" name="pdescription" required>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="productPrice" class="form-label">Price:</label>
                                    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="pPrice">
                                    <div id="emailHelp" class="form-text" required></div>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="productCategory" class="form-label">Category:</label>
                                    <select id="productCategory" name="pCategory" class="form-control">
                                        <option selected>--Select Category--</option>
                                        <option value="Men's Clothing">Men's Clothing </option>
                                        <option value="Women's Clothing">Women's Clothing </option>
                                        <option value="Kid's Clothing">Kid's Clothing </option>
                                    </select>
                                </div>

                                <div class="form-group mb-2">
                                    <label for="productStatus" class="form-label">Status:</label>
                                    <select id="productStatus" name="pStatus" class="form-control">
                                        <option selected>--Select Status--</option>
                                        <option value="Available">Available</option>
                                        <option value="Not available">Not Available</option>
                                    </select>
                                </div>

                                <div class="form-group mb-2">
                                    <label for="productQuantity" class="form-label">Quantity:</label>
                                    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="pQuantity">
                                    <div id="emailHelp" class="form-text"></div>
                                </div>

                                <div class="form-group mb-3">
                                    <label for="exampleFormControlFile1" class="form-label">Product Image:</label>
                                    <input type="file" class="form-control-file" id="exampleFormControlFile1" aria-describedby="emailHelp" name="pimg">

                                </div>

                                <div class="d-flex justify-content-center">
                                    <button type="submit" class="btn btn-primary">Add</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
