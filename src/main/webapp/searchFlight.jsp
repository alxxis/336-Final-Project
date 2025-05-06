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



    Airport selectedAirport = null;
    Airport selectedArvAirport = null;


    if ("POST".equalsIgnoreCase(request.getMethod()) && dep_airport != null) {
        for (Airport a : airports) {
            if (a.getName().equals(dep_airport)) {
                selectedAirport = a;

            } if (a.getName().equals(arv_airport)) {
                selectedArvAirport = a;

            }
        }
    }
%>
<html>
<head>
    <title>Search for Flights</title>
    <%out.print(service.getHeader());%>
</head>
<body>
<h2>Search for Flights</h2>

<form method="post">
    <label for="dep_airport">Departure Airport:</label>
    <select name="dep_airport" id="dep_airport" required>
        <% for (Airport a : airports) { %>
        <option value="<%= a.getName() %>" <%= a.getName().equals(dep_airport) ? "selected" : "" %>>
            <%= a.getName() %>
        </option>
        <% } %>
    </select>
    <label for="arv_airport">Arrival Airport:</label>
    <select name="arv_airport" id="arv_airport" required>
        <% for (Airport a : airports) { %>
        <option value="<%= a.getName() %>" <%= a.getName().equals(arv_airport) ? "selected" : "" %>>
            <%= a.getName() %>
        </option>
        <% } %>
    </select>

    <label for="deptDate">Departure Date:</label >
    <input type="date" id="deptDate" name="deptDate" required>

    <label for="arrivalDate">Arrival Date:</label>
    <input type="date" id="arrivalDate" name="arrivalDate" required>

    <input type="radio" id="oneWay" name="oneOrRound" value="oneWay" required>
    <label for="oneWay">One Way</label>
    <input type="radio" id="roundTrip" name="oneOrRound" value="roundTrip">
    <label for="roundTrip">Round Trip</label>

    <label for="flexibility">Flexibility:</label>
    <select name="flexibility" id="flexibility" required>
        <option value="zeroDays">0 Days</option>
        <option value="oneDay">1 Day</option>
        <option value="twoDays">2 Days</option>
        <option value="threeDays">3 Days</option>
    </select>

    <button type="submit">Submit</button>
</form>

<% if (selectedArvAirport != null && selectedAirport !=  null) { %>
<h2>Selected Arrival Airport Details</h2>
<p>ID: <%= selectedAirport.getAirportID() %></p>
<p>Name: <%= selectedAirport.getName() %></p>
<p>ID: <%= selectedArvAirport.getAirportID() %></p>
<p>Name: <%= selectedArvAirport.getName() %></p>
<% } %>

<% if (deptDate != null) {%>
<h2> Departure Date:</h2>
<p> <%=deptDate%></p>
<% LocalDate date = LocalDate.parse(deptDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    DayOfWeek dayOfWeek = date.getDayOfWeek();%>
<p> <%=dayOfWeek.toString().toLowerCase()%></p>
<% }%>

<% if (arrivalDate != null) {%>
<h2> Arrival Date:</h2>
<p> <%=arrivalDate%></p>
<% }%>

<% if (tripType != null) {%>
<h2> tripType:</h2>
<p> <%=tripType%></p>
<% }%>


<% if (flexibility!= null) {%>
<h2> flexibility:</h2>
<p> <%=flexibility%></p>
<% }%>






<%--<br>--%>
<%--<p>Sort By: </p>--%>
<%--<input type="radio" id="priceAsc" name="sorting" value="priceAsc">--%>
<%--<label for="priceAsc">Price Ascending</label>--%>
<%--<input type="radio" id="priceDesc" name="sorting" value="priceDesc">--%>
<%--<label for="priceDesc">Price Descending</label>--%>
<%--<input type="radio" id="takeAsc" name="sorting" value="takeAsc">--%>
<%--<label for="takeAsc">Takeoff Time Ascending</label>--%>
<%--<input type="radio" id="takeDesc" name="sorting" value="takeDesc">--%>
<%--<label for="takeDesc">Takeoff Time Descending</label>--%>
<%--<input type="radio" id="landingAsc" name="sorting" value="landingAsc">--%>
<%--<label for="landingAsc">Landing Time Ascending</label>--%>
<%--<input type="radio" id="landingDesc" name="sorting" value="landingDesc">--%>
<%--<label for="landingDesc">Landing Time Descending</label>--%>
<%--<input type="radio" id="durationAsc" name="sorting" value="durationAsc">--%>
<%--<label for="durationAsc">Duration of Flight Ascending</label>--%>
<%--<input type="radio" id="durationDesc" name="sorting" value="durationDesc">--%>
<%--<label for="durationDesc">Duration of Flight Descending</label>--%>

<%--<br>--%>

<%--<p>Filter By:</p>--%>

<%--<label for="maxPrice">Max Price: </label>--%>
<%--<input type="number" id="maxPrice" name="maxPrice">--%>
<%--<label for="maxStops">Max Number of Stops: </label>--%>
<%--<input type="number" id="maxStops" name="maxStops">--%>
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