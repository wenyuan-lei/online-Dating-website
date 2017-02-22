/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DBWorks.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kevin
 */
@WebServlet(urlPatterns = {"/RetrieveProfileBySSN"})
public class RetrieveProfileBySSN extends HttpServlet {

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
        try {
            /* TODO output your page here. You may use following sample code. */
            String ssn = request.getParameter("ssn");
            String getProfilesQuery = "SELECT * FROM Profile,Person WHERE Person.SSN=OwnerSSN AND OwnerSSN='"+ssn+"'";
            java.sql.ResultSet profileRs = DBConnection.ExecQuery(getProfilesQuery);
            while(profileRs.next()){
                out.println("<tr>");
                out.println("<td>"+profileRs.getString("ProfileID")+"</td><td>"
                        + profileRs.getInt("Age")+"</td><td>"
                        + profileRs.getString("City")+"</td><td>"
                        + profileRs.getInt("DatingAgeRangeStart")+"</td><td>"
                        + profileRs.getInt("DatingAgeRangeEnd")+"</td><td>"
                        + profileRs.getInt("DatinGeoRange")+"</td><td>"
                        + profileRs.getString("M_F")+"</td><td>"
                        + profileRs.getString("Hobbies")+"</td><td>"
                        + profileRs.getInt("Height")+"</td><td>"
                        + profileRs.getInt("Weight")+"</td><td>"
                        + profileRs.getString("HairColor")+"</td><td>"
                        + profileRs.getDate("CreationDate").toString()+"</td><td>"
                        + profileRs.getDate("LastModDate").toString()+"</td>");
                out.println("</tr>");
            }
        }  catch(SQLException sqle){
        
        }finally {
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
