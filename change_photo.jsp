<%-- 
    Document   : change_photo
    Created on : Jun 14, 2017, 3:39:03 PM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,org.apache.commons.fileupload.disk.DiskFileItemFactory,org.apache.commons.fileupload.servlet.ServletFileUpload,org.apache.commons.fileupload.disk.DiskFileItem,org.apache.commons.io.*" %>
<%@page import="java.util.*,org.apache.commons.fileupload.FileItem" %>
<%@include file="connectjdbc.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>change Photo</title>
    </head>
    <body>
            <center>

        <%
            String comment=request.getParameter("comment");
            if(comment!=null)
            {
                out.println("<h2>enter <b>YOUR</b> employee number </h2>");
            }%>
        <h2>Change Photo</h2>
        <form enctype="multipart/form-data" action="addphoto.jsp" method="post">
            <table>
                <tr>
                    <td>Enter Employee Id:</td>
                    <td><input type="text" name="id" /></td>
                </tr>
                <tr>
                    <td>Select Photo  </td>
                    <td><input type="file"  name="photo"/>
                </tr>
            </table>
            <p>
            <input type="submit" value="Upload" name="change" />
            <p>
           <% if(((String)session.getAttribute("prole")).equals("5"))
{        
           %><a href="hr_home.jsp">Back</>
<%}
else
{%>
<a href="emp_home.jsp">Back</>
<% } %>
        </form>
        <p/>
    </body>
</html>