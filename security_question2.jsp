<%-- 
    Document   : security_question2
    Created on : Jul 1, 2017, 4:07:28 PM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectjdbc.jsp" %>
<!DOCTYPE html>
<%
    int emp_id=Integer.parseInt((String)session.getAttribute("puid"));
    int qid=Integer.parseInt(request.getParameter("qid"));
    String answer=request.getParameter("answer");
    r1=stat.executeQuery("select * from forgot_pwd where emp_id="+emp_id);
    if(r1.next())
    {
        stat.executeUpdate("update forgot_pwd set question_id="+qid+",answer='"+answer+"'");
    }
    else
        stat.executeUpdate("insert into forgot_pwd values("+emp_id+","+qid+",'"+answer+"')");
    if(((String)session.getAttribute("prole")).equals("1"))
    {
        //response.sendRedirect("emp_home.jsp"); 
        %>
        <jsp:forward page="emp_home.jsp"></jsp:forward>
    <%}
else if(((String)session.getAttribute("prole")).equals("5"))
    {
        //response.sendRedirect("hr_home.jsp");
%>
        <jsp:forward page="hr_home.jsp"></jsp:forward><%
    }
%>
