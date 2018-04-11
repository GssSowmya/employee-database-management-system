<%-- 
    Document   : change_password
    Created on : Jun 14, 2017, 2:26:22 PM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <body>
            <center>
    <%
        String comment=request.getParameter("comment");
        if(comment!=null)
        {
            if(comment.equals("not_correct"))
            {
                out.println("<h4>Don't cheat me!!!! Wrong Password</h4>");
            }
            else if(comment.equals("not_match"))
            {
                out.println("<h4>Sorry dear...New Password and Confirm Password don't match!!!</h4>");
            }
            else if(comment.equals("logout"))
            {
                out.println("<h4>Please <a href=logout.jsp>logout</a> and login with new password!!</h4> ");
            }
        }
        %>
   

        <h3>Change Password</h3>
        <form action="change_password2.jsp" method="POST"  >
        <table border="0">
            <tr>
                <td>Enter Old Password: </td>
                <td><input type="password" name="opwd" value="" /></td>
            </tr>
            <tr>
                <td>Enter New Password: </td>
                <td><input type="password" name="npwd" value="" /></td>
            </tr>
            <tr>
                <td>Confirm Password: </td>
                <td><input type="password" name="cpwd" value="" /></td>
            </tr>
        </table>
            <input type="submit" value="Change" >
        </form>
    </body>
</html>
