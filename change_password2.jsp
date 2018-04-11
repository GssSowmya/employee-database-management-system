<%-- 
    Document   : change_password2
    Created on : Jun 14, 2017, 2:49:29 PM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectjdbc.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
        String pwd,opwd,npwd,cpwd;
        %>
    <%
        pwd=(String)session.getAttribute("ppwd");
        opwd=request.getParameter("opwd");
        npwd=request.getParameter("npwd");
        cpwd=request.getParameter("cpwd");
        if(!pwd.equals(opwd))
        { %>
        <jsp:forward page="change_password.jsp?comment=not_correct"></jsp:forward>
     <% }
        if(!npwd.equals(cpwd))
        { %>
        <jsp:forward page="change_password.jsp?comment=not_match"></jsp:forward>
     <% }
        int i=Integer.parseInt((String)session.getAttribute("puid"));
        stat.executeUpdate("update emp_auth set pwd='"+npwd+"' where emp_id="+i);
        %>
        <jsp:forward page="change_password.jsp?comment=logout"></jsp:forward>
    <body>
    </body>
</html>
