<%@ page import="com.cs336.pkg.Users" %>
<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cs336.pkg.Flight" %>
<%@ page import="com.cs336.pkg.Ticket" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/15/2025
  Time: 10:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Removing From Waitlist</title>
</head>
<body>

<%
  UsersService service = new UsersService();
  int wait_id = Integer.parseInt(request.getParameter("id"));
  String flightClass = request.getParameter("class");
  ArrayList<Flight> flights = service.getFlight(wait_id);

  Timestamp timestamp = new Timestamp(System.currentTimeMillis());
  Users user = (Users) session.getAttribute("currentUser");
  String username = user.getUsername();

  int id = service.addTicket(username,timestamp);

  int i = 0;
  for (Flight f : flights){
    service.insertTicketInfo(id,f.getPrice(),flightClass, f.getAirlineID(), f.getFlightNum(),i++, Date.valueOf(f.getDepartureDate()));
  }
  flights.clear();
  service.deleteReservation(wait_id);
  response.sendRedirect("tickets.jsp");
%>


</body>
</html>
