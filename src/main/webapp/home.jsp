

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User : Home</title>
    </head>
    <body>
                    <c:if test="${not empty userobj}">
                        <h1>Name:${userobj.name}</h1>
                        <h1>Email:${userobj.email}</h1>
                    </c:if>
    </body>
</html>
