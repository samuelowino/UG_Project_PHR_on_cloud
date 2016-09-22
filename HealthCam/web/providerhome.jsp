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
var a=document.f.title.value;

if(a=="")
	{
	alert("enter Title Name");
	document.f.title.focus();
	return false;
	}
}

function valida()
{
	
	var a=document.ff.minvalue.value;

if((a=="") || (isNaN(a)))
	{
	alert("enter minimum in digits");
	document.ff.minvalue.focus();
	return false;
	}


var b=document.ff.maxvalue.value;

if((b=="") || (isNaN(b)))
	{
	alert("enter maxvalue in digits");
	document.ff.maxvalue.focus();
	return false;
	}

var c=document.ff.disc.value;

if(c=="")
	{
	alert("enter discription");
	document.ff.disc.focus();
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
	<table align="center">
	<tr>
    
    <!-- left Side Menu -->
    
    
    <td width="300" valign="top">
    <fieldset>
    <table height="350">
    <tr>
    <td><form>
    &nbsp;&nbsp;<a href="uploadDocForUser.jsp"><font size="+1" color="green"><input type="image" src="images/icon-more.gif" width="25" height="25" >&nbsp;&nbsp;Upload Documents Of User</font></a><br><br>
    &nbsp;&nbsp;<a href="providerhome.jsp"><font size="+1" color="red"><input type="image" src="images/forum.jpg" width="25" height="25" >&nbsp;&nbsp; Add Medical Details</font></a><br><br>
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
      
    <td width="650" align="center" >

    <fieldset >
    <table height="350">
    
  <!--  Add new Title Row -->
   
  <tr>
  <td valign="top">
  <form name="f" action="addtitle.jsp" method="post" onSubmit="return valid()">
  <fieldset>
  <legend class="paragraping">Add New Title</legend>
  <table align="center" height="70" width="500" style="border:2px solid #ddd;" bgcolor="#FFFFFF">
  <tr>
  <td align="center" class="paragraping">New Title :</td>
  <td align="center"><input type="text" name="title" class="input1"></td>
  <td><input type="submit" name="Term" value="Add" id="button"></td>
  </tr>
</table>
</fieldset>
</form>
 </td>
  </tr>	
  <!--  Add new Title Row  end-->
   
  
   <!--  Add medication  row -->
   <tr>
  <td valign="top">
  <form name="ff" action="addmedic.jsp" method="post" onSubmit="return valida()">
  <fieldset>
  <legend class="paragraping">Add Medication</legend>
  <table align="center" width="500"  bgcolor="#FFFFFF">


<tr>
	<td height="35" colspan="2" align="center" bgcolor="#FFFFCC" class="paragraping">Add medication Details Here</td>
</tr>
<tr>
<td width="231" height="44" class="paragraping">Title :</td>
<td width="408"><select name="tit" class="input1">

<%
Connection con=null;
PreparedStatement psmt1=null;
ResultSet rs=null;
String name = request.getParameter("title");
try{
con=databasecon.getconnection();
psmt1=con.prepareStatement("select * from newtitle");
rs=psmt1.executeQuery();
while(rs.next())
{
%>
<option value="<%=rs.getString("tid")+":"+rs.getString("titname")%>"><%=rs.getString("titname")%></option>
<%
}
}
catch(Exception ex)
{
out.println("Error in connection : "+ex);
}

%>

</select></td>
</tr>
<tr>
<td width="231" height="44" class="paragraping">Min Value :</td>
<td width="408"><input type="text" name="minvalue"  class="input1"></td>
</tr>
<tr>
<td width="231" height="44" class="paragraping">Max Value :</td>
<td width="408"><input type="text" name="maxvalue" class="input1"></td>
</tr>
<tr>
<td width="231" height="44" class="paragraping">Description :</td>
<td width="408"><textarea name="disc" cols="22" rows="5"></textarea></td>
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
  <!--  Add medication Row  end-->
  
     <tr>
  <td valign="top">
  <form name="ff" action="addmedicGenaralSearch.jsp" method="post" onSubmit="return valida()">
  <fieldset>
  <legend class="paragraping">Add Medication For General Search</legend>
  <table align="center" width="500"  bgcolor="#FFFFFF">


<tr>
	<td height="35" colspan="2" align="center" bgcolor="#FFFFCC" class="paragraping">Add medication Details Here</td>
</tr>
<tr>
<td width="231" height="44" class="paragraping">Title :</td>
<td width="408"><select name="tit" class="input1">

<%
con=null;
psmt1=null;
rs=null;
name = request.getParameter("title");
try{
con=databasecon.getconnection();
psmt1=con.prepareStatement("select * from newtitle");
rs=psmt1.executeQuery();
while(rs.next())
{
%>
<option value="<%=rs.getString("tid")+":"+rs.getString("titname")%>"><%=rs.getString("titname")%></option>
<%
}
}
catch(Exception ex)
{
out.println("Error in connection : "+ex);
}

%>

</select></td>
</tr>
<tr>
<td width="231" height="44" class="paragraping">Description :</td>
<td width="408"><textarea name="disc" cols="22" rows="5"></textarea></td>
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
