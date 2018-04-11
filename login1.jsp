<%-- 
    Document   : login
    Created on : May 14, 2017, 7:33:54 PM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    
    <body bgcolor="orange">
    <center>
        <%
    String s=request.getParameter("ad");
    if(s!=null)
    {
        if(s.equals("invalid"))
        {
            s="";
%><h1><font color=red>Invalid credentials</font></h1><%
        }
    }
    %>
    <h1>login page</h1>
        <form name="log" action="login2.jsp" method="POST">
            <table border="0" cellspacing="2" cellpadding="4" bgcolor="red">
                <thead>
                    <tr>Enter login credentials</tr>
                </thead>
                <tbody>
                    <tr>
                        <td>User id: </td>
                        <td><input type="text" name="uid" value="" placeholder="emp_id" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Password :</td>
                        <td><input type="password" name="pwd" value="" placeholder="password" size="50" /></td>
                    </tr>
                </tbody>
            </table>
            <center>
                <input type="button" onclick="check1(this.form)" value="login" name="log" />
            </center>
        </form>
    <a href="forgot.jsp">Forgot Password</a>
    </center>
    <script src="validation.js">
  </script>
    </body></head>
</html>