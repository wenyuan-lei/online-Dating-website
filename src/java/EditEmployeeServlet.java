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
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kevin
 */
@WebServlet(urlPatterns = {"/EditEmployeeServlet"})
public class EditEmployeeServlet extends HttpServlet {

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
            String ssn = request.getParameter("ssn");
            String fn = request.getParameter("firstName");
            String ln = request.getParameter("lastName");
            String role = request.getParameter("role");
            String startDate = request.getParameter("startDate");
            String hourlyRate = request.getParameter("hourlyRate");
            String street = request.getParameter("street");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zipcode = request.getParameter("zipcode");
            String email = request.getParameter("email");
            String telephone = request.getParameter("telephone");
            String password = request.getParameter("password");
            
            String updatePersonQuery = "UPDATE Person SET Street='" + street + "',FirstName='"+fn
                    +"',LastName='"+ln+"',City='"+city+"',State='"+state+"',Zipcode="+zipcode
                    +",Email='"+email+"',Telephone='"+telephone+"',Password='"+password+"' WHERE SSN='"+ssn+"'"
                    ;
            String updateEmpQuery = "UPDATE Employee SET Role='"+role+"',StartDate='"+startDate+"',"
                    +"HourlyRate="+hourlyRate+" WHERE SSN='"+ssn+"'"
                    ;
            int personRs = DBConnection.ExecUpdateQuery(updatePersonQuery);
            int empRs = DBConnection.ExecUpdateQuery(updateEmpQuery);
            out.println(personRs+empRs);
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
