<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%
Connection con=null;
PreparedStatement psmt1=null;
java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "dd/MM/yyyy hh:mm:ss";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now);

String mid = request.getParameter("mid");
String pby = request.getParameter("postby");
String pcom = request.getParameter("pcom");


try{
con=databasecon.getconnection();


psmt1=con.prepareStatement("insert into relatedposts(mid,postby,comments,date) values(AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'))");

psmt1.setString(1,mid);
psmt1.setString(2,pby);
psmt1.setString(3,pcom);
psmt1.setString(4,strDateNew1);
psmt1.executeUpdate();
response.sendRedirect("pro_med_det.jsp");

}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}

%>

