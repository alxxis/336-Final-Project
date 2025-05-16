        <%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="com.cs336.pkg.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs336.pkg.Airline" %>
<%@ page import="com.cs336.pkg.Ticket" %>
        <%@ page import="java.util.ArrayList" %><%--
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
        String flight = request.getParameter("flightNum");
        String username = request.getParameter("username");

        List<Ticket> tickets = new ArrayList<>();
        List<Ticket> tickets2 = new ArrayList<>();

        if (flight != null && !flight.isEmpty()) {
            try {
                tickets = service.getTicketsFromAirFlight(air, Integer.parseInt(flight));
                request.setAttribute("tickets", tickets);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid flight number format.");
                e.printStackTrace();
            } catch (Exception e) {
                request.setAttribute("error", "An unexpected error occurred.");
                e.printStackTrace();
            }
        } else {
            request.setAttribute("error", "Please enter a flight number.");
        }

        if (username != null && !username.isEmpty()) {
            tickets2 = service.getTicketsFromUser(username);
            request.setAttribute("tickets2", tickets2);
        }

        List<Airline> airline = service.getAirlines();
        request.setAttribute("airline", airline);

        System.out.println("Tickets retrieved: " + tickets.size());

    %>

    <form action="viewReservations.jsp"  method="get">
        <label for="airlineID">Airline ID: </label>
        <select name="airlineID" id="airlineID" required>
            <% for (Airline a : airline) { %>
            <option value="<%=a.getAirlineID()%>">
                <%=a.getName()%>
            </option>
            <% } %>
        </select>
        <label for="flightNum">Flight Number: </label>
        <input type="number" id="flightNum" name="flightNum">
        <button type="submit">Submit</button>
    </form>

    <table>
        <tr>
            <td>Ticket ID</td>
            <td>Username</td>
        </tr>
        <%for (Ticket t : tickets) {%>
        <tr>
            <td><%=t.getId()%>
            <td><%=t.getUsername()%></td>
        </tr>
        <%}%>
    </table>

    <form action="viewReservations.jsp"  method="get">
        <label for="username">Username: </label>
        <input type="text" id="username" name="username">
        <button type="submit">Submit</button>
    </form>

    <table>
        <tr>
            <td>Username</td>
            <td>TicketID</td>
            <td>Flight Number</td>
        </tr>
        <%for (Ticket t : tickets2) {%>
        <tr>
            <td><%=t.getUsername()%>
            <td><%=t.getId()%></td>
            <td><%=t.getFlightNum()%></td>
        </tr>
        <%}%>
    </table>
</body>
</html>
