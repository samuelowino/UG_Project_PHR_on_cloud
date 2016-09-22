/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import java.sql.*;
import java.io.*;
import com.util.Utilities;
public class DownloadFilep {

    String filename = "c:\\PHR.txt";
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "hasbe";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root";
    String password = "root";
    Statement stmt;

    public boolean getFile(int id) {

        try {
            FileWriter fw = new FileWriter(filename);
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, userName, password);
            String query = "select * from upload where id=" + id;
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                try {
                    BufferedWriter pw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filename)));
                    pw.write(Utilities.decryptString(rs.getString(3),rs.getString(4)));
                    //pw.print(Utilities.decryptString(rs.getString(3),rs.getString(4)));
                    System.out.println((Utilities.decryptString(rs.getString(3), rs.getString(4))));
                    //clean up  
                    pw.close();
                    System.out.println("DOwnload DONNNNNNNNNNNNNNE");
                } catch (IOException e) {
                    System.out.println(e.getMessage());
                }
            }
            fw.flush();
            fw.close();
            conn.close();

            return true;
        } catch (Exception e) {
            System.out.println("Exception " + e);
            return false;
        }
    }
}