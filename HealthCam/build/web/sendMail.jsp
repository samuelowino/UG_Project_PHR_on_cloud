<%-- 
    Document   : sendMail
    Created on : May 4, 2014, 1:05:19 PM
    Author     : saurav
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String useridString = request.getParameter("userid");
    String fileName = request.getParameter("fileName");
    String emailid = "";
    String key = "";
    Connection con = DbConnector.getConnection();
    PreparedStatement ps = con.prepareStatement("select * from user where userid=?");
    ps.setString(1, useridString);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
       emailid = rs.getString("emailid");
    }
    ps = con.prepareStatement("select * from upload where filename=?");
    ps.setString(1, fileName);
    ResultSet rs1 = ps.executeQuery();
    if(rs1.next()){
       key = rs1.getString("key_");
    }
    Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
        "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        // Assuming you are sending email from localhost


        Session session1 = Session.getInstance(props,
        new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("shivakumara.ckm@gmail.com","9481621425");
        }
        });

       // System.out.println("Message   " + msg);
        try {
            String userid="outsourcesim";
            String to=emailid;
            Message message = new MimeMessage(session1);
            message.setFrom(new InternetAddress(userid));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            message.setSubject("Encrypted Key");
            message.setText("The requested key for file named "+fileName+" is "+key);

            Transport.send(message);

            //System.out.println("Done");
           

        } catch (MessagingException e) {
            System.out.println("Mailing ERRRRRRRORRRRRR    " +e);
            
           // throw new RuntimeException(e);
        }
%>
