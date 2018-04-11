<%-- 
    Document   : forgot
    Created on : Jun 14, 2017, 3:33:44 PM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectjdbc.jsp" %>
<!DOCTYPE html>
<%!
    String s,k,answer;
    int qid;
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        s=request.getParameter("empid");
        k=request.getParameter("ans");
    %>
    
    <body>
            <center>
        <form action="forgot.jsp" method="POST" >
        <table border="0">
            <tbody>
                <tr>
                    <td>Enter employee id:</td>
                    <td><input type="text" name="empid" value=<%=s%> /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="submit" /></td>
                </tr>
                </tbody>
                </table>
                <%
                    if(s!=null)
                    {       
                        r1=stat.executeQuery("select * from forgot_pwd where emp_id="+Integer.parseInt(s));
                        r1.next();
                        answer=r1.getString("answer");
                        qid=Integer.parseInt(r1.getString("question_id"));
                        r1=stat.executeQuery("select * from master_question where question_id="+qid);
                        r1.next();
                    %>
                    <h1><%=r1.getString("question")%></h1><p>
                        <input type="text" name="ans" value="" />
                        <input type="submit" value="ok" />
                        <%
                            if(k!=null)
                            {
                                if(k.equals(answer))
                                {
                                    stat.executeUpdate("update emp_auth set pwd='"+s+"' where emp_id="+s);
                                    %>
                                    <h1>Your Password is your employee number</h1><%
                                }
                                else
                                {%>
                                    <h1>You forgot the answer...Contact your dept</h1> 
                              <% }
                            }
                            else
                            {%>
                                <h1>Enter the answer</h1> 
                         <% }
                    }%>     
        </form>
      &nbsp;&nbsp;&nbsp;&nbsp;<form action="login1.jsp?ad="><input type="submit" value="back" /></form>
    </body>
</html>