<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.Connection"%>
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
        <title>Scalable and Secure Sharing of Personal Health Records in Cloud Computing using Attribute-based Encryption</title>
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,300' rel='stylesheet' type='text/css'>
            <link href='http://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
                <link href="style.css" rel="stylesheet" type="text/css" media="screen" />
                <script>
                    function sendKey(userid,fileName){
                        window.location='sendMail.jsp?userid='+userid+"&fileName="+fileName;
                    }
                </script>
                </head>
                <body>
                    <div id="wrapper">
                        <div id="header-wrapper">
                            <div id="header" class="container">
                                <div id="logo">
                                    <h1><a href="#">Scalable</a></h1>
                                </div>
                                <div id="menu">
                                    <ul>
                                        <li class="first current_page_item"><a href="#">PHR Home</a></li>
                                        <li><a href="index.jsp">Log Out</a></li>
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
                                    <div class="entry" style="width:500px;float:left;">
                                        <%if (request.getParameter("msg") != null) {
                                                                  out.println(request.getParameter("msg"));
                                                              }%>
                                        <h2>Upload File</h2>
                                        <form action="upload" method="post" enctype="multipart/form-data">
                                            <tr style="height: 40px;"><td>Choose File:</td><td> <input name="file" type="file" id="file"/>    </td></tr>
                                            <tr style="height: 40px;"><td colspan="2"> <input type="submit" value="Upload"/> </td></tr>
                                            <table>

                                            </table>
                                        </form>
                                    </div>
                                        <div style="float:right;width:500px;">
                                            Users Request For File Download Key
                                            <table>
                                                <tr>
                                                    <td>User Name</td>
                                                    <td>File Name</td>
                                                    <td>Action</td>
                                                </tr>
                                                <% 
        Connection con = DbConnector.getConnection();
    
    PreparedStatement ps = con.prepareStatement("select * from keyrequest");
    ResultSet rs = ps.executeQuery();
    while(rs.next()){
    %>
    <tr>
                                                    <td><%=rs.getString("userid")%></td>
                                                    <td><%=rs.getString("filename")%></td>
                                                    <td><%if(rs.getInt("requeststate")==0){%><input type="button" value="Send Key" onclick="sendKey('<%=rs.getString("userid")%>','<%=rs.getString("filename")%>')"/><%}%></td>
                                                </tr>
    <%}%>
                                            </table>
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
                        <p>Copyright (c) 2012. All rights reserved. </p>
                    </div>
                    <!-- end #footer -->
                </body>
                </html>
