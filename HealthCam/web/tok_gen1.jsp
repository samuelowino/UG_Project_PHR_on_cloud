<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.util.Random"%>
<%@ page import="java.security.SecureRandom"%>
<%!
   
	Random RANDOM = new SecureRandom();
	 public String gid()
  {
      // Pick from some letters that won't be easily mistaken for each
      // other. So, for example, omit o O and 0, 1 l and L.
      String letters = "ABCDEFGHJKMNPQRSTUVWXYZ23456789";

      String pw = "";
      for (int i=0; i<5; i++)
      {
          int index = (int)(RANDOM.nextDouble()*letters.length());
          pw += letters.substring(index, index+1);
      }
      return pw;
  }
	
	
%>
<%
String tid=request.getQueryString();
Connection con=null;
PreparedStatement psmt1=null;
String s=gid();

try{
con=databasecon.getconnection();
psmt1=con.prepareStatement("update token set token=AES_ENCRYPT(?, 'key') where tok_id='"+tid+"'");

psmt1.setString(1,s);
psmt1.executeUpdate();

response.sendRedirect("stahome.jsp");
}
catch(Exception ex)
{
out.println("Error in connection : "+ex);
}


%>

