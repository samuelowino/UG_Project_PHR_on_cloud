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
 <script>
        function deactivateUser(uid){
            window.location = "deactivateUser.jsp?uid="+uid;
        }
        function activateUser(uid){
            window.location = "activateUser.jsp?uid="+uid;
        }
    </script>
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
            &nbsp;&nbsp;<a href="staUserManagement.jsp"><font size="+1" color="red"><input type="image" src="images/forum.jpg" width="25" height="25" />&nbsp;&nbsp; Users Management</font></a><br><br>
    &nbsp;&nbsp;<a href="stahome.jsp"><font size="+1" color="red"><input type="image" src="images/forum.jpg" width="25" height="25" >&nbsp;&nbsp; Token Generation</font></a><br><br>
    &nbsp;&nbsp;<a href="sta_tok_det.jsp"><font size="+1" color="green"><input type="image" src="images/icon-more.gif" width="25" height="25" >&nbsp;&nbsp;Token Details</font></a><br><br>
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
    
    <table height="350">
	 <tr>
    <td width="416" style="border:1px solid #DDD;" valign="top"> 
    <table align="center" width="600" style="border:1px solid #326363;" bgcolor="#FFFFFF">
    <tr bgcolor="orange">
	 <td class="paragraping2">User Name</td>
	 <td class="paragraping2">EmailId</td>
	 <td class="paragraping2">Mobile No</td>
	 <td class="paragraping2">Action</td>
	 
	
	 </tr>
	 
	  	 

 <% 
        Connection con = databasecon.getconnection();
    
    PreparedStatement ps = con.prepareStatement("select * from log where user !='sta'");
    
    ResultSet rs = ps.executeQuery();%>
     <% while(rs.next()){
    %>
<tr>
	  	<td class="paragraping"><%=rs.getString(2)%></td>
	  	<td class="paragraping"><%=rs.getString(3)%></td>
		<td class="paragraping"><%=rs.getString(4)%></td>
		
		<td class="paragraping"><%if(rs.getInt("userstate")==1){%><input type="button" value="Deactivate" onclick="deactivateUser('<%=rs.getString("user")%>')"/><%}else{%>
                   <input type="button" value="Activate" onclick="activateUser('<%=rs.getString("user")%>')"/><%}%></td>
	
	  </tr>	


<%
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
