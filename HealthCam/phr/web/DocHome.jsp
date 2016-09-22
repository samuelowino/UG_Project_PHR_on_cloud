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
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,300' rel='stylesheet' type='text/css'/>
            <link href='http://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'/>
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
                                        <li class="first current_page_item"><a href="#">Doctor Home</a></li>                       
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


                                    <div style="clear: both;">&nbsp;</div>
                                    <div class="entry">
                                        <span style="font-size: 22px;"></span>
                                        <%if (request.getParameter("msg") != null) {
                                                out.println(request.getParameter("msg"));
                                            }%>
                                        <table border="1">
                                            <tr>
                                                <th>UserName</th>
                                                <th>Sex</th>
                                                <th>Age</th>
                                                <th>Email ID</th>
                                                <th>Phone No.</th>                                                    
                                            </tr>
                                            <%
                                                String sql = "Select * from user where role='PHR'";
                                                PreparedStatement pst = null, pst1 = null;
                                                Connection conn = null;
                                                try {
                                                    conn = DbConnector.getConnection();
                                                    pst = conn.prepareStatement(sql);
                                                    ResultSet rs = pst.executeQuery();
                                                    while (rs.next()) {%>
                                            <tr>


                                                <td><%=rs.getString("userid")%></td>
                                                <td><%=rs.getString("address")%></td>
                                                <td><%=rs.getString("age")%></td>
                                                <td><%=rs.getString("emailid")%> </td>
                                                <td><%=rs.getString("phone")%></td>
                                                <td><a href="download.jsp?id=<%=rs.getString("userid")%>">Download Details</a></td>
                                                <%
                                                            


                                                        }
                                                    } catch (Exception e) {
                                                        System.out.println("ERRRORRRR " + e);
                                                    }%>

                                            </tr>
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
