
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce : Help Centre</title>
        <jsp:include page="template/css.jsp" />
        <style type="text/css">
            a{
                text-decoration: none;
                color:#000000;
            }

            a:hover{
                text-decoration: none;
                color:#000000;
            }
            .crd-ho:hover{
                background-color: #f0f2f2;
            }
        </style>

    </head>
    <body>
        <jsp:include page="template/navbar.jsp" />
        <div class="container">
            <div class="row px-2 py-4 mt-5 d-flex justify-content-center">
                <div class="col-4">
                    <a href="editprofile.jsp">
                        <div class="card crd-ho py-5">
                            <div class="card-body text-center text-primary">
                                For any queries, contact us at queries@clothingstore.com
                                Customer Care : +1800-432-4533

                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

                </body>
                </html>
