<%--
  Created by IntelliJ IDEA.
  User: apger
  Date: 5/15/2025
  Time: 12:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cs336.pkg.Users" %>
<%@ page import="com.cs336.pkg.Ticket" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="com.cs336.pkg.Flight" %>
<html>
<head>
    <title>Tickets</title>
    <%Users curUser = (Users)session.getAttribute("currentUser");
        UsersService service = new UsersService();
        out.print(service.getHeader(curUser.getRole()));%>
</head>
<body>
    <%

        Users currentUser = (Users) session.getAttribute("currentUser");
        List<Ticket> pastFlights = service.getpastTickets(currentUser.getUsername());
        List<Ticket> upcomingFlights = service.getFutureTickets(currentUser.getUsername());


    %>
    <h2>Past Flights</h2>
    <table>
        <tr>
            <th>TicketID</th>
            <th>airlineID</th>
            <th>flightNum</th>
            <th>depDate</th>
        </tr>
        <%for (Ticket t : pastFlights){%>
        <tr>
            <td><%=t.getId()%></td>
            <td><%=t.getAirlineID()%></td>
            <td><%=t.getFlightNum()%></td>
            <td><%=t.getDepDate()%></td>
        </tr>
        <%}%>
    </table>

    <h2>Upcoming Flights</h2>
    <table>
        <tr>
            <th>TicketID</th>
            <th>airlineID</th>
            <th>flightNum</th>
            <th>class</th>
            <th>depDate</th>
        </tr>
        <%for (Ticket t : upcomingFlights){%>
        <tr>
            <td><%=t.getId()%></td>
            <td><%=t.getAirlineID()%></td>
            <td><%=t.getFlightNum()%></td>
            <td><%=t.getFlightClass()%></td>
            <td><%=t.getDepDate()%></td>
            <td><a href="sell.jsp?id=<%=t.getId()%>&class=<%=t.getFlightClass()%>"><button>Sell</button></a></td>
        </tr>
        <%}%>
    </table>

</body>
</html>
