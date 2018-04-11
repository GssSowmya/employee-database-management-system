<%-- 
    Document   : security_question
    Created on : Jul 1, 2017, 3:51:42 PM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectjdbc.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%!
            int i;
            String l,k;
            %>
    </head>
    <body>
            <center>
        <h1>Security Question</h1>
        <form action="security_question2.jsp" method="POST">
        
        <table border="0">
            <tbody>
                <tr>
                    <% 
                        r1=stat.executeQuery("select * from master_question");
                        
                        %>
                    <td>Question:</td>
                    <td><select name="qid">
                            <% while(r1.next())
                            {
                                l=""+r1.getString("question");
                                k=""+r1.getString("question_id"); %>
                                <option value=<%=k%>><%=l%></option> <%
                            } %>
                        </select></td>
                </tr>
                <tr>
                    <td>Answer: </td>
                    <td><input type="text" name="answer" value="" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="ok" /></td>
                    </form>
                            <% if((String)session.getAttribute("prole")=="1"){
                                %>
                                <form action="emp_home.jsp" method="post">
                                    <td><input type="submit" value="back" /></td></form>
                                <% }
                                else
                                {   %>
                                <form action="hr_home.jsp" method="post">
                                    <td><input type="submit" value="back" /></td></form>
                                <% } %>
                </tr>
            </tbody>
        </table>
    </body>
</html>
