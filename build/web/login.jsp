
<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>
<%
	if ((request.getParameter("action") != null) && (request.getParameter("action").trim().equals("logout"))) {
		//session.putValue("login", "");
                session.setAttribute("login", "");
		response.sendRedirect("/");
		return;
	}

	String username = request.getParameter("username");
	String userpasswd = request.getParameter("userpasswd");
        String query=null;
	session.setAttribute("login", "");
	if ((username != null) && (userpasswd != null))
        {
            if (username.trim().equals("") || userpasswd.trim().equals("")) {
		response.sendRedirect("index.jsp");
            } 
            else {
                //Check if is a user
                query = "SELECT * FROM User U, Person P WHERE U.SSN = P.SSN AND "
                        + "U.SSN = '" +
                        username + "' AND P.Password = '" + userpasswd  + "'";
               	java.sql.ResultSet rs = DBConnection.ExecQuery(query);
		if (rs.next()) {
                    // login success
                    session.setAttribute("login", username);
                    response.sendRedirect("SelectProfile.jsp");
		} 
                
                //If not user, check if is Manager
                else {
                        query = "SELECT * FROM Employee E, Person P  WHERE E.SSN = '" +
                            username + "' AND P.Password = '" + userpasswd  + "'" 
                            + " AND E.Role='Manager'";
                        rs = DBConnection.ExecQuery(query);
                        if (rs.next()) {
                            session.setAttribute("login", username);
                            response.sendRedirect("Manager.jsp");
                        }
                        else {
                            //check if is a customer representative
                            query = "SELECT * FROM Employee E, Person P  WHERE E.SSN = '" +
                            username + "' AND P.Password = '" + userpasswd  + "'" 
                            + " AND E.Role='CustRep'";
                            rs = DBConnection.ExecQuery(query);
                            if (rs.next()) {
                                session.setAttribute("login", username);
                                response.sendRedirect("CustRep.jsp");
                            }
				// username or password mistake
                            else{
                            out.print("Username or Password is not Correct!!!");
                            %>
                            <br/>
                            <a href="index.htm"> Back to login page </a>
                            <%
                            }
                        }
                    }
			
            }
	}
    
%>