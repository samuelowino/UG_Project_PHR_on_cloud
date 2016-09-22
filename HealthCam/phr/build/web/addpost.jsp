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
	

var a=document.ff.postby.value;
var b=document.ff.pcom.value;

if(a=="")
	{
	alert("enter ur name");
	document.ff.postby.focus();
	return false;
	}
	
if(b=="")
{
alert("enter comments");
document.ff.pcom.focus();
return false;
}
	
}
</script>
</head>

<body>
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
			<li><a href="providerhome.jsp" title="Home" class="selectMenu">Provider</a></li>
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
	  <table width="950" align="center">
    <tr>
    
    <!-- left Side Menu -->
    
    
    <td width="300" valign="top">
    <fieldset>
    <table height="350">
    <tr>
    <td><form>
    &nbsp;&nbsp;<a href="providerhome.jsp"><font size="+1" color="green"><input type="image" src="images/forum.jpg" width="25" height="25" >&nbsp;&nbsp; Add Medical Details</font></a><br><br>
    &nbsp;&nbsp;<a href="pro_med_det.jsp"><font size="+1" color="red"><input type="image" src="images/icon-more.gif" width="25" height="25" >&nbsp;&nbsp;View Medical Details</font></a><br><br>
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
   
    <fieldset >
    
    <table height="350" align="center">
    <tr height="60">
     <td valign="top">
  <form name="ff" action="addpost1.jsp" method="post" onSubmit="return valid()">
  <fieldset>
  <legend class="paragraping">Post New Comments</legend>
  <table align="center" width="500"  bgcolor="#FFFFFF">


  <tr>
	<td height="35" colspan="2" align="center" bgcolor="#FFFFCC" class="paragraping">Related posts</td>
  </tr>
<tr>
<td width="231" height="44" class="paragraping">Id :</td>
<td width="408"><input type="text" name="mid" value="<%=request.getQueryString() %>" class="input1"></td>
</tr>
<tr>
<td width="231" height="44" class="paragraping">Posted By :</td>
<td width="408"><input type="text" name="postby" class="input1"></td>
</tr>
<tr>
<td width="231" height="44" class="paragraping">Description :</td>
<td width="408"><textarea name="pcom" cols="22" rows="5"></textarea></td>
</tr>


<tr>
<td height="40"></td>
<td><input type="submit" name="sub" value="Submit" id="button">&nbsp;&nbsp;<input type="reset" name="clear" value="Clear" id="button"></td>
</tr>		

<tr>
<td colspan="2" class="paragraping2" align="center"></td>
</tr> 
</table>
  </fieldset>
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
