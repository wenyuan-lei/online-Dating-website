import DBWorks.DBConnection;
import com.google.gson.Gson;
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
@WebServlet(urlPatterns = {"/retrieveEmp2"})
public class retrieveEmp2 extends HttpServlet {

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
        //response.setContentType("text/html;charset=UTF-8");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        try {
            String getEmpQuery = "SELECT E.SSN,P.FirstName,P.LastName,E.Role,E.StartDate,E.HourlyRate, P.Street, P.City, P.State, P.Zipcode, P.Email, P.Telephone"
                       + " FROM Employee E,Person P"
                       + " WHERE E.SSN='" +request.getParameter("ssn") + "' AND E.SSN=P.SSN";
               java.sql.ResultSet empRs = DBConnection.ExecQuery(getEmpQuery);
               try{
                   while(empRs.next()){
                    String ssn=empRs.getString("SSN");
                    String fn =empRs.getString("FirstName");
                    String ln = empRs.getString("LastName");
                    String role = empRs.getString("Role");
                    String startDate = empRs.getDate("StartDate").toString();
                    String hourlyRate = String.valueOf(empRs.getInt("HourlyRate"));
                    String street = empRs.getString("Street");
                    String city = empRs.getString("City");
                    String state = empRs.getString("State");
                    String zipcode = String.valueOf(empRs.getInt("Zipcode"));
                    String email = empRs.getString("Email");
                    String telephone = empRs.getString("Telephone");
                    
                    List<String> list = new ArrayList<String>();
                    list.add(ssn);
                    list.add(fn);
                    list.add(ln);
                    list.add(role);
                    list.add(startDate);
                    list.add(hourlyRate);
                    list.add(street);
                    list.add(city);
                    list.add(state);
                    list.add(zipcode);
                    list.add(email);
                    list.add(telephone);
            
                    String json = new Gson().toJson(list);
                    out.println(json);
                   }
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
