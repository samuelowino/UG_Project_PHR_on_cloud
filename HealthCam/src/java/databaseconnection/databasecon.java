package databaseconnection;
import java.sql.*;

public class databasecon
{
	static Connection con;
	public static Connection getconnection()
	{
	
 			
		 try {
            Class.forName("com.mysql.jdbc.Driver");
        Connection con = null;
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cam", "root", "root");
        return con;
         } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
	}
	
}
