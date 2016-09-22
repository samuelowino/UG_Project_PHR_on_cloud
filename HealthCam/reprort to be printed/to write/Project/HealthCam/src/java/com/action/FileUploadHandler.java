/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;
import com.util.DbConnector;
 import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
@WebServlet("/upload")
public class FileUploadHandler  extends HttpServlet{
    private final String UPLOAD_DIRECTORY = "C:/phrs";
  
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String name = "";
        //process only if its multipart content
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                         name = new File(item.getName()).getName();
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                    }
                }
           
               //File uploaded successfully
               request.setAttribute("message", "File Uploaded Successfully");
            } catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }          
         
        }else{
            request.setAttribute("message",
                                 "Sorry this Servlet only handles file upload request");
        }
         Connection con = DbConnector.getConnection();
         HttpSession session = request.getSession(false);
            String uid = (String)session.getAttribute("userid");
        try {
            //System.out.println("username"+username+"  Password"+password);
            PreparedStatement ps = con.prepareStatement("insert into upload values(?,?,now(),?,?)");
          
            ps.setString(1, "");
            ps.setString(2, String.valueOf(Math.random()*10000000));
            ps.setString(3, name);
            ps.setString(4, uid);
            ps.executeUpdate();
           } catch (SQLException ex) {
            Logger.getLogger(FileUploadHandler.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.getRequestDispatcher("/PHRHome.jsp").forward(request, response);
     
    }



}
