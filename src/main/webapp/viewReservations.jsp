<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="com.cs336.pkg.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs336.pkg.Airline" %>
<%@ page import="com.cs336.pkg.Ticket" %><%--
  Created by IntelliJ IDEA.
  User: apger
  Date: 5/15/2025
  Time: 4:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Reservations</title>
</head>
<body>
    <%
        UsersService service = new UsersService();
        String air = request.getParameter("airlineID");
        String flightStr = request.getParameter("flightNum");
        if (air == null || flightStr == null || flightStr.isEmpty()) {
            System.out.println("Error: Missing airlineID or flightNum parameters.");
            return; // exit the page if parameters are missing
        }

        int flight = 0;
        try {
            flight = Integer.parseInt(flightStr);
        } catch (NumberFormatException e) {
            System.out.println("Error: Invalid flight number format.");
            return;
        }
        List<Ticket> tickets = service.getTicketsFromAirFlight(air, flight);
//        List<Flight> flights = service.getFlightsWithKey(request.getParameter(airlineID), request.getParameter(flightNum));
        List<Airline> airline = service.getAirlines();
    %>
    <form method="get">
        <label for="airlineID">Airline ID: </label>
        <select name="airlineID" id="airlineID" required>
            <% for (Airline a : airline) { %>
            <option value="<%= a.getAirlineID() %>">
                <%= a.getName() %>
            </option>
            <% } %>
        </select>
        <label for="flightNum">Flight Number: </label>
        <input type="number" id="flightNum" name="flightNum">
    </form>

    <table>
        <tr>
            <td>Ticket ID</td>
            <td>Username</td>
        </tr>
        <%for(Ticket t: tickets){%>
        <tr>
            <td><%= t.getUsername()%>
            <td><%=t.getId()%></td>
        </tr>
        <%}%>
    </table>


    <table>
        <tr>
            <td>ReservationID</td>
        </tr>
        <%for(Ticket t: tickets){%>
        <tr>
            <td><%= t.getUsername()%>
            <td><%=t.getId()%></td>
            <td><%=t.getPrice()%></td>
        </tr>
        <%}%>
    </table>
</body>
</html>
