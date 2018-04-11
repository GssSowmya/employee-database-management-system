<%-- 
    Document   : edit_portal01.jsp
    Created on : May 22, 2017, 12:26:40 PM
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
        String emp_id,vale,l,k;
        int i,j;
        %>
    <body>
        <form action="edit_portal3.jsp" method="post">
        <%
        emp_id=request.getParameter("emp_id");
        vale=request.getParameter("vale");
        if(vale.equals("address"))
        {
            r1=stat.executeQuery("select * from master_address where emp_id="+emp_id);
            md=r1.getMetaData();
            j=md.getColumnCount();
            %>
            <table border="0" >
                <% for(i=2;i<=j;i++)
                {%>
                <tr>
                    <td><%=md.getColumnLabel(i) %></td>
                    <td><input type="text" name=<%=md.getColumnLabel(i)%></td>
                </tr>
                <% } %>
            </table>
     <% }
        else if(vale.equals("pwd")||vale.equals("role"))
        {
            r1=stat.executeQuery("select * from emp_auth where emp_id="+emp_id);
            md=r1.getMetaData();
     %>
        <table border="0">
                <tr>
                    <td><%=md.getColumnLabel(1) %></td>
                    <td><input type="text" name=<%=md.getColumnLabel(1)%></td>
                </tr>
        </table>
     <%
        }
        else
        {
            r1=stat.executeQuery("select * from emp_profile where emp_id="+emp_id);
            md=r1.getMetaData();
            r1.next();
            j=md.getColumnCount();
            for(i=1;!(md.getColumnLabel(i).equals(vale))&&i<=j;i++);
%><table border="0"><%
            if(vale.equals("dept_id"))
            {%>
            <table border="0">
            <tr>
                <td>Dept Id:</td>
                <td><select name="dept_id">
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
            </table>
            <%}
            else if(vale.equals("do_birth"))
                {%>
            <tr>
                    <td>Date of birth</td>
                    <td><input type="date" name="do_birth" value="" /></td>
            </tr><%}
            else if(vale.equals("do_join"))
                {%>
            <tr>
                    <td>Date of joining</td>
                    <td><input type="date" name="do_join" value="" /></td>
            </tr><%}
            else if(vale.equals("blood_grp"))
                 {%>
            <tr>
                    <td>blood group</td>
                    <td><select name="blood_grp">
                            <option value="a+">a+</option>
                            <option value="a-">a-</option>
                            <option value="b+">b+</option>
                            <option value="b-">b-</option>
                            <option value="ab+">ab+</option>
                            <option value="ab-">ab-</option>
                            <option value="o+">o+</option>
                            <option value="o-">o-</option>
                        </select></td>
            </tr><% }
            else if(vale.equals("status"))
                {%>
            <tr>
                <td>status</td>
                <td><select name="status">
                  <%
                    r1=stat.executeQuery("select * from master_status");
                    while(r1.next())
                    {   l=""+r1.getString(1);
                        k=""+r1.getString(2);
                  %>
                    <option value=<%=l%>><%=k%></option>
                 <% } %>
                    </select></td>
            </tr>
                <% }
            else if(vale.equals("gender"))
                   {%>
            <tr>
                <td>gender</td>
                <td><input type="radio" name="gender" value="m">M</input><input type="radio" name="gender" value="f">F</input></td>
            </tr><% }
            else if(vale.equals("desgn_id"))
            {%>
            <tr>
                    <td>designation:</td>
                    <td><select name="desgn_id">
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
            <% }
            else
            { %>
                <table border="0">
            <tr>
                <td><%=md.getColumnLabel(i)%></td>
                <td><input type="text" name=<%=md.getColumnLabel(i)%></td>
            </tr>
            <tr>
            <% } %>
    </table><%}%>
    </form>
    </body>
</html>
