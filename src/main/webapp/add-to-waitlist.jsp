<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.cs336.pkg.Flight" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/15/2025
  Time: 9:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Adding to Waitlist</title>
</head>
<body>
<%
  UsersService service = new UsersService();
  Timestamp timestamp = new Timestamp(System.currentTimeMillis());
  String username = request.getParameter("user");
  String flight_class = request.getParameter("class");
  ArrayList<Flight> flights = (ArrayList<Flight>) session.getAttribute("flightList");

  int id = service.addReservation(username,timestamp);
  int i = 0;
  for (Flight f : flights){
    service.insertReservationInfo(id,f.getPrice(),flight_class, f.getAirlineID(), f.getFlightNum(),i++, Date.valueOf(f.getDepartureDate()));
  }
  flights.clear();
  response.sendRedirect("waitlist.jsp");
%>
</body>
</html>
