<%@ page import="java.sql.Time" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="com.cs336.pkg.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.cs336.pkg.Airport" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/15/2025
  Time: 12:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Adding Flight...</title>
</head>
<body>

<%

  String trueDeparture = ((String)session.getAttribute("arrival"));

  String airlineID = request.getParameter("airlineID");
  int flightNum = Integer.parseInt(request.getParameter("flightNum"));
  int aircraftID = Integer.parseInt(request.getParameter("aircraftID"));
  boolean isDomestic = Boolean.parseBoolean(request.getParameter("isDomestic"));
  String departureAirport = request.getParameter("departureAirport");
  Time departureTime = Time.valueOf(request.getParameter("departureTime"));
  String arrivalAirport = request.getParameter("arrivalAirport");
  Time arrivalTime = Time.valueOf(request.getParameter("arrivalTime"));
  Double price = Double.parseDouble(request.getParameter("price"));
  int dayOffset = Integer.parseInt(request.getParameter("dayOffset"));
  LocalDate departureDate = LocalDate.parse(request.getParameter("departureDate"));
  int departureDay = Integer.parseInt(request.getParameter("departureDay"));


  Flight flight = new Flight(airlineID,flightNum,aircraftID,isDomestic,departureAirport,departureTime,arrivalAirport,arrivalTime,price,dayOffset,departureDay,departureDate);
  ArrayList<Flight> tempFlights = (ArrayList<Flight>) session.getAttribute("flightList");

  if (tempFlights == null){
    tempFlights = new ArrayList<Flight>();
    session.setAttribute("flightList",tempFlights);
  }
  tempFlights.add(flight);

  String url = String.format("searchFlight.jsp?dep_airport=%s&arv_airport=%s&deptDate=%s&arrivalDate=%s&oneOrRound=%s&flexibility=%d&maxPrice=&airline=&takeoffAfter=&landingBefore=&previousAirlineID=%s&previousFlightNum=%d&isFlightLeg=1",flight.getArrivalAirport(),trueDeparture,departureDate.toString(),departureDate.toString(),"oneWay",0,airlineID,flightNum);

  for (Flight f : tempFlights){
    System.out.println(f);
  }
  if (arrivalAirport.equals(trueDeparture)) {
    String ret = (String) session.getAttribute("returnDate");
    String dep = (String) session.getAttribute("departure");
    String arr = (String) session.getAttribute("arrival");
    session.setAttribute("departure",arr);
    session.setAttribute("arrival",dep);

    if (ret != null) {
      String url_2 = String.format("searchFlight.jsp?dep_airport=%s&arv_airport=%s&deptDate=%s&arrivalDate=&oneOrRound=oneWay&flexibility=%d&maxPrice=&airline=&takeoffAfter=&landingBefore=", arr, dep, ret, 0);
      session.setAttribute("returnDate", null);
      response.sendRedirect(url_2);
    }else{
      response.sendRedirect("confirmFlight.jsp");
    }
  }else {
    response.sendRedirect(url);
  }
  // http://localhost:8080/336_website_war_exploded/searchFlight.jsp?dep_airport=EWR&arv_airport=JFK&deptDate=2025-05-13&arrivalDate=2025-05-13&oneOrRound=oneWay&flexibility=2&maxPrice=&airline=&takeoffAfter=&landingBefore=


%>

</body>
</html>
