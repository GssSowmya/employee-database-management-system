<%-- 
    Document   : testmail
    Created on : May 29, 2017, 8:17:50 AM
    Author     : SOWMMYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
String result;
// Recipient's email ID needs to be mentioned.
String to = "gsssowmya@gmail.com";
// Sender's email ID needs to be mentioned
String from = "gsssowmya@gmail.com";
// Assuming you are sending email from localhost
String host = "localhost";
// Get system properties object
Properties properties = System.getProperties();
// Setup mail server
properties.setProperty("mail.smtp.host", host);
// Get the default Session object.
Session mailSession = Session.getDefaultInstance(properties);
try{
// Create a default MimeMessage object.
MimeMessage message = new MimeMessage(mailSession);
out.println("hee");
// Set From: header field of the header.
message.setFrom(new InternetAddress(from));out.println("hee");
// Set To: header field of the header.
message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));out.println("hee");
// Set Subject: header field
message.setSubject("This is the Subject Line!");out.println("hee");
// Now set the actual message
message.setText("This is actual message");out.println("hee");
// Send message
Transport t = mailSession.getTransport("smtp");
        t.connect((String) properties.get("mail.smtp.user"), password);
        t.sendMessage(message, message.getAllRecipients());
        t.close();
//Transport.send(message);
out.println("hee");
result = "Sent message successfully....";
}catch (MessagingException mex) {
mex.printStackTrace();
result = "Error: unable to send message....";
}
%>
<html>
<head>
<title>Send Email using JSP</title>
</head>
<body>
<center>
<h1>Send Email using JSP</h1>
</center>
<p align="center">
<%
out.println("Result: " + result + "\n");
%>
</p>
</body>
</html>