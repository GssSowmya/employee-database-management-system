<%-- 
    Document   : login2.jsp
    Created on : May 14, 2017, 7:39:59 PM
    Author     : SOWMMYA
--%>
<%@include file="connectjdbc.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <%
        String uid=request.getParameter("uid");
        String pwd=request.getParameter("pwd");
        r1=stat.executeQuery("select * from emp_auth where emp_id="+uid+"and pwd='"+pwd+"'");
        if(r1.next())
        {
            session.setAttribute("puid",uid);
            session.setAttribute("ppwd",pwd);
            session.setAttribute("prole",r1.getString("role"));
            session.setAttribute("pdept_id",r1.getString("dept_id"));
            session.setAttribute("pcounter",r1.getString("counter"));
            //stat.executeUpdate("update emp_auth set counter="+(Integer.parseInt(r1.getString("counter"))+1)+" where emp_id="+uid);
            /*if(r1.getString("counter").equals("1"))
            {
                response.sendRedirect("newUser.jsp");
            }
            else */if(r1.getString("role").equals("1"))
            {
                response.sendRedirect("emp_home.jsp");
            }
            else if(r1.getString("role").equals("5"))
            {
                response.sendRedirect("hr_home.jsp");
            }
        }
        else
            {%>
        <jsp:forward page="login1.jsp?ad=invalid" /><%}
  %>

