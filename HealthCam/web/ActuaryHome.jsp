<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
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
                <script src="js/jquery-1.7.1.js"></script>
                <script>
                    function requestForKey(){
                        var fileName = $('#keys').val();
                        window.location = 'keyRequest.jsp?fileName='+fileName;
                    }
                </script>
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
                                        <li class="first current_page_item"><a href="#">Actuary Home</a></li>                       
                                        <li><a href="index.jsp">LogOut</a></li>
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
                                    <h2 class="title"><a href="#"> </a></h2>
                                   
                                    <div style="clear: both;">&nbsp;</div>
                                    <div class="entry">
                                        <span style="font-size: 22px;">Welcome Actuary</span>
                                        <%if (request.getParameter("msg") != null) {
                                                out.println(request.getParameter("msg"));
                                            }%>
                                        <form  action="download">
                                            <input type="hidden" value="actuary" name="from"/>
                                            <table width="90%">
                                                <tr style="height: 40px;"><td>User id:</td>
                                                    <td>
                                                        <select id="keys" name="keys" onchange="loadXMLDoc()">
                                                            <option value="-1">-Select-</option>

                                                            <%
                                                                String sql = "select * from upload";
                                                                System.out.println(";;;;;;;;;;;;;;;" + sql);
                                                                PreparedStatement pst = null;
                                                                Connection conn = null;
                                                                try {
                                                                    conn = DbConnector.getConnection();
                                                                    pst = conn.prepareStatement(sql);
                                                                    ResultSet rs = pst.executeQuery();
                                                                    while (rs.next()) {%>
                                                            <option value="<%=rs.getString("filename")%>"><%=rs.getString("filename")%></option>
                                                            <%}
                                                                } catch (Exception e) {
                                                                }%>
                                                        </select> <input type="button" value="Request For Key" onclick="requestForKey()"/> 
                                                    </td></tr>
                                                <tr><td>Key</td><td><input type="text" id="key_" name="key_"/></td></tr>
                                                <tr><td>Key</td><td><input type="submit" value="Submit"/></td></tr>
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
                        <p>Copyright (c) 2012 . All rights reserved. </p>
                    </div>
                    <!-- end #footer -->
                </body>
                </html>
