<%@ page import="java.sql.*,databaseconnection.*"%>
<%
Connection con=null;
PreparedStatement psmt1=null;

String tit=request.getParameter("tit");
String disc=request.getParameter("disc");
System.out.println(tit);
String [] title=tit.split(":");

try{
con=databasecon.getconnection();
psmt1=con.prepareStatement("insert into medication(tid,titname,minvalue,maxvalue,disc) values(AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'))");

psmt1.setString(1,"0");
psmt1.setString(2,title[1]);
psmt1.setString(3,"0");
psmt1.setString(4,"0");
psmt1.setString(5,disc);
psmt1.executeUpdate();

response.sendRedirect("providerhome.jsp?message=success");
}
catch(Exception ex)
{
out.println("Error in connection : "+ex);
}

%>

