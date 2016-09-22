<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%
Connection con=null;
PreparedStatement psmt1=null;

String b = request.getParameter("name");
String age = request.getParameter("age");
String gen = request.getParameter("gen");
String c = request.getParameter("user");
String d = request.getParameter("pass");
String e = request.getParameter("email");
String f = request.getParameter("mobile");
String g = request.getParameter("date");


try{
con=databasecon.getconnection();


psmt1=con.prepareStatement("insert into signup(name,age,gen,user,pass,email,mobile,date) values(?,?,?,?,?,?,?,?)");

psmt1.setString(1,b);
psmt1.setString(2,age);
psmt1.setString(3,gen);
psmt1.setString(4,c);
psmt1.setString(5,d);
psmt1.setString(6,e);
psmt1.setString(7,f);
psmt1.setString(8,g);
psmt1.executeUpdate();
response.sendRedirect("user_reg.jsp?message=success");

}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}

%>

