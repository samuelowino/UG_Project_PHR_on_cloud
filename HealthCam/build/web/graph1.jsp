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
	var a= document.f.tok.value;
	if(a=="")
		{
		alert("Enter Token");
		document.f.tok.focus();
		return false;
		}
		
}

</script>


</head>

<body>
<%
String ttname=(String)session.getAttribute("ttname");
String discrip=(String)session.getAttribute("discrip");
int gid=(Integer)session.getAttribute("gid");
%>

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
    &nbsp;&nbsp;<a href="userhome.jsp"><font size="+1" color="green"><input type="image" src="images/forum.jpg" width="25" height="25" >&nbsp;&nbsp; Query</font></a><br><br>
    &nbsp;&nbsp;<a href="qresult.jsp"><font size="+1" color="red"><input type="image" src="images/icon-more.gif" width="25" height="25" >&nbsp;&nbsp;Query Result</font></a><br><br>
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
    <span class="paragraping1" style="background:#CCFF33"><strong> Graph : </strong></span>
    <table height="350" align="center">
    <tr>
	<td class="paragraping1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Attribute Name : <font color="#660066" size="+1"><%=ttname%></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Discription : <font color="#660066" size="+1"><%=discrip%> </font></strong></td>
	</tr>
	<tr>
	<td align="center"><img src="images/logotype.jpg"  height="270" width="350"/></td>
	</tr>
	<tr>
	<td align="right" class="paragraping1"><a href="graph.jsp?<%=gid%>"><strong><font color="#FF0000" style="text-decoration:underline" size="+1">Next...</font></strong></a></td>
	</tr>
	</table>
    </fieldset>
  
    </div>
    </td>
    
    <!-- rigth Side content end -->
    
    
    </tr>
		</table>
		
	
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
