<%-- 
    Document   : addphoto
    Created on : Jun 4, 2017, 10:33:51 PM
    Author     : SOWMMYA
--%>
<%@page import="java.io.*,org.apache.commons.fileupload.disk.DiskFileItemFactory,org.apache.commons.fileupload.servlet.ServletFileUpload,org.apache.commons.fileupload.disk.DiskFileItem,org.apache.commons.io.*" %>
<%@page import="java.util.*,org.apache.commons.fileupload.FileItem" %>
<%@include file="connectjdbc.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload sfu  = new ServletFileUpload(factory);

            if (! ServletFileUpload.isMultipartContent(request)) {
                System.out.println("sorry. No file uploaded");
                return;
            }

            // parse request
            List items = sfu.parseRequest(request);
            FileItem  id = (FileItem) items.get(0);
            String photoid =  id.getString();       
            FileItem file = (FileItem) items.get(1);
            int i=Integer.parseInt((String)session.getAttribute("puid"));
            if(!photoid.equals((String)session.getAttribute("puid")))
            {
%><jsp:forward page="change_photo.jsp?comment=not_match" ></jsp:forward><%
            }
            r1=stat.executeQuery("select * from photos where id="+photoid);
            if(r1.next())
            {
                pre=con.prepareStatement("update photos set photo=? where id="+photoid);
                pre.setBinaryStream(1,file.getInputStream(),(int) file.getSize());
            }
            else
            {
                pre = con.prepareStatement("insert into photos values(?,?)");
            
            pre.setString(1,photoid);
            //pre.setString(2, phototitle);
            // size must be converted to int otherwise it results in error
            pre.setBinaryStream(2,file.getInputStream(),(int) file.getSize());
            }
            pre.executeUpdate();
            if(((String)session.getAttribute("prole")).equals("5"))
{        
%><jsp:forward page="hr_home.jsp"></jsp:forward>
<%}
else
{%>
<jsp:forward page="emp_home.jsp"></jsp:forward>
<% } %>
