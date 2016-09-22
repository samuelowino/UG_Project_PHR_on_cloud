<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<% 
String user=request.getParameter("user");
String pass=request.getParameter("pass");

    String nam=null,uid=null;
	//Connection con=null;
	//Statement st=null;
	//ResultSet rs=null;
	//String sql="select * from signup where user='"+user+"' AND pass='"+pass+"'";
        Connection con = databasecon.getconnection();
    int serviceid = 0;
    PreparedStatement ps1 = con.prepareStatement("select * from signup where user=? AND pass=?");
    ps1.setString(1, user);
    ps1.setString(2, pass);
    ResultSet rs = ps1.executeQuery();
    if(rs.next()){
                uid=rs.getString("uid");
		 nam=rs.getString("user");
		 session.setAttribute("nam",nam);
		 session.setAttribute("uid",uid);
		 response.sendRedirect("userhome.jsp"); 
    }
    else
    {
  	   response.sendRedirect("userlog.jsp?message=fail");
        }

		

	//	System.out.println(e1);

	

	 



            %>
