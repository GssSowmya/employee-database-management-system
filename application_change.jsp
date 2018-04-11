<%-- 
    Document   : application_change
    Created on : Jun 13, 2017, 12:27:20 PM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectjdbc.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            r1=stat.executeQuery("select * from change_appl");
            md=r1.getMetaData();
        %>
        </head>
    <body>
    <center>
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
<th>Status</th>
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
<td><input type="submit" value="done" name="Done & delete" /></td>
</form>
</tr>
<%  } %>
</tbody>
</table>
<form action="hr_home.jsp" >
<input type="submit" value="back" name="Back" />
</form>
    </body>
</html>
