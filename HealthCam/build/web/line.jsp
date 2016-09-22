
<%@ page import="java.sql.*,databaseconnection.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>

<%
String query="SELECT * from chart";
JDBCCategoryDataset dataset=new JDBCCategoryDataset("jdbc:mysql://localhost:3306/cam",
"com.mysql.jdbc.Driver","root","admin");

dataset.executeQuery( query);
JFreeChart chart = ChartFactory.createLineChart("Test", "Id", "Score",
                                dataset, PlotOrientation.VERTICAL, true, true, false);
                ChartPanel chartPanel = new ChartPanel(chart);
                chartPanel.setPreferredSize(new java.awt.Dimension(500, 270));
                ApplicationFrame f = new ApplicationFrame("Chart");
                f.setContentPane(chartPanel);
                f.pack();
                f.setVisible(true);

try
{
ChartUtilities.saveChartAsJPEG(new File("E:/chart.jpg"), chart, 400, 300);
}
catch (IOException e)
{
System.out.println("Problem in creating chart.");
}
%>

