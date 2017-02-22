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
@WebServlet(urlPatterns = {"/RetrieveEmp"})
public class RetrieveEmp extends HttpServlet {

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
              String getEmpQuery = "SELECT E.SSN,P.FirstName,P.LastName,E.Role,E.StartDate,E.HourlyRate, P.Street, P.City, P.State, P.Zipcode, P.Email, P.Telephone"
                       + " FROM Employee E,Person P"
                       + " WHERE E.SSN='" +request.getParameter("ssn") + "' AND E.SSN=P.SSN";
               java.sql.ResultSet empRs = DBConnection.ExecQuery(getEmpQuery);
               String []columns = {"SSN","First Name","Last Name","Role","Start Date","Hourly Rate","Street","City","State","Zipcode","Email","Telephone"};
               try{
               while(empRs.next()){
                   out.println("<thead>");
                   for(String x:columns){
                       out.println("<th>"+x+"</th>");
                   }
//                   response.setContentType("application/json");
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
//                    String []a = {ssn,fn,ln,role,startDate,hourlyRate,street,city,state,zipcode,email,telephone};
//                    String empInfoJSON = toJSON(a);
//                    out.println(empInfoJSON);
                    
                   out.println("</thead><tbody>");
                   out.println("<tr><td>" + ssn + "</td><td>" + fn
                          +"</td><td>"+ln+"</td><td>"+role
                          +"</td><td>" + startDate + "</td><td>" + hourlyRate
                          +"</td><td>" + street + "</td><td>" + city
                          +"</td><td>" + empRs.getString("State") + "</td><td>" + zipcode
                           + "</td><td>" + email + "</td><td>" + telephone
                          + "</td></tr>");
                   out.println("</tbody>");
                   
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

    public static String toJSON(String[] array)
    {
    String json = "[\"";

    for (String s : array)
    {
        json += s + "\",\"";
    }

    return json.substring(0, json.length() - 2) + "]";
    }
    
}
