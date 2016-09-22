<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%
Connection con=null;
PreparedStatement psmt1=null;

String b = request.getParameter("name");
String c = request.getParameter("user");
String d = request.getParameter("pass");
String e = request.getParameter("email");
String f = request.getParameter("mobile");


try{
con=databasecon.getconnection();


psmt1=con.prepareStatement("insert into log values(?,?,?,?,?,?)");

psmt1.setString(1,b);
psmt1.setString(2,c);
psmt1.setString(3,d);
psmt1.setInt(4,0);
psmt1.setString(5,e);
psmt1.setString(6,f);
psmt1.executeUpdate();
response.sendRedirect("provider_reg.jsp?message=success");

}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}

%>

