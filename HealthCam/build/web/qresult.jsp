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
    &nbsp;&nbsp;<a href="userhome.jsp"><font size="+1" color="green"><input type="image" src="images/forum.jpg" width="25" height="25" >&nbsp;&nbsp; Query</font></a><br><br>
    &nbsp;&nbsp;<a href="qresult.jsp"><font size="+1" color="red"><input type="image" src="images/icon-more.gif" width="25" height="25" >&nbsp;&nbsp;Query Result</font></a><br><br>
        &nbsp;&nbsp;<a href="index.jsp" ><font size="+1" color="green"><input type="image" src="images/login1.png" width="25" height="25" >&nbsp;&nbsp;Logout</font></a><br><br>
                <a href="myProfile.jsp" >My Info</a> <br/>
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
      
    <td width="650">
    <div id="user_detail">
    <fieldset >
    
    <table height="350">
	<tr>
  <td valign="top">
  <form name="f" action="result.jsp" method="post" onSubmit="return valid()">
  <span class="paragraping1"><strong> Result Extraction :</strong></span>
  
  <table align="center" height="83" width="500" style="border:2px solid gray;" bgcolor="#FFFFFF">
  <tr>
  <td align="center" class="paragraping"><strong>Enter Token :</strong></td>
  <td align="center"><input type="text" name="tok" class="input1"></td>
  <td><input type="submit" name="Term" value="Extract Result" id="button"></td>
  </tr>
<tr>
<td class="paragraping" colspan="3" align="center"><font size="2"><b><%
							String message=request.getParameter("message");
							if(message!=null && message.equalsIgnoreCase("fail"))
							{
								out.println("<font color='red'><blink>Result not found...</blink></font>");
							}
						%></b></font></td>
</tr>
  <tr>
  <td colspan="2" align="center">  </td>
  </tr>
</table>

</form>
 </td>
  </tr>
	 <tr>
    <td width="416" style="border:1px solid #DDD;" valign="top"> 
	 <span class="paragraping1"><strong> Tokens For Queries :</strong></span>
    <table align="center" width="600" style="border:1px solid #326363;" bgcolor="#FFFFFF">
    <tr bgcolor="orange">
	 <td class="paragraping2">uid</td>
	 <td class="paragraping2">Name</td>
	 <td class="paragraping2">Query</td>
	 <td class="paragraping2">Date</td>
	 <td class="paragraping2">Token</td>
	
	 </tr>
	 
	  	 
<%
Connection con=null;
PreparedStatement psmt1=null;
ResultSet rs=null;

String s="pending";
try{
con=databasecon.getconnection();
psmt1=con.prepareStatement("select tok_id,AES_DECRYPT(uid,'key'),AES_DECRYPT(token,'key'),AES_DECRYPT(name,'key'),AES_DECRYPT(query,'key'),AES_DECRYPT(qdate,'key') from token where AES_DECRYPT(uid,'key')='"+uid+"'");
rs=psmt1.executeQuery();
while(rs.next())
{
%>
<tr>
	  	<td class="paragraping"><%=rs.getString(2)%></td>
	  	<td class="paragraping"><%=rs.getString(4)%></td>
		<td class="paragraping"><%=rs.getString(5)%></td>
		<td class="paragraping"><%=rs.getString(6)%></td>
		<td class="paragraping"><font color="#FF3300"><strong><%=rs.getString(3)%></strong></font></td>
	
	  </tr>	


<%
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
