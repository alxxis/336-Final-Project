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
<%@ page import="java.util.List" %>
<%@ page import="java.time.DayOfWeek" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.cs336.pkg.*" %>

<%
    // Load all airport options
    UsersService service = new UsersService();
    List<Airport> airports = service.getAirports();
    List<Airline> airlines = service.getAirlines();

    // Get selected value from form submission
    String dep_airport = request.getParameter("dep_airport");
    String arv_airport = request.getParameter("arv_airport");
    String deptDate = request.getParameter("deptDate");
    String arrivalDate = request.getParameter("arrivalDate");
    String tripType = request.getParameter("oneOrRound");
    String flexibility = request.getParameter("flexibility");
    String isFlightLeg = request.getParameter("isFlightLeg");
    System.out.println("isFlightLeg: "+ isFlightLeg);

    String previousAirlineID = request.getParameter("previousAirlineID");
    int previousFlightNum = (request.getParameter("previousFlightNum") == null) ? 0: Integer.parseInt(request.getParameter("previousFlightNum"));



    Airport selectedAirport = null;
    Airport selectedArvAirport = null;

    String sortParam = null;
    String maxPrice = null;
    String airline = null;
    String takeoffAfterRequest = null;
    String landingBeforeRequest = null;

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
        if (isFlightLeg == null ){
            session.setAttribute("departure",dep_airport);
            session.setAttribute("arrival",arv_airport);
        }
        localDate = LocalDate.parse(deptDate);
        day = LocalDate.parse(deptDate).getDayOfWeek().getValue();
        sortParam = request.getParameter("sort");
         maxPrice = request.getParameter("maxPrice");
         airline = request.getParameter("airline");
         takeoffAfterRequest = request.getParameter("takeoffAfter");
        landingBeforeRequest = request.getParameter("landingBefore");
        Time takeoffAfter = null;
        Time landingBefore = null;

        // Convert Strings to Time if not null or empty
        if (takeoffAfterRequest != null && !takeoffAfterRequest.isEmpty()) {
            takeoffAfter = Time.valueOf(takeoffAfterRequest + ":00");  // Assuming time is in HH:mm format
        }
        if (landingBeforeRequest != null && !landingBeforeRequest.isEmpty()) {
            landingBefore = Time.valueOf(landingBeforeRequest + ":00");  // Assuming time is in HH:mm format
        }
        flights = service.getFlights(previousAirlineID,previousFlightNum,dep_airport,day,Integer.parseInt(flexibility),localDate, sortParam, maxPrice, airline, takeoffAfter, landingBefore);
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


    <input type="radio" id="oneWay" name="oneOrRound" value="oneWay" required <%= "oneWay".equals(tripType) ? "checked" : "" %>>
    <label for="oneWay">One Way</label>


    <input type="radio" id="roundTrip" name="oneOrRound" value="roundTrip" <%= "roundTrip".equals(tripType) ? "checked" : "" %>>
    <label for="roundTrip">Round Trip</label>


    <select name="flexibility" id="flexibility" required>
        <option value="0" <%="0".equals(flexibility) ? "selected" : ""%>>0 Days</option>
        <option value="1" <%="1".equals(flexibility) ? "selected" : ""%>>1 Day</option>
        <option value="2" <%="2".equals(flexibility) ? "selected" : ""%>>2 Days</option>
        <option value="3" <%="3".equals(flexibility) ? "selected" : ""%>>3 Days</option>
    </select>
    <label for="flexibility">Flexibility:</label>

    <br>

    <input type="radio" id="priceAsc" name="sort" value="priceAsc" <%= "priceAsc".equals(sortParam) ? "checked" : "" %>>
    <label for="priceAsc">Price Ascending</label>
    <input type="radio" id="priceDesc" name="sort" value="priceDesc" <%= "priceDesc".equals(sortParam) ? "checked" : "" %>>
    <label for="priceDesc">Price Descending</label>
    <input type="radio" id="takeAsc" name="sort" value="takeAsc" <%= "takeAsc".equals(sortParam) ? "checked" : "" %>>
    <label for="takeAsc">Takeoff Time Ascending</label>
    <input type="radio" id="takeDesc" name="sort" value="takeDesc" <%= "takeDesc".equals(sortParam) ? "checked" : "" %>>
    <label for="takeDesc">Takeoff Time Descending</label>
    <input type="radio" id="landingAsc" name="sort" value="landingAsc" <%= "landingAsc".equals(sortParam) ? "checked" : "" %>>
    <label for="landingAsc">Landing Time Ascending</label>
    <input type="radio" id="landingDesc" name="sort" value="landingDesc" <%= "landingDesc".equals(sortParam) ? "checked" : "" %>>
    <label for="landingDesc">Landing Time Descending</label>
    <input type="radio" id="durationAsc" name="sort" value="durationAsc" <%= "durationAsc".equals(sortParam) ? "checked" : "" %>>
    <label for="durationAsc">Duration of Flight Ascending</label>
    <input type="radio" id="durationDesc" name="sort" value="durationDesc" <%= "durationDesc".equals(sortParam) ? "checked" : "" %>>
    <label for="durationDesc">Duration of Flight Descending</label>

    <p>Filter By:</p>

    <label for="maxPrice">Max Price: </label>
    <input type="number" id="maxPrice" name="maxPrice" <%= maxPrice!= null ? Integer.getInteger(maxPrice) : ""%>>
    <label for="airline">Airline:</label>
    <select name="airline" id="airline">
        <option value="">-- Any Airline --</option>
        <% for (Airline a : airlines) { %>
        <option value="<%= a.getAirlineID() %>" <%= a.getAirlineID().equals(airline) ? "selected" : "" %>>
            <%= a.getName() %>
        </option>
        <% } %>
    </select>
    <label for="takeoffAfter">Takeoff Time After:</label>
    <input type="time" id="takeoffAfter" name="takeoffAfter" value = <%= takeoffAfterRequest!= null ? takeoffAfterRequest : ""%>>
    <label for="landingBefore">Landing Time Before:</label>
    <input type="time" id="landingBefore" name="landingBefore" value = <%= landingBeforeRequest!= null ? landingBeforeRequest : ""%>>

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
            <td><a href='addFlightToTable.jsp?airlineID=<%=flight.getAirlineID()%>&flightNum=<%=flight.getFlightNum()%>&aircraftID=<%=flight.getAircraftID()%>&isDomestic=<%=flight.isDomestic()%>&departureAirport=<%=flight.getDepartureAirport()%>&departureTime=<%=flight.getDepartureTime()%>&arrivalAirport=<%=flight.getArrivalAirport()%>&arrivalTime=<%=flight.getArrivalTime()%>&price=<%=flight.getPrice()%>&dayOffset=<%=flight.getDayOffset()%>&departureDate=<%=flight.getDepartureDate()%>&departureDay=<%=flight.getDepartureDay()%>'><button>Select</button></a></td>

        </tr>
        <%}%>
    </table>

<%}else if (flights!= null && flights.isEmpty()){
        out.print("<h2>No flights found with these specifications. </h2>");
}
%>
<a href='clear-flight.jsp'><button>Restart</button></a>

</body>
</html>