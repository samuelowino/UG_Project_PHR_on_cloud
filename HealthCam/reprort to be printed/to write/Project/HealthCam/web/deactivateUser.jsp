<%-- 
    Document   : activateUser
    Created on : Apr 26, 2014, 9:42:17 PM
    Author     : satya
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@ page import="databaseconnection.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
     String uidString = request.getParameter("uid");
     
        Connection con = databasecon.getconnection();
    
    PreparedStatement ps = con.prepareStatement("update log set userstate=0 where user = ?");
    ps.setString(1, uidString);
    ps.executeUpdate();
    request.getRequestDispatcher("/staUserManagement.jsp").forward(request, response);
    %>
