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
@WebServlet(urlPatterns = {"/RetrieveProfile"})
public class RetrieveProfile extends HttpServlet {

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
        boolean printedHead = false;
        
        try {
            String trait = request.getParameter("trait");
            boolean isHeight = false;
            boolean isWeight = false;
            boolean isHairOrHobby = false;
            boolean isAge = false;
            try{//height [3.0-8.0] or weight [10-500]
                float temp = Float.parseFloat(trait);
                isHeight = (temp >= 3.0 && temp <= 8.0) ? true:false;
                isWeight = (temp >= 80.0 && temp <= 300.0) ? true:false;
                isAge = (temp >= 18.0 && temp <= 70.0) ? true:false;
            }catch(NumberFormatException e){
                isHairOrHobby = true;
            }
            
              String getProfileQuery = "SELECT * FROM Profile";
              java.sql.ResultSet profileRs = DBConnection.ExecQuery(getProfileQuery);
              String []columns = {"ProfileID","OwnerSSN","Age","DatingAgeRangeStart","DatingAgeRangeEnd","DatinGeoRange","M_F","Hobbies","Height","Weight","HairColor","CreationDate","LastModDate"};
              
              while(profileRs.next()){
                  if(!printedHead){
                      printedHead=true;
                       out.println("<thead>");
                       for(String x:columns){
                           out.println("<th>"+x+"</th>");
                       }
                       out.println("</thead><tbody>");
                  }
                    
                    int age = profileRs.getInt("Age");
                    int dateAgeStart = profileRs.getInt("DatingAgeRangeStart");
                    int dateAgeEnd = profileRs.getInt("DatingAgeRangeEnd");
                    int geoRange = profileRs.getInt("DatinGeoRange");
                    String hobbies = profileRs.getString("Hobbies").toLowerCase();//hobbies
                    float height = profileRs.getFloat("Height");
                    int weight = profileRs.getInt("Weight");
                    String hairColor = profileRs.getString("HairColor").toLowerCase();//hair color
                    
                    
                   if(isHeight && (height >= Float.parseFloat(trait) - 0.2 && height <= Float.parseFloat(trait) + 0.2 )){
                       printToTable(out, profileRs);
                   }else if(isWeight && (weight >= Float.parseFloat(trait) - 20 && weight <=  Float.parseFloat(trait) + 20  )){
                       printToTable(out, profileRs);
                   }else if(isAge && (age >= Float.parseFloat(trait) - 3 && age <= Float.parseFloat(trait) + 3)){
                       printToTable(out, profileRs);
                   }else if(isHairOrHobby){
                       if(hairColor.contains(trait.toLowerCase()) || hobbies.contains(trait.toLowerCase())){
                           printToTable(out, profileRs);
                       }
                   }
              }
              if(printedHead){
                  out.println("</tbody>");
              }
        } catch(SQLException sqle){
        
        }finally {
            out.close();
        }
    }

    void printToTable(PrintWriter out,java.sql.ResultSet profileRs) throws SQLException{
          String profileID=profileRs.getString("ProfileID");
                    String ssn =profileRs.getString("OwnerSSN");
                    int age = profileRs.getInt("Age");
                    int dateAgeStart = profileRs.getInt("DatingAgeRangeStart");
                    int dateAgeEnd = profileRs.getInt("DatingAgeRangeEnd");
                    int geoRange = profileRs.getInt("DatinGeoRange");
                    String m_f = profileRs.getString("M_F");
                    String hobbies = profileRs.getString("Hobbies");//hobbies
                    float height = profileRs.getFloat("Height");
                    int weight = profileRs.getInt("Weight");
                    String hairColor = profileRs.getString("HairColor");//hair color
                    String creationDate = profileRs.getDate("CreationDate").toString();
                    String lastModDate = profileRs.getDate("LastModDate").toString();
        
                   out.println("<tr><td>" + profileID + "</td><td>" + ssn
                          +"</td><td>"+age+"</td><td>"+dateAgeStart
                          +"</td><td>" + dateAgeEnd + "</td><td>" + geoRange
                          +"</td><td>" + m_f + "</td><td>" + hobbies
                          +"</td><td>" + height + "</td><td>" + weight
                           + "</td><td>" + hairColor + "</td><td>" + creationDate
                          +"</td><td>"+ lastModDate + "</td></tr>");
                   
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
