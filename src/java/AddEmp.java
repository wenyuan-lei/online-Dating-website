/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DBWorks.DBConnection;
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
@WebServlet(urlPatterns = {"/AddEmp"})
public class AddEmp extends HttpServlet {

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
            
            String insertPersonQuery = "INSERT INTO Person(SSN,Password,FirstName,LastName,Street,City,State,Zipcode,Email,Telephone)"
                    + " VALUES ('"+request.getParameter("SSN")+"','"
                    + request.getParameter("Password") + "','"
                    + request.getParameter("FirstName") + "','"
                    + request.getParameter("LastName") + "','"
                    + request.getParameter("Street") + "','"
                    + request.getParameter("City") + "','"
                    + request.getParameter("State") + "',"
                    + request.getParameter("Zipcode") + ",'"
                    + request.getParameter("Email") + "','"
                    + request.getParameter("Telephone") + "')";
            DBConnection.ExecUpdateQuery(insertPersonQuery);
            String insertEmpQuery = "INSERT INTO Employee(SSN,Role,StartDate,HourlyRate)"
                    + "VALUES('" + request.getParameter("SSN") + "','"
                    + request.getParameter("Role") + "','"
                    + request.getParameter("StartDate") + "',"
                    + request.getParameter("HourlyRate") + ")";//hourly rate is int
            DBConnection.ExecUpdateQuery(insertEmpQuery);
            out.println("OK");
        } catch(Exception e){
            
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
