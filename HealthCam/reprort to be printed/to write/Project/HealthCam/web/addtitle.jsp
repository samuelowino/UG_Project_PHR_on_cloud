<%@ page import="java.sql.*,databaseconnection.*"%>
<%
Connection con=null;
PreparedStatement psmt1=null;

String name = request.getParameter("title");


try{
con=databasecon.getconnection();
psmt1=con.prepareStatement("insert into newtitle(titname) values(?)");

psmt1.setString(1,name);
psmt1.executeUpdate();

response.sendRedirect("providerhome.jsp");
}
catch(Exception ex)
{
out.println("Error in connection : "+ex);
}

%>

