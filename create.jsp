<%-- 
    Document   : create
    Created on : May 17, 2017, 8:53:09 PM
    Author     : SOWMMYA
--%>
<%@include file="connectjdbc.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    int i,j;
    String l,k;
    %>
<%
    //r1=stat.executeQuery("select emp_id_gen_prof.currval from dual");
    //r1.next();
    //String s=r1.getString(1)+1;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>employee creation</title>
        
    <body>
    <center>
        <form action="create_insert.jsp" method="POST">
        <h1>enter details</h1>
        <table border="0">
            <tbody>
                <tr>
                    <td>Emp.ID: </td>
                    <td><input type="text" name="emp_id" value="will be automatically assigned" readonly="readonly" enabled="false" size="50" /></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="pwd" value="it is employee id" size="50" /></td>
                </tr>
                <tr>
                    <td>Emp Name</td>
                    <td><input type="text" name="emp_name" value="" size="50" /></td>
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
                    <td>Date of birth</td>
                    <td><input type="date" name="do_birth" value="" /></td>
                </tr>
                <tr>
                    <td>Date of joining</td>
                    <td><input type="date" name="do_join" value="" /></td>
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
                    <td><input type="radio" name="gender" value="m" id="male"><label for="male">M</label></input><input type="radio" name="gender" value="f" id="female"><label for="female">F</label></input></td>
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
                <tr>
                    <td>Phone</td>
                    <td><input type="text" name="phone" value="" size="50" /></td>
                </tr>
                <tr>
                    <td>Mail_id</td>
                    <td><input type="text" name="mail_id" value="" size="50" /></td>
                </tr>
                <tr>
                    <td>Dno:</td>
                    <td><input type="text" name="dno" value="" size="50" /></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><input type="text" name="city" value="" size="50" /></td>
                </tr>
                <tr>
                    <td>Street</td>
                    <td><input type="text" name="street" value="" size="50" /></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><input type="text" name="district" value="" size="50" /></td>
                </tr>
                <tr>
                    <td>Pincode</td>
                    <td><input type="text" name="pincode" value="" size="50" /></td>
                </tr>
            </tbody>
        </table>
       <input type="submit" value="create"  name="Create" />  
       <p>
       <input type="reset" value="Reset" />
       <p>
       
    </form>
                        <form action="hr_home.jsp" >
            <input type="submit" value="Back" />
        </form>
     </center>                   
    </body>
    </head>
</html>
