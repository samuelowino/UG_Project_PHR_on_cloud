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



.style2 {color: #FF0000}
</style>

</head>

<body>
<!--Header Background Part Starts -->
<div id="header-bg">
	<!--Header Contant Part Starts -->
	<div id="header">
		<a href="#" class="style1"><font size="+3"><center>CAM: Cloud-Assisted Privacy Preserving Mobile Health <br />Monitoring</center></font></a>
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
			<li><a href="stahome.jsp" title="Home" class="selectMenu">STA</a></li>
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
    &nbsp;&nbsp;<a href="stahome.jsp"><font size="+1" color="red"><input type="image" src="images/forum.jpg" width="25" height="25" >&nbsp;&nbsp; Token Generation</font></a><br><br>
    &nbsp;&nbsp;<a href="pro_med_det.jsp"><font size="+1" color="green"><input type="image" src="images/icon-more.gif" width="25" height="25" >&nbsp;&nbsp;View Medical Details</font></a><br><br>
    &nbsp;&nbsp;<a href="pro_user_ser.jsp"><font size="+1" color="green"><input type="image" src="images/search.png" width="25" height="25" >&nbsp;&nbsp;User Search</font></a><br><br>
    &nbsp;&nbsp;<a href="pro_user_det.jsp" ><font size="+1" color="green"><input type="image" src="images/mini_icon1.gif" width="25" height="25" >&nbsp;&nbsp;User Details</font></a><br><br>
    &nbsp;&nbsp;<a href="index.jsp" ><font size="+1" color="green"><input type="image" src="images/login1.png" width="25" height="25" >&nbsp;&nbsp;Logout</font></a><br><br>
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
      
   <td width="650">
    <div id="user_detail">
    <fieldset >
    
    <table height="350" align="center">
	 <tr>
    <td width="205" style="border:1px solid #DDD;" valign="top"> 
    <table align="center" width="400" style="border:1px solid #326363;" bgcolor="#FFFFFF">
    <tr bgcolor="orange">
	 <td width="200" class="paragraping2">Attribute Name</td>
	 <td width="200" class="paragraping2">Values</td>
	 </tr>
	 
	  	 
<%
Connection con=null;
PreparedStatement psmt1=null;
ResultSet rs=null;
String s = request.getQueryString();

try{
con=databasecon.getconnection();
psmt1=con.prepareStatement("select AES_DECRYPT(uid,'key'),name,AES_DECRYPT(token,'key'),AES_DECRYPT(query,'key'),AES_DECRYPT(qdate,'key') from token where tok_id='"+s+"'");
rs=psmt1.executeQuery();
if(rs.next())
{
//String q=rs.getString(4);
//String qq[]=q.split(",");
//for(int t=0;t<qq.length;t++)
//{
//String qqq[]=qq[t].split(":");
%>



<%
}
%>
<tr>
 	<td colspan="2" align="center" class="paragraping">Token Generated :<font color="#FF0000" size="+1"><%=rs.getString(3)%></font></td>
</tr>
<tr>
 	<td colspan="2" align="center" class="paragraping"><a href="tok_gen1.jsp?<%=s%>" id="button">Generate & Send</a></td>
</tr>	

<%
//}
}
catch(Exception ex)
{
out.println("Error in connection : "+ex);
}

%>

   
      
     

</table>
   
    </table>
    </fieldset>
  
    </div>
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
