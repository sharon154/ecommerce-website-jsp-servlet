

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.dao.UserDaoImpl"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.db.DBConnection"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Edit User</title>
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
                            <h4 class="text-center">Edit User</h4>

                            <%
                            int id=Integer.parseInt(request.getParameter("id"));
                            UserDaoImpl dao=new UserDaoImpl(DBConnection.getConnection());
                            User u=dao.getUserById(id);
                            %>

                            <!--<h6 class="text-center">Product Id: <%--=u.getProduct_id()--%></h6>
                            <input type="hidden" name="id" value="<%--=u.getProduct_id()--%>">-->


                            <form action="../edit_users" method="post">
                                <input type="hidden" name="id" value="<%=u.getId()%>">
                                <div class="form-group mb-2">
                                    <label for="bookName" class="form-label">Name:</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="user_name" value="<%=u.getName()%>" required>
                                    <div id="emailHelp" class="form-text" required></div>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="productDescription" class="form-label">Email:</label>
                                    <input type="email" class="form-control" id="exampleInputPassword1" name="email_id" value="<%=u.getEmail()%>"required>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="productPrice" class="form-label">Password:</label>
                                    <input type="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="password" required value="<%=u.getPassword()%>">
                                    <div id="emailHelp" class="form-text"></div>
                                </div>

                                <div class="form-group mb-2">
                                    <label for="bookName" class="form-label">Phone:</label>
                                    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="phone" value="<%=u.getPhone()%>" required>
                                    <div id="emailHelp" class="form-text" required></div>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="productDescription" class="form-label">Address:</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1" name="address" value="<%=u.getAddress()%>"required>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="productPrice" class="form-label">Landmark:</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="landmark" required value="<%=u.getLandmark()%>">
                                    <div id="emailHelp" class="form-text"></div>
                                </div>


                                <div class="form-group mb-2">
                                    <label for="bookName" class="form-label">City:</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="city" value="<%=u.getCity()%>" required>
                                    <div id="emailHelp" class="form-text" required></div>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="productDescription" class="form-label">State:</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1" name="user_state" value="<%=u.getState()%>"required>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="productPrice" class="form-label">Zip:</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="zip" required value="<%=u.getZip()%>">
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
                                                                    <% if(u.getImageName() != null) { %>
                                                                    <!-- Display the existing image -->
                                                                    <img src="../product/<%= u.getImageName() %>" alt="" style="width:100px; height:100px;">
                                                                    <!--<input type="hidden" name="existingImage" value="<%= u.getImageName() %>">-->

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
