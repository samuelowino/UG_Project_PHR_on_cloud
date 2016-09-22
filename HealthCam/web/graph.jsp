<%@ page import="java.sql.*,databaseconnection.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>

<%


String g=request.getQueryString();
int g1=Integer.parseInt(g);
int gg=g1+1;

session.setAttribute("gid",gg);

Connection conn=null;
PreparedStatement pss=null;
ResultSet rss=null;
String ttname=null,discrip=null;

try{
conn=databasecon.getconnection();
pss=conn.prepareStatement("select * from graph where gid='"+g+"'");
rss=pss.executeQuery();
if(rss.next())
{
ttname=rss.getString(5);
discrip=rss.getString(6);

session.setAttribute("ttname",ttname);
session.setAttribute("discrip",discrip);




String p=request.getRealPath("\\");
String p1=p+"images\\logotype.jpg";



String query="select x,maximum_value,user_value from graph where gid='"+g+"'";
JDBCCategoryDataset dataset=new JDBCCategoryDataset("jdbc:mysql://localhost:3306/cam","com.mysql.jdbc.Driver","root","root");

dataset.executeQuery( query);
JFreeChart chart = ChartFactory .createBarChart3D("Health Monitoring","","Attribute Value",dataset,PlotOrientation.VERTICAL,true, true, false);
try
{
ChartUtilities.saveChartAsJPEG(new File(p1), chart, 600, 400);
response.sendRedirect("graph1.jsp");
}
catch (IOException e)
{
System.out.println("Problem in creating chart.");
}

}
else
{
response.sendRedirect("qresult.jsp");
}


}
catch(Exception ee)
{
out.println(ee.getMessage());
}
%>