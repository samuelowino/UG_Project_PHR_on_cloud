<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CAM</title>
<link href="style1.css" rel="stylesheet" type="text/css" />


<style type="text/css">

.style1 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 12px;
}

#bb:hover
{
text-decoration: underline;
}

fieldset
{
border-color: maroon;
border-radius: 5px;
border-size: 1px;  	
}



</style>
<script type="text/javascript">
function valid()
{
	var a= document.f.query.value;
	if(a=="")
		{
		alert("enter Query");
		document.f.query.focus();
		return false;
		}
		
}

</script>


</head>

<body>
<%
String uid=(String)session.getAttribute("uid");
String name=(String)session.getAttribute("nam");
%>

<!--Header Background Part Starts -->
<div id="header-bg">
	<!--Header Contant Part Starts -->
	<div id="header">
		<a href="#" class="style1"><font size="+3"><center>Secure sharing and storage of Personal Health Records<br />System</center></font></a>
		<!--Login Background Starts -->
		
		<!--Login Background Ends -->
		<br class="spacer" />
  </div>
	<!--Header Contant Part Ends -->
</div>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<div id="navigation-bg">
	<!--Navigation Part Starts -->
	<div id="navigation">
		<ul class="mainMenu">
			<li><a href="userhome.jsp" title="Home" class="selectMenu">User</a></li>
			<li><a href="index.jsp" >Logout</a></li>
		<!--	<li><a href="query.jsp">Query</a></li>
			<li><a href="sprofile.jsp">Search profile</a></li>
			<li><a href="myprofile.jsp">My Profile</a></li>
			<li><a href="palert.jsp" class="selectMenu">Privacy Alert</a></li>-->
		</ul>
		
		</div>
	<!--Navigation Part Ends -->
</div>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg">
	<!--Our Company Part Starts -->
	<div id="ourCompany-part">
	<table align="center">
	<tr>
    
    <!-- left Side Menu -->
    
    <td width="300" valign="top">
    <fieldset>
    <table height="350">
    <tr>
    <td><form>
    &nbsp;&nbsp;<a href="userhome.jsp"><font size="+1" color="red"><input type="image" src="images/forum.jpg" width="25" height="25" >&nbsp;&nbsp; Query</font></a><br><br>
    &nbsp;&nbsp;<a href="qresult.jsp"><font size="+1" color="green"><input type="image" src="images/icon-more.gif" width="25" height="25" >&nbsp;&nbsp;Query Result</font></a><br><br>
     &nbsp;&nbsp;<a href="index.jsp" ><font size="+1" color="green"><input type="image" src="images/login1.png" width="25" height="25" >&nbsp;&nbsp;Logout</font></a><br><br>
             <a href="myProfile.jsp" >My Info</a>  <br/>
    <a href="myDocuments.jsp" >My Documents</a>    
    </form>
    </td>
    </tr>
    </table>
    </fieldset>
     </td>
    
     
     <!-- left Side Menu End-->
     
     <!--  Gap -->
     
     <td width="10"></td>
     
     <!--  Gap -->
     
      <!-- rigth Side content -->
      
    <td width="650" align="center" >
   <fieldset>
   <table height="250">
  <span class="paragraping1"><strong> Welcome : </strong><font size="+1" color="#FF3300"><%=name%></font></span>
  <!--  Add new Title Row -->
   <br><br><br><br><br>
  <tr>
  <td valign="top">
  <form name="f" action="search.jsp" method="post" onSubmit="return valid()">
 
  <table align="center" height="150" width="500" style="border:2px solid gray;" bgcolor="#FFFFFF">
  <tr>
  <td align="center" class="paragraping"><strong>Query :</strong></td>
  <td align="center"><input type="text" name="query" class="input1"></td>
  <td><input type="submit" name="Term" value="Search" id="button"></td>
  </tr>
<tr>
<td class="paragraping" colspan="3" align="center"><font size="2"><b><%
							String message=request.getParameter("message");
							if(message!=null && message.equalsIgnoreCase("success"))
							{
								out.println("<font color='green'><blink>Query Successfully Registered...</blink></font>");
							}
						%></b></font></td>
</tr>
 <tr>
  <td colspan="3" align="center" class="paragraping">
      Select Doctor for sending Query:<select name="users">
           <option value="All">All</option>
            <% 
        Connection con = databasecon.getconnection();
    
    PreparedStatement ps = con.prepareStatement("select * from log where user !=?");
    ps.setString(1, "sta");
    ResultSet rs = ps.executeQuery();
     while(rs.next()){
    %>
    <option value="<%=rs.getString("user")%>"><%=rs.getString("user")%></option>
    <%}%>
    </select>
  </td>
  </tr>
  <tr>
  <td colspan="3" align="center" class="paragraping"><font color="red">EX : systolic bp:100,missed medication:2</font></td>
  </tr>
  <tr>
  <td colspan="2" align="center"> 
  
  </td>
  </tr>
</table>

</form>
 </td>
    
  </tr>	
    <!-- Start something for normal user-->
    <tr>
  <td valign="top">
  <form name="f" action="generalSearch.jsp" method="post" onSubmit="return valid()">
 
  <table align="center" height="150" width="500" style="border:2px solid gray;" bgcolor="#FFFFFF">
  <tr>
  <td align="center" class="paragraping"><strong>General Query :</strong></td>
  <td align="center"><input type="text" name="query" class="input1"></td>
  <td><input type="submit" name="Term" value="Search" id="button"></td>
  </tr>
<tr>
<td class="paragraping" colspan="3" align="center"><font size="2"><b><%
							String message1=request.getParameter("message");
							if(message1!=null && message1.equalsIgnoreCase("success"))
							{
								out.println("<font color='green'><blink>Query Successfully Registered...</blink></font>");
							}
						%></b></font></td>
</tr>
 <tr>
  <td colspan="3" align="center" class="paragraping">
      Select Doctor for sending Query:<select name="usersGeneral">
           <option value="All">All</option>
            <% 
        con = databasecon.getconnection();
    
   ps = con.prepareStatement("select * from log where user !=?");
    ps.setString(1, "sta");
    rs = ps.executeQuery();
     while(rs.next()){
    %>
    <option value="<%=rs.getString("user")%>"><%=rs.getString("user")%></option>
    <%}%>
    </select>
  </td>
  </tr>
  <tr>
  <td colspan="3" align="center" class="paragraping"></td>
  </tr>
  <tr>
  <td colspan="2" align="center"> 
  
  </td>
  </tr>
</table>

</form>
 </td>
    
  </tr>	
    </table>
    </fieldset>
    </td>
    
    
    <!-- rigth Side content end -->
    
    
    </tr>
		</table>
		
	</div>
	<!--Our Company Part Ends -->
</div>
<!--Our Company Bacground Part Ends -->
<!--Future Plans Part Starts -->
<div id="futurePlan-bg">
	<!--Future Plans Contant Part Starts -->
	
	<!--Future Plans Contant Part Ends -->
</div>
</body>
</html>
