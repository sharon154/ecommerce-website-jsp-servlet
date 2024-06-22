
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.entity.User"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce : My Orders</title>
        <jsp:include page="template/css.jsp" />

    </head>
    <body>
        <jsp:include page="template/navbar.jsp" />

        <%
                   User user=(User)session.getAttribute("userobj");
        %>

        <h2 class="text-center my-3 fw-bold">Hello ${userobj.name}! Your Orders</h2>
        <h5 class="text-center text-primary">No orders yet!</h5>

        <%--
            
            <jsp:include page="template/footer.jsp" />
        
        --%>

    </body>
</html>
