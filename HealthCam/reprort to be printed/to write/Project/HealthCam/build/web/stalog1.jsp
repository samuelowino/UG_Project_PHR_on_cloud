<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%
String pass=null,uid=null;

String a = request.getParameter("user");
String b= request.getParameter("pass");

String name="sta";

try
{
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();

String sss1 = "select * from log where name='"+name+"'";

ResultSet rs1=st1.executeQuery(sss1);
while(rs1.next())
{
if((rs1.getString("user").equals(a)) && (rs1.getString("pass").equals(b)))
{
response.sendRedirect("stahome.jsp");
}
else
{
response.sendRedirect("stalog.jsp?message=fail");
}
}
} 
catch(Exception e1)
{
out.println(e1.getMessage());
}



%>