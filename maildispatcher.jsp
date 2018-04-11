<%-- 
    Document   : newjsmaildispatcher
    Created on : Jun 6, 2017, 11:51:41 AM
    Author     : SOWMMYA
--%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="com.sowmya.ejb.*"%>
<%@page import="javax.ejb.EJB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!
    @EJB
    mailsenderbean mailsender;
%>
<%
    Context context=new InitialContext();
    mailsender=(mailsenderbean)context.lookup(mailsenderbean.class.getName());
    
    String toemail=request.getParameter("toemail");
    String subject=request.getParameter("subject");
    String msg=request.getParameter("msg");
        
        
    String fromemail="gsssowmya@gmail.com";
    String username="gsssowmya";
    String password="swarajyam";
    mailsender.sendemail(fromemail,username,password,toemail,subject,msg);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
