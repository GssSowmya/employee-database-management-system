<%-- 
    Document   : edit_portal
    Created on : May 17, 2017, 7:05:28 PM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectjdbc.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit</title>
    </head>
    <body>
            <center>

    <%!
        int i,j;
        String l,k,emp_id,s,desg,sts,dtp;
    %>
    <%
        s=request.getParameter("shw");
        r1=stat.executeQuery("select * from change_appl");
        md=r1.getMetaData();
    %>
        <table border="1">
        <thead>
        <tr>
            <th><%=md.getColumnLabel(1) %></th>
            <th><%=md.getColumnLabel(2) %></th>
            <th><%=md.getColumnLabel(3) %></th>
            <th><%=md.getColumnLabel(4) %></th>
            <th><%=md.getColumnLabel(5) %></th>
            <th><%=md.getColumnLabel(6) %></th>
            <th><%=md.getColumnLabel(7) %></th>
            <th><%=md.getColumnLabel(8) %></th>
            <th><%=md.getColumnLabel(9) %></th>
            <th><%=md.getColumnLabel(10) %></th>
            <th><%=md.getColumnLabel(11) %></th>
            <th>STATUS</th>
        </tr>
        </thead>
        <tbody>
        <% while(r1.next())
            { %>
        <tr>
                <form action="application_change2.jsp">
            <td><input type="text" name="emp_id" value=<%=r1.getString(1) %> readonly="readonly" /></td>
            <td><%=r1.getString(2) %></td>
            <td><%=r1.getString(3) %></td>
            <td><%=r1.getString(4) %></td>
            <td><%=r1.getString(5) %></td>
            <td><%=r1.getString(6) %></td>
            <td><%=r1.getString(7) %></td>
            <td><%=r1.getString(8) %></td>
            <td><%=r1.getString(9) %></td>
            <td><%=r1.getString(10) %></td>
            <td><%=r1.getString(11) %></td>
            <td><input type="submit" value="Done & delete" name="done" /></td>
                </form>
        </tr>
        <%  } %>
        </tbody>
        </table>
        <form action="hr_home.jsp" >
            <input type="submit" value="back" name="Back" />
        </form>
        <h1>Edit portal</h1>
        <form action="edit_portal7.jsp" method="POST">
            <font>enter emp_id: </font>
            <input type="text" name="emp_id_in_edit" value="" />
            <p>
            <input type="submit"  value="show" />
        </form>
        <%
        if(s!=null)
        {
            emp_id=(String)request.getParameter("emp_id_in_edit");
            if(emp_id.equals(""))
            {
                %><h1>Please enter employee id!!!!</h1>
                <%
            }
            else
            {
                i=Integer.parseInt(emp_id);
                r1=stat.executeQuery("select * from emp_profile where emp_id="+i);
                if(!r1.next())
                {
                   %><h2>No Employee with that id!!!</h2><%
                }
                desg=r1.getString("desg_id");
                dtp=r1.getString("dept_id");
                sts=r1.getString("status");
    %>
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
                            <option visible="true" value=<%=r1.getString("bld_grp")%>><%=r1.getString("bld_grp")%></option>
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
                            <%
                                r1=stat.executeQuery("select dept_id,dept_name from master_dept");
                                while(r1.next())
                                {   l=r1.getString(1);
                                    k=r1.getString(2);
                                    if(!l.equals(dtp))
                                    {
                            %>
                                        <option value=<%=l%>><%=k%></option>
                                 <% }
                                    else
                                    {%>
                                        <option visible="true" value=<%=l%>>hh<%=k%></option>
                             <% } }%>
                        </select></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td><select name="status">
                            <%
                                r1=stat.executeQuery("select status,description from master_status");
                                while(r1.next())
                                {   l=""+r1.getString("status");
                                    k=""+r1.getString("description");
                                    if(l.equals(sts))
                                    {
                            %>
                                        <option visible="true" value=<%=l%>><%=k%></option>
                                 <% }
                                    else 
                                        {%>    
                                        <option value=<%=l%>><%=k%></option>
                            <%             }
                                } %>
                        </select></td>
                </tr>
                <tr>
                    <td>Designation:</td>
                    <td><select name="desgn_id">
                            <%
                                r1=stat.executeQuery("select * from master_desgn");
                                while(r1.next())
                                {   l=""+r1.getString(1);
                                    k=""+r1.getString(2);
                                    if(l.equals(desg))
                                    {
                            %>
                                        <option visible="true" value=<%=l%>><%=k%></option>
                            <%      }
                                    else %>
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
                <%     }
                      else
                       { %>
                    <td><input type="radio" name="role" value="5" id="hr"><label for="hr">HR</label></input><input type="radio" name="role" checked="checked" value="1" id="emp"><label for="emp">Employee</label></input></td>
                <%     } %>
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
                <%    
                    s="";
                        }
                        }
                %>
    </body>
</html>
