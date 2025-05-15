<%--
  Created by IntelliJ IDEA.
  User: apger
  Date: 5/15/2025
  Time: 12:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cs336.pkg.Users" %>
<%@ page import="com.cs336.pkg.Ticket" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Tickets</title>
</head>
<body>
    <%
        Users currentUser = (Users) session.getAttribute("currentUser");
        List<Ticket> pastFlights = new ArrayList<>();
        List<Ticket> upcomingFlights = new ArrayList<>();


    %>
    <h2>Past Flights</h2>

    <h2>Upcoming Flights</h2>
</body>
</html>
