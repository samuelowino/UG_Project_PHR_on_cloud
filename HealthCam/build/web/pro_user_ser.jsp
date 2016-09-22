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
	  <table width="950" align="center">
    <tr>
    
    <!-- left Side Menu -->
    
    
    <td width="300" valign="top">
    <fieldset>
    <table height="350">
    <tr>
    <td><form>
             &nbsp;&nbsp;<a href="uploadDocForUser.jsp"><font size="+1" color="green"><input type="image" src="images/icon-more.gif" width="25" height="25" >&nbsp;&nbsp;Upload Documents Of User</font></a><br><br>
    
    &nbsp;&nbsp;<a href="providerhome.jsp"><font size="+1" color="green"><input type="image" src="images/forum.jpg" width="25" height="25" >&nbsp;&nbsp; Add Medical Details</font></a><br><br>
    &nbsp;&nbsp;<a href="pro_med_det.jsp"><font size="+1" color="green"><input type="image" src="images/icon-more.gif" width="25" height="25" >&nbsp;&nbsp;View Medical Details</font></a><br><br>
    &nbsp;&nbsp;<a href="pro_user_ser.jsp"><font size="+1" color="red"><input type="image" src="images/search.png" width="25" height="25" >&nbsp;&nbsp;User Search</font></a><br><br>
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
    <table height="350">
    <tr>
    <td width="416" valign="top"> 
    <table align="center" width="650" style="border:1px solid #326363;" bgcolor="#FFFFFF">
    <tr bgcolor="#454545">
	 <td class="paragraping2">Name</td>
	 <td class="paragraping2">Email</td>
	 <td class="paragraping2">Mobile</td>
	 <td class="paragraping2">Query</td>
	
	
	 </tr>
	 
	 
<%
Connection con=null,con1=null;
PreparedStatement psmt=null,psmt1=null;
ResultSet rs=null,rs1=null;
String uid=null,query=null;
try{
con=databasecon.getconnection();
psmt=con.prepareStatement("select tok_id,AES_DECRYPT(uid,'key'),AES_DECRYPT(name,'key'),AES_DECRYPT(query,'key'),AES_DECRYPT(qdate,'key') from token where provideruser in (?,?)");
psmt.setString(1,(String)session.getAttribute("user"));
psmt.setString(2,"All");
rs=psmt.executeQuery();
while(rs.next())
{
uid=rs.getString(2);
query=rs.getString(4);

try{
con1=databasecon.getconnection();
psmt1=con1.prepareStatement("select AES_ENCRYPT(name,'key'),AES_ENCRYPT(email,'key'),AES_ENCRYPT(mobile,'key') from signup where uid='"+uid+"'");
rs1=psmt1.executeQuery();
while(rs1.next())
{

%>
<tr>
	  	<td  style="border-bottom:1px solid #666666" class="paragraping"><font color="#FF3300"><%=rs1.getString(1)%></font></td>
	  	<td style="border-bottom:1px solid #666666" class="paragraping"><font color="#FF3300"><%=rs1.getString(2)%></font></td>
		<td style="border-bottom:1px solid #666666" class="paragraping"><font color="#FF3300"><%=rs1.getString(3)%></font></td>
        <td style="border-bottom:1px solid #666666" class="paragraping"><%=query%></td>  
	
	
	  </tr>	


<%
}
}
catch(Exception ex)
{
out.println("Error in connection : "+ex);
}

}
}
catch(Exception ex)
{
out.println("Error in connection : "+ex);
}

%>
	  
   
      
     

</table>
   
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
