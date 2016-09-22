

<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <% 
        Connection con = DbConnector.getConnection();
    String fileName = request.getParameter("fileName");
    PreparedStatement ps = con.prepareStatement("insert into keyrequest values(?,?,?)");
    ps.setString(1, (String)session.getAttribute("userid"));
    ps.setString(2,fileName);
    ps.setInt(3,0);
    ps.execute();
    response.sendRedirect("ActuaryHome.jsp");
    %>