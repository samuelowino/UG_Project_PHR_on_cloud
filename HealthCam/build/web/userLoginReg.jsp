<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Keyboard 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20140310

-->
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>HASBE</title>
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,300' rel='stylesheet' type='text/css'>
            <link href='http://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
                <link href="style.css" rel="stylesheet" type="text/css" media="screen" />
                </head>
                <body>
                    <div id="wrapper">
                        <div id="header-wrapper">
                            <div id="header" class="container">
                                <div id="logo">
                                    <h1><a href="#">Scalable </a></h1>
                                </div>
                                <div id="menu">
                                    <ul>
                                        <li class="first current_page_item"><a href="index.jsp">UserReg</a></li>
                                        <li class="last"><a href="domAuthReg.jsp">UserLogin</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div id="banner">
                                <div class="content"><img src="images/img02.jpg" width="1000" height="300" alt="" /></div>
                            </div>
                        </div>
                        <!-- end #header -->

                        <div id="page">
                            <div id="content">
                                <div class="post">
                                    <h2 class="title"><a href="#"></a></h2>
                                    
                                    <div style="clear: both;">&nbsp;</div>
                                    <div class="entry">
                                        <h2>Registration:</h2>
                                        <%if (request.getParameter("msg") != null) {
                                                out.println(request.getParameter("msg"));
                                            }%>
                                        <form method="post" action="UserReg">
                                            <table width="90%">
                                                <tr style="height: 40px;"><td>User id:</td><td><input type="text" size="30" style="height: 25px;" id="_name" name="_name"/></td></tr>
                                                <tr style="height: 40px;"><td>Password:</td><td><input type="text" size="30" style="height: 25px;" id="_password" name="_password"/></td></tr>
                                                <tr style="height: 40px;"><td>Address:</td><td><input type="text" size="30" style="height: 25px;" id="add" name="add" />
                                                    </td></tr>
                                                <tr style="height: 40px;"><td>Age:</td><td><input type="text" size="30" style="height: 25px;" id="_age" name="_age"/></td></tr>
                                                <tr style="height: 40px;"><td>Phone:</td><td><input type="text" size="30" style="height: 25px;" id="_phone" name="_phone"/></td></tr>
                                                <tr style="height: 40px;"><td>Email-Id:</td><td><input type="text" size="30" style="height: 25px;" id="_emailid" name="_emailid"/></td></tr>


                                                <tr style="height: 40px;"><td></td><td><input type="submit" value="Submit" style="height: 25px;width: 90px;"/></td></tr>

                                            </table>
                                        </form>	
                                    </div>
                                </div>
                                <div style="clear: both;">&nbsp;</div>
                            </div>
                            <!-- end #content -->
                            <!-- end #sidebar -->
                            <div style="clear: both;">&nbsp;</div>
                        </div>
                        <!-- end #page --> 
                    </div>
                    <div id="footer">
                        <p>Copyright (c) 2012 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org">FCT</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
                    </div>
                    <!-- end #footer -->
                </body>
                </html>
