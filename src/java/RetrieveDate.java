import DBWorks.DBConnection;
import java.sql.SQLException;
import java.sql.ResultSet;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kevin
 */
@WebServlet(urlPatterns = {"/RetrieveDate"})
public class RetrieveDate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String ssn;
        String p1;
        String p2;
        String timeOfDate;
        String location;
        String comments;
        String bookingFee;
        String td = "</td><td>";
        try {
            boolean notSSN=true;
            int count=0;
            int totalRevenue = 0;
            String dateOrSSN = request.getParameter("dateOrSSN");
            String ifDateQuery = "SELECT U.SSN,D.Profile1,D.Profile2,D.Date_Time,D.Location,D.Comments,D.BookingFee"
                    + " FROM Date D,User U,Profile P"
                    + " WHERE U.SSN=P.OwnerSSN"
                    + " AND(P.ProfileID=D.Profile1 OR P.ProfileID=D.Profile2)"
                    + " AND DATE(D.Date_Time)='" + dateOrSSN + "'";
            String ifSSNQuery = "SELECT U.SSN,D.Profile1,D.Profile2,D.Date_Time,D.Location,D.Comments,D.BookingFee"
                    + " FROM Date D,User U,Profile P"
                    + " WHERE U.SSN=P.OwnerSSN"
                    + " AND(P.ProfileID=D.Profile1 OR P.ProfileID=D.Profile2)"
                    + " AND U.SSN='" + dateOrSSN + "'";
            java.sql.ResultSet ifSSNRs = DBConnection.ExecQuery(ifSSNQuery);
            java.sql.ResultSet ifDateRs = DBConnection.ExecQuery(ifDateQuery);
            String[] columns = {"SSN","Profile1","Profile2","Time Of Date","Location","Comments","Booking Fee"};
            try{
                
                 while(ifSSNRs.next()){
                     if(count == 0){
                     count++;
                     out.println("<thead>");
                   for(String x:columns){
                       out.println("<th>"+x+"</th>");
                   }
                   out.println("</thead>");
                     }
                   out.println("<tbody>");
                     notSSN=false;
                     ssn=ifSSNRs.getString("SSN");
                     p1 =ifSSNRs.getString("Profile1");
                     p2 = ifSSNRs.getString("Profile2");
                     timeOfDate = ifSSNRs.getDate("Date_Time").toString();
                     location = ifSSNRs.getString("Location");
                     comments = ifSSNRs.getString("Comments");
                     bookingFee = String.valueOf(ifSSNRs.getInt("BookingFee"));
                    totalRevenue += ifSSNRs.getInt("BookingFee");
                    out.println("<tr><td>" + ssn + td + p1
                          + td + p2 + td + timeOfDate
                          +td + location + td+ comments
                          +td + bookingFee+ "</td></tr>");
                }
                if(notSSN){
                   
                    while(ifDateRs.next()){
                        if(count == 0){
                     count++;
                     out.println("<thead>");
                   for(String x:columns){
                       out.println("<th>"+x+"</th>");
                   }
                   out.println("</thead>");
                     }
                    ssn=ifDateRs.getString("SSN");
                    p1 =ifDateRs.getString("Profile1");
                     p2 = ifDateRs.getString("Profile2");
                     timeOfDate = ifDateRs.getDate("Date_Time").toString();
                     location = ifDateRs.getString("Location");
                     comments = ifDateRs.getString("Comments");
                     bookingFee = String.valueOf(ifDateRs.getInt("BookingFee"));
                     totalRevenue += ifDateRs.getInt("BookingFee");
                     out.println("<tr><td>" + ssn + td + p1
                          + td + p2 + td + timeOfDate
                          +td + location + td+ comments
                          +td + bookingFee+ "</td></tr>");
                    }
                }
                if(totalRevenue != 0){
                    out.println("<tr><td>TotalRevenue:</td><td>" + totalRevenue + "</td></tr>");
                 }
                   out.println("</tbody>");
                   
            }catch(SQLException sqle){
                
            }
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
