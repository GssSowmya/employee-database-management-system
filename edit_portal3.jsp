<%-- 
    Document   : edit_portal3.jsp
    Created on : May 22, 2017, 11:35:22 AM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectjdbc.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>updating</title>
    </head>
    <%!
        int i,j;
    %>
    <%
            String emp_id=request.getParameter("emp_id");
            i=Integer.parseInt(emp_id);
            String emp_name=request.getParameter("emp_name");
            String dept_id=request.getParameter("dept_id");
            String dob=request.getParameter("do_birth");
            String doj=request.getParameter("do_join");
            String blood_grp=request.getParameter("blood_grp");
            String status=request.getParameter("status");
            String gender=request.getParameter("gender");
            String desgn=request.getParameter("desgn_id");
            String phone=request.getParameter("phone");
            String mail_id=request.getParameter("mail_id");
            String dno=request.getParameter("dno");
            String city=request.getParameter("city");
            String street=request.getParameter("street");
            String district=request.getParameter("district");
            String pincode=request.getParameter("pincode");
            String role=request.getParameter("role");
            stat.executeUpdate("update master_address set dno='"+dno+"',city='"+city+"',street='"+street+"',district='"+district+"',pincode="+pincode+" where emp_id="+i);
            stat.executeUpdate("update emp_auth set dept_id="+dept_id+",role='"+role+"' where emp_id="+i);
            stat.executeUpdate("update emp_profile set emp_name='"+emp_name+"',dept_id="+dept_id+",status='"+status+"',gender='"+gender+"',desg_id="+desgn+",phone='"+phone+"',mail_id='"+mail_id+"',bld_grp='"+blood_grp+"' where emp_id="+i);
    %>
    <jsp:forward page="hr_home.jsp" ></jsp:forward>
</html>
