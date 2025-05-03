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

<%
    // Database connection variables
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306", "Root", "IRrRI5U40Qqc$3SJ");

        // Step 3: Create SQL query
        String sql = "SELECT name FROM airport ORDER BY name";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
%>
<html>
<head>
    <title>Search for Flights</title>
</head>
<body>
    <h2>Search for Flights</h2>

    <select name="flightsFrom">
        <option value="">Flights from: </option>
        <%
            while (rs.next()) {
                String name = rs.getString("name");
        %>
        <option value="<%= name %>"><%= name %></option>
        <%
            }
        %>
    </select>
    <input type="submit" value="Submit">

    <label for="from">From:</label>
    <select name="from" id="from">
      <option value="EWR">Newark International Airport</option>
      <option value="JFK">John F. Kennedy International Airport</option>
    </select>

    <label for="to">To:</label>
    <select name="destination" id="to">
      <option value="EWR">Newark International Airport</option>
      <option value="JFK">John F. Kennedy International Airport</option>
    </select>

    <label for="deptDate">Departure Date:</label>
    <input type="date" id="deptDate" name="deptDate">

    <label for="arrivalDate">Arrival Date:</label>
    <input type="date" id="arrivalDate" name="arrivalDate">

    <input type="radio" id="oneWay" name="oneOrRound" value="oneWay">
    <label for="oneWay">One Way</label>
    <input type="radio" id="roundTrip" name="oneOrRound" value="roundTrip">
    <label for="roundTrip">Round Trip</label>

    <label for="flexibility">Flexibility:</label>
    <select name="flexibility" id="flexibility">
      <option value="zeroDays">0 Days</option>
      <option value="oneDay">1 Day</option>
      <option value="twoDays">2 Days</option>
      <option value="threeDays">3 Days</option>
    </select>
    <input type="submit">

</body>
</html>
