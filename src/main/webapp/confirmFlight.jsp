<%--
  Created by IntelliJ IDEA.
  User: apger
  Date: 5/14/2025
  Time: 11:36 PM
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
<html>
<head>
    <title>Confirm Flight</title>
</head>
<body>
    <%
        String flightID = request.getParameter("flightID");
        String depAirport = request.getParameter("depAirport");
        String arrivalAirport = request.getParameter("arrivalAirport");
        String price = request.getParameter("price");

        Users currentUser = (Users) session.getAttribute("currentUser");
    %>
    <p>Departure Airport: <%=depAirport%></p>
    <p>Arrival Airport: <%=arrivalAirport%></p>
    <p>Price: <%=price%></p>
    <label for="class">Class:</label>
    <select name="class" id="class" required>
        <option value="economy">Economy</option>
        <option value="business">Business</option>
        <option value="first">First</option>
    </select>

    <form action="waitlist.jsp" method="post">
        <button type="submit">waitlist</button>
    </form>
    <form action="tickets.jsp" method="post">
        <input type="hidden" name="flightID" value="<%=flightID%>">
        <input type="hidden" name="depAirport" value="<%=depAirport%>">
        <input type="hidden" name="arrivalAirport" value="<%=arrivalAirport%>">
        <input type="hidden" name="price" value="<%=price%>">
<%--        <input type="hidden" name="class" value="<%=airClass%>">--%>
        <button type="submit">Buy</button>
    </form>
    <form action="searchFlight.jsp" method="get">
        <button type="submit">Cancel</button>
    </form>
</body>
</html>
