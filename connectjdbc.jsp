<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<%!
           Statement stat;
           Connection con;
           ResultSet r1;
           ResultSetMetaData md;
           PreparedStatement pre;
%>
        <%
           try
           {
               Class.forName("oracle.jdbc.driver.OracleDriver");
               con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sowmya","gss");
               stat=con.createStatement();
           }
           catch(Exception e){};
            %>
    </head>
    <body>

    </body>
</html>