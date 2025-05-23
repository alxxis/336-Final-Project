<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="com.cs336.pkg.Users" %>
<%--<%@ page import="main.java.com.cs336.pkg.ApplicationDB" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<%
    try {

        //Get the database connection
        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();

        //Create a SQL statement
        Statement stmt = con.createStatement();

        //Get parameters from the HTML form at the HelloWorld.jsp
        String username = request.getParameter("usernameField");
        String password = request.getParameter("passwordField");


//        Make an insert statement for the Sells table:
        String select = ("SELECT username, password FROM application.users WHERE username = ?  AND password = ?");
        //Create a Prepared SQL statement allowing you to introduce the parameters of the query
        PreparedStatement ps = con.prepareStatement(select);

        //Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
        ps.setString(1, username);
        ps.setString(2, password);
        //Run the query against the DB
        ResultSet rs = ps.executeQuery();

        if (rs.isBeforeFirst()) {
            rs.next();
//            out.print(rs.getString("username"));
//
//            out.print(rs.getString("password"));
            session.setAttribute("username",username);
            UsersService service = new UsersService();
            Users user = service.getUser(username);
            session.setAttribute("currentUser",user);
            response.sendRedirect("HelloUser.jsp");
        }
        else {
            out.print("Invalid password <a href='index.jsp'>try again</a>");
        }

        //Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
        con.close();

//        out.print("Insert succeeded!");

    } catch (Exception ex) {
        out.print(ex);
    }
%>
</body>
</html>