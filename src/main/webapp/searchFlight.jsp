<%--
  Created by IntelliJ IDEA.
  User: apger
  Date: 5/2/2025
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search for Flights</title>
</head>
<body>
    <h2>Search for Flights</h2>

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
    <input type="submit">

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

</body>
</html>
