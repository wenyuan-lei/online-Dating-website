package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import DBWorks.DBConnection;
import java.sql.SQLException;
import java.sql.ResultSet;

public final class DeleteEmp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("        <body>\n");
      out.write("        <h1>Delete Employee</h1>\n");
      out.write("        \n");
      out.write("        <input type=\"text\" placeholder=\"Enter Employee's SSN\" name=\"SSN\" id=\"SSN\" > \n");
      out.write("        \n");
      out.write("        <div id=\"toBeDelEmp\"> \n");
      out.write("            <div id=\"mainTable\">\n");
      out.write("            <h2 class=\"sub-header\"></h2>\n");
      out.write("                <div class=\"table-responsive col-sm-12\" >\n");
      out.write("                    <table class=\"table table-striped col-sm-12\">\n");
      out.write("                        \n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <button type=\"button\" class=\"btn btn-primary col-sm-2\">Delete</button>\n");
      out.write("        <a  class=\"btn btn-default col-sm-2\" href=\"Manager.jsp\">Back</a>\n");
      out.write("        \n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js\"></script>\n");
      out.write("    <script href=\"js/bootstrap.min.js\" ></script>\n");
      out.write("    <script type=\"text/javascript\" language=\"javascript\">    \n");
      out.write("        $(document).ready(function(){\n");
      out.write("            $(\"button\").hide();\n");
      out.write("           $(\"input\").on('input',function(){\n");
      out.write("               $.get('RetrieveEmp',{ssn:$(\"#SSN\").val()})\n");
      out.write("                       .done(function(responseText){\n");
      out.write("                  \n");
      out.write("                  $(\"table\").html(responseText);\n");
      out.write("          \n");
      out.write("                  if(responseText !== \"\"){\n");
      out.write("                      $(\"button\").show();\n");
      out.write("                  }else{\n");
      out.write("                      $(\"button\").hide();\n");
      out.write("                  }\n");
      out.write("               });\n");
      out.write("           });\n");
      out.write("           $(\"button\").click(function(){\n");
      out.write("               $.get('DeleteEmployee',{ssn:$(\"#SSN\").val()})\n");
      out.write("                       .done(function(responseText){\n");
      out.write("                           if(parseInt(responseText)> 0){\n");
      out.write("                            $(\"#toBeDelEmp\").html(\"Successfully deleted employee!\");   \n");
      out.write("                           }else{\n");
      out.write("                            $(\"#toBeDelEmp\").html(\"Failed to delete employee\");   \n");
      out.write("                           }\n");
      out.write("                       });\n");
      out.write("                  $(\"button\").hide();\n");
      out.write("               \n");
      out.write("           });\n");
      out.write("            \n");
      out.write("        });\n");
      out.write("    </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
