package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class AddEmp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <style>\n");
      out.write("        body {\n");
      out.write("            background-repeat: no-repeat;\n");
      out.write("            background-size: cover;\n");
      out.write("        }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body background=\"images/one.jpg\">\n");
      out.write("        <h1>Add Employee</h1>\n");
      out.write("        <form  role=\"form\" method=\"POST\" action=\"processAddEmp.jsp\" id=\"form1\">\n");
      out.write("            <div class=\"form-group form-group-sm col-sm-6 col-md-offset-3\">\n");
      out.write("                <label for=\"empSSN\">SSN </label>\n");
      out.write("                <input type=\"text\" class=\"form-control input-sm\" name=\"SSN\" id=\"empSSN\" placeholder=\"Employee's SSN\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group form-group-sm col-sm-6 col-md-offset-3\">\n");
      out.write("                <label for=\"empPassword\">Password </label>\n");
      out.write("                <input type=\"password\" class=\"form-control input-sm\" name=\"Password\" id=\"empPassword\" placeholder=\"Password\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group form-group-sm col-sm-6 col-md-offset-3\">\n");
      out.write("                <label for=\"FirstName\">First Name</label>\n");
      out.write("                <input type=\"text\" class=\"form-control\" name=\"FirstName\" id=\"FirstName\" placeholder=\"FirstName\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group form-group-sm col-sm-6 col-md-offset-3\">\n");
      out.write("                <label for=\"LastName\">Last Name</label>\n");
      out.write("                <input type=\"text\" class=\"form-control\" name=\"LastName\" id=\"LastName\" placeholder=\"LastName\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group form-group-sm col-sm-6 col-md-offset-3\">\n");
      out.write("                <label for=\"Role\">Role</label>\n");
      out.write("                <input type=\"text\" class=\"form-control\" name=\"Role\" id=\"Role\" placeholder=\"Role\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group form-group-sm col-sm-6 col-md-offset-3\">\n");
      out.write("                <label for=\"StartDate\">Start Date</label>\n");
      out.write("                <input type=\"text\" class=\"form-control\" name=\"StartDate\" id=\"StartDate\" placeholder=\"StartDate\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group form-group-sm col-sm-6 col-md-offset-3\">\n");
      out.write("                <label for=\"HourlyRate\">HourlyRate</label>\n");
      out.write("                <input type=\"text\" class=\"form-control\" name=\"HourlyRate\" id=\"HourlyRate\" placeholder=\"HourlyRate\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group form-group-sm col-sm-6 col-md-offset-3\">\n");
      out.write("                <label for=\"Street\">Street</label>\n");
      out.write("                <input type=\"text\" class=\"form-control\" name=\"Street\" id=\"Street\" placeholder=\"Street\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group form-group-sm col-sm-6 col-md-offset-3\">\n");
      out.write("                <label for=\"City\">City</label>\n");
      out.write("                <input type=\"text\" class=\"form-control\" name=\"City\" id=\"City\" placeholder=\"City\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group form-group-sm col-sm-6 col-md-offset-3\">\n");
      out.write("                <label for=\"State\">State</label>\n");
      out.write("                <input type=\"text\" class=\"form-control\" name=\"State\" id=\"State\" placeholder=\"State\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group form-group-sm col-sm-6 col-md-offset-3\">\n");
      out.write("                <label for=\"Zip\">Zip</label>\n");
      out.write("                <input type=\"text\" class=\"form-control\" name=\"Zipcode\" id=\"Zip\" placeholder=\"Zip\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group form-group-sm col-sm-6 col-md-offset-3\">\n");
      out.write("                <label for=\"Email\">Email</label>\n");
      out.write("                <input type=\"text\" class=\"form-control\" name=\"Email\" id=\"Email\" placeholder=\"Email\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group form-group-sm col-sm-6 col-md-offset-3\">\n");
      out.write("                <label for=\"Telephone\">Telephone</label>\n");
      out.write("                <input type=\"text\" class=\"form-control\" name=\"Telephone\" id=\"Telephone\" placeholder=\"Telephone\">\n");
      out.write("            </div>\n");
      out.write("            <button type=\"submit\" class=\"btn btn-default col-sm-2 col-md-offset-5\">Submit</button>\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js\"></script>\n");
      out.write("        <script href=\"js/bootstrap.min.js\" ></script>\n");
      out.write("        <script type=\"text/javascript\" language=\"javascript\">\n");
      out.write("            $(document).ready(function(){\n");
      out.write("//            var form=$(\"#form1\");\n");
      out.write("//            form.submit(function(){\n");
      out.write("//                $.post('AddEmp',form.serialize())\n");
      out.write("//                        .done(\n");
      out.write("//                    function(responseText){\n");
      out.write("//                        if(reponseText === 'OK'){\n");
      out.write("//                            alert(\"Success\");\n");
      out.write("//                        }\n");
      out.write("//                    });\n");
      out.write("//                \n");
      out.write("//            });\n");
      out.write("        });\n");
      out.write("        </script>\n");
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
