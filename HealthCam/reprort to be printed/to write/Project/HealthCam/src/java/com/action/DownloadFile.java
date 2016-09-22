/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.util.DbConnector;
import java.io.*;  
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
 @WebServlet("/download")
public class DownloadFile extends HttpServlet {  
  
public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
String filename = request.getParameter("keys");   
String secretkey = request.getParameter("key_");
 Connection con = DbConnector.getConnection();
         HttpSession session = request.getSession(false);
            String uid = (String)session.getAttribute("userid");
            ResultSet rs = null;
        try {
            //System.out.println("username"+username+"  Password"+password);
            PreparedStatement ps = con.prepareStatement("select * from upload where filename=? and key_=?");
          
            ps.setString(1, filename);
            ps.setString(2, secretkey);
            rs = ps.executeQuery();
            if(rs != null && rs.next()){
                String filepath = "C:/phrs/";   
                response.setContentType("APPLICATION/OCTET-STREAM");   
                response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   

                FileInputStream fileInputStream = new FileInputStream(filepath + filename);  

                int i;   
                while ((i=fileInputStream.read()) != -1) {  
                out.write(i);   
                }   
                fileInputStream.close();   
                out.close();  
                        }
                        else{
                if(request.getParameter("from").equalsIgnoreCase("doc")){
                    response.sendRedirect("DocHome.jsp");
                }
                else{
                    response.sendRedirect("ActuaryHome.jsp");
                }
                            
                        }
           } catch (SQLException ex) {
            Logger.getLogger(FileUploadHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
   
        
    
    
   
}  
}