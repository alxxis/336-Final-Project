<%--
  Created by IntelliJ IDEA.
  User: apger
  Date: 5/2/2025
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="com.cs336.pkg.Airport" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="java.time.DayOfWeek" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.cs336.pkg.Users" %>
<%@ page import="com.cs336.pkg.Flight" %>

<%
    // Load all airport options
    UsersService service = new UsersService();
    List<Airport> airports = service.getAirports();

    // Get selected value from form submission
    String dep_airport = request.getParameter("dep_airport");
    String arv_airport = request.getParameter("arv_airport");
    String deptDate = request.getParameter("deptDate");
    String arrivalDate = request.getParameter("arrivalDate");
    String tripType = request.getParameter("oneOrRound");
    String flexibility = request.getParameter("flexibility");
    String isFlightLeg = request.getParameter("isFlightLeg");



    Airport selectedAirport = null;
    Airport selectedArvAirport = null;

    LocalDate localDate = null;
    int day = 0;
    List<Flight> flights = null;

    if ("get".equalsIgnoreCase(request.getMethod()) && dep_airport != null) {
        for (Airport a : airports) {
            if (a.getName().equals(dep_airport)) {
                selectedAirport = a;

            } if (a.getName().equals(arv_airport)) {
                selectedArvAirport = a;

            }
        }
        if (isFlightLeg == null){
            session.setAttribute("departure",selectedAirport);
            session.setAttribute("arrival",selectedArvAirport);
        }
        localDate = LocalDate.parse(deptDate);
        day = LocalDate.parse(deptDate).getDayOfWeek().getValue();
        flights = service.getFlights(dep_airport,day,Integer.parseInt(flexibility),localDate);
    }
%>
<html>
<head>
    <title>Search for Flights</title>
    <%Users curUser = (Users)session.getAttribute("currentUser");
        out.print(service.getHeader(curUser.getRole()));%>
</head>
<body>
<h2>Search for Flights</h2>

<form method="get">
    <label for="dep_airport">Departure Airport:</label>
    <select name="dep_airport" id="dep_airport" required>
        <% for (Airport a : airports) { %>
        <option value="<%= a.getAirportID() %>" <%= a.getAirportID().equals(dep_airport) ? "selected" : "" %>>
            <%= a.getName() %>
        </option>
        <% } %>
    </select>
    <label for="arv_airport">Arrival Airport:</label>
    <select name="arv_airport" id="arv_airport" required>
        <% for (Airport a : airports) { %>
        <option value="<%= a.getAirportID() %>" <%= a.getAirportID().equals(arv_airport) ? "selected" : "" %>>
            <%= a.getName() %>
        </option>
        <% } %>
    </select>

    <label for="deptDate">Departure Date:</label >
    <input type="date" id="deptDate" name="deptDate" value = <%= deptDate!= null ? deptDate : ""%> required>

    <label for="arrivalDate">Arrival Date:</label>
    <input type="date" id="arrivalDate" name="arrivalDate" value = <%= arrivalDate!= null ? arrivalDate : ""%> required>

    <label for="oneWay">One Way</label>
    <input type="radio" id="oneWay" name="oneOrRound" value="oneWay" required <%= "oneWay".equals(tripType) ? "checked" : "" %>>

    <label for="roundTrip">Round Trip</label>
    <input type="radio" id="roundTrip" name="oneOrRound" value="roundTrip" <%= "roundTrip".equals(tripType) ? "checked" : "" %>>

    <label for="flexibility">Flexibility:</label>
    <select name="flexibility" id="flexibility" required>
        <option value="0" <%="zeroDays".equals(flexibility) ? "selected" : ""%>>0 Days</option>
        <option value="1" <%="oneDay".equals(flexibility) ? "selected" : ""%>>1 Day</option>
        <option value="2" <%="twoDays".equals(flexibility) ? "selected" : ""%>>2 Days</option>
        <option value="3" <%="threeDays".equals(flexibility) ? "selected" : ""%>>3 Days</option>
    </select>

    <button type="submit">Submit</button>
</form>

<%
    if (flights != null && !flights.isEmpty()) {
%>
    <table>
        <tr>
            <th>Departure Date</th>
            <th>Airline ID</th>
            <th>Flight Number</th>
            <th>Aircraft ID</th>
            <th>Departure Airport</th>
            <th>Departure Time</th>
            <th>Arrival Airport</th>
            <th>Arrival Time</th>
            <th>Price</th>
        </tr>
        <%for(Flight flight: flights){%>
        <tr>
            <td><%= flight.getDepartureDate().toString()%>
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

<%}else if (flights!= null && flights.isEmpty()){
        out.print("<h2>No flights found with these specifications.</h2>");
}
%>








<%--<br>--%>
<%--<p>Sort By: </p>--%>
<%--<form>--%>
<%--    <input type="radio" id="priceAsc" name="priceSort" value="ASC">--%>
<%--    <label for="priceAsc">Price Ascending</label>--%>
<%--    <input type="radio" id="priceDesc" name="priceSort" value="DESC">--%>
<%--    <label for="priceDesc">Price Descending</label>--%>
<%--    <input type="radio" id="takeAsc" name="timeSort" value="ASC">--%>
<%--    <label for="takeAsc">Takeoff Time Ascending</label>--%>
<%--    <input type="radio" id="takeDesc" name="timeSort" value="DESC">--%>
<%--    <label for="takeDesc">Takeoff Time Descending</label>--%>
<%--    <input type="radio" id="landingAsc" name="sorting" value="ASC">--%>
<%--    <label for="landingAsc">Landing Time Ascending</label>--%>
<%--    <input type="radio" id="landingDesc" name="sorting" value="DESC">--%>
<%--    <label for="landingDesc">Landing Time Descending</label>--%>
<%--    <input type="radio" id="durationAsc" name="duration" value="ASC">--%>
<%--    <label for="durationAsc">Duration of Flight Ascending</label>--%>
<%--    <input type="radio" id="durationDesc" name="duration" value="DESC">--%>
<%--    <label for="durationDesc">Duration of Flight Descending</label>--%>
<%--</form>--%>

<%--<br>--%>

<%--<p>Filter By:</p>--%>

<%--<label for="maxPrice">Max Price: </label>--%>
<%--<input type="number" id="maxPrice" name="maxPrice">--%>
<%--<p>Airline: </p>--%>
<%--<select name="airline" id="airline">--%>
<%--    <option value="EWR">Newark International Airport</option>--%>
<%--    <option value="JFK">John F. Kennedy International Airport</option>--%>
<%--</select>--%>
<%--<label for="takeoffAfter">Takeoff Time After:</label>--%>
<%--<input type="time" id="takeoffAfter" name="takeoffAfter">--%>
<%--<label for="landingBefore">Landing Time Before:</label>--%>
<%--<input type="time" id="landingBefore" name="landingBefore">--%>
<%--<input type="submit" value="Submit">--%>

</body>
</html>