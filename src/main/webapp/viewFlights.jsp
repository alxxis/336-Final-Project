<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="com.cs336.pkg.Airport" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs336.pkg.Flight" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.cs336.pkg.Users" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/7/2025
  Time: 9:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UsersService service = new UsersService();
    List<Airport> airports = service.getAirports();
    List<Flight> flights = null;

    String airport = request.getParameter("airport");
    String dates = request.getParameter("dates");

    LocalDate localDate = null;
    int day = 0;


    if ("POST".equalsIgnoreCase(request.getMethod()) && airport!= null) {
        localDate = LocalDate.parse(dates);
        day = LocalDate.parse(dates).getDayOfWeek().getValue();
        flights = service.getAllAirportFlights(airport,day);
        System.out.println(localDate);
        System.out.println(day);
        System.out.println(flights);

    }



%>
<html>
<head>
    <title>Title</title>
    <%
        Users curUser = (Users)session.getAttribute("currentUser");
        out.print(service.getHeader(curUser.getRole()));%>
</head>
<body>

<form method="post">

    <label for="airport">Airport:</label>
    <select name="airport" id="airport" required>
        <% for (Airport a : airports) { %>
        <option value="<%= a.getAirportID() %>" <%= a.getAirportID().equals(airport) ? "selected" : "" %>>
            <%= a.getName() %>
        </option>
        <% } %>
    </select>

    <label for="dates">Departure Date:</label >
    <input type="date" id="dates" name="dates" value = <%= dates!= null ? dates : ""%> required>
    <button type="submit">Submit</button>
</form>

<%if (flights!= null && !flights.isEmpty()){%>
<table>
    <tr>
        <th>Departing Date</th>
        <th>Airline ID</th>
        <th>Flight ID</th>
        <th>Aircraft ID</th>
        <th>Departure Airport</th>
        <th>Departing Time</th>
        <th>Arrival Airport</th>
        <th>Arrival Time</th>
        <th>Price</th>
    </tr>

    <% for(Flight flight : flights){
    %>
    <tr>
        <td><%=flight.getDepartureDay() == day ? localDate.format(DateTimeFormatter.ofPattern("MM/dd/yyyy")) : localDate.minusDays(1).format(DateTimeFormatter.ofPattern("MM/dd/yyyy"))%></td>
        <td><%=flight.getAirlineID()%></td>
        <td><%=flight.getFlightNum()%></td>
        <td><%=flight.getAircraftID()%></td>
        <td><%=flight.getDepartureAirport()%></td>
        <td><%=flight.getDepartureTime()%></td>
        <td><%=flight.getArrivalAirport()%></td>
        <td><%=flight.getArrivalTime()%></td>
        <td><%=flight.getPrice()%></td>
    </tr>
    <%}%>
</table>
<%}else if (flights != null && flights.isEmpty()){
    out.print("<h2>No results found.</h2>");
}%>

</body>
</html>
