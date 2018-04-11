<%-- 
    Document   : create_insert.jsp
    Created on : May 20, 2017, 11:46:31 AM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectjdbc.jsp" %>
<!DOCTYPE html>
<%
    
    //String emp_id="";
    //session.setAttribute("emp_id",stat.executeQuery("select emp_id_gen_prof.currval from dual"));
            //String pwd=request.getParameter("pwd");
            String emp_name=request.getParameter("emp_name");
            String dept_id=request.getParameter("dept_id");
            String dob=request.getParameter("do_birth");
            String doj=request.getParameter("do_join");
            String bld_grp=request.getParameter("blood_grp");
            String status;
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
            stat.executeUpdate("insert into emp_profile values(emp_test.nextval,'"+emp_name+"',"+dept_id+",'"+dob+"','"+doj+"','10','"+gender+"',"+desgn+",'"+phone+"','"+mail_id+"','"+bld_grp+"')");
            stat.executeUpdate("insert into emp_auth values(emp_test.currval,emp_test.currval,"+dept_id+",1)");
            stat.executeUpdate("insert into master_address values(emp_test.currval,'"+dno+"','"+city+"','"+street+"','"+district+"',"+pincode+")");
            
             %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="3;text/html; charset=UTF-8">
        <title>creating</title>
    </head>
    <body>
        <h1>updating database....</h1>
        <jsp:forward page="hr_home.jsp" />
    </body>
</html>
