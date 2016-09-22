<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CAM</title>
<link href="style1.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 12px;
}
-->
</style>
<script language="JavaScript">
function valid()
{
var a = document.f.name.value;
var a1 = document.f.age.value;
var a2 = document.f.gen.value;
var b = document.f.user.value;
var c = document.f.pass.value;
var d = document.f.email;
var e = document.f.mobile.value;
if(a=="")
{
alert("Enter your Name");
document.f.name.focus();
return false;
}
if(a1=="")
{
alert("Enter your Age");
document.f.age.focus();
return false;
}
if(isNaN(a1))
{
alert("Enter your Age in Digits");
document.f.age.focus();
return false;
}
if(a1<0)
    {
     alert("Enter correct Age");
document.f.age.focus();
return false;   
    }
if(a2=="")
{
alert("Enter your Gender");
document.f.gen.focus();
return false;
}
if(b=="")
{
alert("Enter your Username");
document.f.user.focus();
return false;
}
if(c=="")
{
alert("Enter your Password");
document.f.pass.focus();
return false;
}
if (d.value == "")
{
window.alert("Please enter a valid e-mail address.");
d.focus();
return false;
}
if (d.value.indexOf("@", 0) < 0)
{
window.alert("Please enter a valid e-mail address.");
d.focus();
return false;
}
if (d.value.indexOf(".", 0) < 0)
{
window.alert("Please enter a valid e-mail address.");
d.focus();
return false;
}
if(e=="")
    {
        alert("Please enter the Mobile number");
			document.f.mobile.focus();
        return false;
    }
	if(isNaN(e))
    {
        alert("Please enter the Correct Mobile number");
			document.f.mobile.focus();
        return false;
    }
	 if (e.length!=10)
           {
                alert("Enter 10 Integers");
				document.f.mobile.focus();
                return false;
           }
}
</script>

</head>

<body>
<%
 java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "dd/MM/yyyy";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now);
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
			<li><a href="index.jsp" title="Home">Home</a></li>
			<li><a href="providerlog.jsp">Provider</a></li>
			<li><a href="stalog.jsp">STA</a></li>
			<li><a href="userlog.jsp" class="selectMenu">User</a></li>
		</ul>
		</div>
	<!--Navigation Part Ends -->
</div>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg">
	<!--Our Company Part Starts -->
	<div id="ourCompany-part">
	<table width="920">
	<tr>
	<td align="center">
	<img src="images/reg.JPG" width="200" height="200" />
	</td>
	<td>
	<table align="center" width="506" style="border:1px solid green;" bgcolor="#FFFFFF">
		<form name="f" action="provider_reg1.jsp" method="post">
		<tr>
		<td height="35" colspan="2" align="center" bgcolor="#FF9900" class="paragraping">Sign up Here</td>
		</tr>
		<tr>
<td class="paragraping" colspan="2" align="center"><font size="2"><b><%
							String message=request.getParameter("message");
							if(message!=null && message.equalsIgnoreCase("success"))
							{
								out.println("<font color='Green'>Successfully Registered</font>");
							}
						%></b></font></td>
</tr>
		
		<tr>
		<td height="43" class="paragraping">Name:</td>
		<td><input type="text" name="name" value="" class="input"></td>
		</tr>
		<tr>
		<td height="43" class="paragraping">Username:</td>
		<td><input type="text" name="user" value="" class="input"></td>
		</tr>
		<tr>
		<td height="39" class="paragraping">Password:</td>
		<td><input type="password" name="pass" value="" class="input"></td>
		</tr>
		<tr>
		<td height="45" class="paragraping">Email:</td>
		<td><input type="text" name="email" value="" class="input"></td>
		</tr>
		<tr>
		<td height="41" class="paragraping">Mobile:</td>
		<td><input type="text" name="mobile" value="" class="input"></td>
		</tr>
		
		<tr>
		<td height="40"></td>
		<td><input type="submit" name="sub" value="Submit" id="button">&nbsp;&nbsp;<input type="reset" name="clear" value="Clear" id="button">
		
		</td>
		</tr>
		</form>
		</table>
		</td>
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
