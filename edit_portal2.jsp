<%-- 
    Document   : edit_portal2.jsp
    Created on : May 22, 2017, 11:25:57 AM
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
        %>
    <%
        emp_id=(String)request.getParameter("emp_id");
        int i=Integer.parseInt(emp_id);
        r1=stat.executeQuery("select * from emp_profile where emp_id="+i);
        r1.next();
    %>
    <body>
        <form action="edit_portal3.jsp" method="post" >
        <table border="0">
            <tbody>
                <tr>
                    <td>Emp_id:</td>
                    <td><input type="text" name="emp_id" size="50" readonly="readonly" value=<%=r1.getString("emp_id") %> /></td>
                </tr>
                <tr>
                    <td>Emp_name:</td>
                    <td><input type="text" name="emp_name" readonly="readonly" value=<%=r1.getString("emp_name")%> size="50" /></td>
                </tr>
                <tr>
                    <td>Date of birth:</td>
                    <td><input type="date" name="do_birth" readonly="readonly" value=<%=r1.getString("do_birth")%> size="50" /></td>
                </tr>
                <tr>
                    <td>Date of Join:</td>
                    <td><input type="date" name="do_join" readonly="readonly" value=<%=r1.getString("do_join")%> size="50" /></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><input type="text" name="phone" value=<%=r1.getString("phone")%> size="50" /></td>
                </tr>
                <tr>
                    <td>Mail Id:</td>
                    <td><input type="text" name="mail_id" value=<%=r1.getString("mail_id")%> size="50" /></td>
                </tr>
                <tr>
                    <td>Blood Group</td>
                    <td><select name="blood_grp">
                            <option value="" visible="true">---select---</option>
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
                    <% String g=r1.getString(7);
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
                    <td>Dept name</td>
                    <td><select name="dept_id">
                            <option value="" visible="true">---select---</option>
                            <%
                                r1=stat.executeQuery("select dept_id,dept_name from master_dept");
                                while(r1.next())
                                {   l=""+r1.getString(1);
                                    k=""+r1.getString(2);
                            %>
                            <option value=<%=l%>><%=k%></option>
                            <% } %>
                        </select></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td><select name="status">
                            <option value="" visible="true">---select---</option>
                            <%
                                r1=stat.executeQuery("select status,description from master_status");
                                while(r1.next())
                                {   l=""+r1.getString(1);
                                    k=""+r1.getString(2);
                            %>
                            <option value=<%=l%>><%=k%></option>
                            <% } %>
                        </select></td>
                </tr>
                <tr>
                    <td>Designation:</td>
                    <td><select name="desgn_id">
                            <option value="" visible="true">---select---</option>
                            <%
                                r1=stat.executeQuery("select * from master_desgn");
                                while(r1.next())
                                {   l=""+r1.getString(1);
                                    k=""+r1.getString(2);
                            %>
                            <option value=<%=l%>><%=k%></option>
                            <% } %>
                        </select></td>
                </tr>
                
                <%
                    r1=stat.executeQuery("select * from emp_auth where emp_id="+emp_id);r1.next();
                %>
                <tr>
                    <td>Role:</td>
                    <% if(r1.getString("role").equals("5"))
                    { %>
                    <td><input type="radio" name="role" checked="checked" value="5" id="hr"><label for="hr">HR</label></input><input type="radio" name="role" value="1" id="emp"><label for="emp">Employee</label></input></td>
                <% }
                    else
                    { %>
                    <td><input type="radio" name="role" value="5" id="hr"><label for="hr">HR</label></input><input type="radio" name="role" checked="checked" value="1" id="emp"><label for="emp">Employee</label></input></td>
                <% } %>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="pwd" value=<%=r1.getString("pwd")%> size="50" /></td>
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