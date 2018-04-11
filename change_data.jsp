<%-- 
    Document   : change_data
    Created on : Jun 12, 2017, 10:45:49 AM
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
        String emp_id,l,k;
        int i;
        %>
     <%
        emp_id=(String)session.getAttribute("puid");
        i=Integer.parseInt(emp_id);
        r1=stat.executeQuery("select * from emp_profile where emp_id="+i);
        r1.next();
    %>
    <body
            <center>
        <form action="change_data2.jsp" method="post" >
        <table border="0">
            <tbody>
                <tr>
                    <td>Emp_id:</td>
                    <td><input type="text" name="emp_id" readonly="readonly" value=<%=r1.getString("emp_id")%> size="50" /></td>
                </tr>
                <tr>
                    <td>Emp_name:</td>
                    <td><input type="text" name="emp_name" readonly="readonly" value=<%=r1.getString("emp_name")%> size="50" /></td>
                </tr>
                <tr>
                    <td>Blood Group</td>
                    <td><select name="blood_grp">
                            <option value=<%=r1.getString("bld_grp")%> visible="true"><%=r1.getString("bld_grp")%></option>
                            <option value=a+>A+</option>
                            <option value=b+>B+</option>
                            <option value=ab+>AB+</option>
                            <option value=o+>O+</option>
                            <option value=a->A-</option>
                            <option value=b->B-</option>
                            <option value=ab->AB-</option>
                            <option value=o->O-</option>
                        </select></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <% String g=r1.getString("gender");
                    if(g.equals("m"))
                    { %>
                    <td><input type="radio" name="gender" checked="checked" value="m" id="male"><label for="male">M</label></input><input type="radio" name="gender" value="f" id="female"><label for="female">F</label></input></td>
                <%  }
                    else
                    { %>
                    <td><input type="radio" name="gender" value="m" id="male"><label for="male">M</label></input><input type="radio" name="gender" checked="checked" value="f" id="female"><label for="female">F</label></input></td>
                    <% } %>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><input type="text" name="phone" value=<%=r1.getString("phone")%> size="50" /></td>
                </tr>
               <tr>
                    <td>Mail Id:</td>
                    <td><input type="text" name="mail_id" value=<%=r1.getString("mail_id")%> size="50" /></td>
               </tr>
                <%
                    r1=stat.executeQuery("select * from master_address where emp_id="+emp_id);r1.next();
                %>
                <tr>
                    <td>Dno:</td>
                    <td><input type="text" name="dno" value=<%=r1.getString("dno")%> size="50" /></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td><input type="text" name="city" value=<%=r1.getString("city")%> size="50" /></td>
                </tr>
                <tr>
                    <td>Street:</td>
                    <td><input type="text" name="street" value=<%=r1.getString("street")%> size="50" /></td>
                </tr>
                <tr>
                    <td>District:</td>
                    <td><input type="text" name="district" value=<%=r1.getString("district")%> size="50" /></td>
                </tr>
                <tr>
                    <td>Pincode:</td>
                    <td><input type="text" name="pincode" value=<%=r1.getString("pincode")%> size="50" /></td>
                </tr>
            </tbody>
        </table>
            <input type="submit" value="update" />
        </form>
    </body>
</html>
