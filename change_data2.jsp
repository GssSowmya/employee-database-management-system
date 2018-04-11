<%-- 
    Document   : change_data2
    Created on : Jun 13, 2017, 11:46:22 AM
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
    <%
        String emp_id=request.getParameter("emp_id");
        String emp_name=request.getParameter("emp_name");
        String blood_grp=request.getParameter("blood_grp");
        String gender=request.getParameter("gender");
        String phone=request.getParameter("phone");
        String mail_id=request.getParameter("mail_id");
        String dno=request.getParameter("dno");
        String city=request.getParameter("city");
        String street=request.getParameter("street");
        String district=request.getParameter("district");
        String pincode=request.getParameter("pincode");
        r1=stat.executeQuery("select * from change_appl where emp_id="+emp_id+"");
        if(r1.next())
        {
            stat.executeUpdate("update change_appl set blood_grp='"+blood_grp+"',gender='"+gender+"',phone='"+phone+"',mail_id='"+mail_id+"',dno='"+dno+"',city='"+city+"',street='"+street+"',district='"+district+"',pincode='"+pincode+"' where emp_id="+emp_id);
        }
        else
            stat.executeUpdate("insert into change_appl values("+emp_id+",'"+emp_name+"','"+blood_grp+"','"+gender+"','"+phone+"','"+mail_id+"','"+dno+"','"+city+"','"+street+"','"+district+"','"+pincode+"')");
    %>
    <jsp:forward page="emp_home.jsp"></jsp:forward>
</html>
