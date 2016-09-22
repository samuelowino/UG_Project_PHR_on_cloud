/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/downloadF")
public class FileDownloadF extends HttpServlet {

   public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
String filename = request.getParameter("keys");   
//String secretkey = request.getParameter("key_");
 
         HttpSession session = request.getSession(false);
            String uid = (String)session.getAttribute("userid");
        
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
}
