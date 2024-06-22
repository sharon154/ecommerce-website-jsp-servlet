<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.dao.UserDaoImpl"%>
<%@ page import="com.db.DBConnection"%>
<%@ page import="com.entity.User"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin : All User</title>
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
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Password</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Address</th>
                    <th scope="col">Landmark</th>
                    <th scope="col">City</th>
                    <th scope="col">State</th>
                    <th scope="col">Zip</th>
                    <th scope="col">Delete</th>

                </tr>
            </thead>
            <tbody>
                <% 
                UserDaoImpl dao=new UserDaoImpl(DBConnection.getConnection());
                List<User> list=dao.getAllUsers();
                for(User user:list) { 
                %>
                <tr>
                    <td><%=user.getId()%></td>
                    <td><%=user.getName()%></td>
                    <td><%=user.getEmail()%></td>
                    <td><%=user.getPassword()%></td>
                    <td><%=user.getPhone()%></td>
                    <td><%=user.getAddress()%></td>
                    <td><%=user.getLandmark()%></td>
                    <td><%=user.getCity()%></td>
                    <td><%=user.getState()%></td>
                    <td><%=user.getZip()%></td>

                    <td>
                        <a href="../deleteuser?id=<%=user.getId()%>" class="btn btn-danger"><i class="fa-solid fa-square-minus"></i> Delete</a></td>

                </tr>

                <% } %>

            </tbody>
        </table>
    </body>
</html>
