<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.util.Random"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.util.*"%>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>


<%
java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "dd/MM/yyyy hh:mm:ss";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now);

String uid=(String)session.getAttribute("uid");
String nam=(String)session.getAttribute("nam");
String users = (String)request.getParameter("usersGeneral");
String qry = request.getParameter("query");



Connection con=null;
PreparedStatement psmt1=null;
String s="pending";

try{
con=databasecon.getconnection();
psmt1=con.prepareStatement("insert into token(uid,name,token,query,qdate,provideruser,tokentype) values(AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'),?,?)");

psmt1.setString(1,uid);
psmt1.setString(2,nam);
psmt1.setString(3,s);
psmt1.setString(4,qry);
psmt1.setString(5,strDateNew1);
psmt1.setString(6,users);
psmt1.setInt(7,1);
psmt1.executeUpdate();

response.sendRedirect("userhome.jsp?message=success");
}
catch(Exception ex)
{
out.println("Error in connection : "+ex);
}


%>

