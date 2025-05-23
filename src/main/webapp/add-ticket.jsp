<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.cs336.pkg.Flight" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/15/2025
  Time: 5:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  UsersService service = new UsersService();
  Timestamp timestamp = new Timestamp(System.currentTimeMillis());
  String username = request.getParameter("user");
  String flight_class = request.getParameter("class");
  ArrayList<Flight> flights = (ArrayList<Flight>) session.getAttribute("flightList");

  int id = service.addTicket(username,timestamp);
  int i = 0;
  for (Flight f : flights){
    service.insertTicketInfo(id,f.getPrice(),flight_class, f.getAirlineID(), f.getFlightNum(),i++, Date.valueOf(f.getDepartureDate()));
  }
  flights.clear();
  response.sendRedirect("tickets.jsp");
%>
</body>
</html>
