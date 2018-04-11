<%-- 
    Document   : testem
    Created on : Jun 5, 2017, 1:36:06 PM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>mail</title>
    </head>
    <body>
        <h1>feedback</h1>
        <form action="maildispatcher" method="POST">
            <table>
                <tr>
                    <td>to:</td>
                    <td><input type="text" name="toemail" size="50"></td>
                </tr>
                <tr>
                    <td>subject:</td>
                    <td><input type="text" name="subject" size="50"></td>
                </tr>
                <tr>
                    <td>message</td>
                    <td><textarea name="msg" cols="50" rows="5"></textarea></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" ></td>
                </tr>
            </table>
        </form>
    </body>
</html>
