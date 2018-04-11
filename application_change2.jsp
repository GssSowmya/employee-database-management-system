<%-- 
    Document   : application_change2
    Created on : Jun 13, 2017, 12:42:31 PM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectjdbc.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            String s=request.getParameter("emp_id");
            int i=Integer.parseInt(s);
            stat.executeUpdate("delete from change_appl where emp_id="+i);
            %>
    </head>
    <jsp:forward page="edit_portal.jsp"></jsp:forward>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
