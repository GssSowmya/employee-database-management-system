<%-- 
    Document   : logout
    Created on : May 16, 2017, 8:08:30 AM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session.invalidate();
            %>
        
        <meta http-equiv=refresh content="1;URL=login1.jsp?ad=" />
        <title>JSP Page</title>
    </head>
    <body>
        <h1>logging out....</h1>
    </body>
</html>
