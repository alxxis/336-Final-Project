<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="com.cs336.pkg.Users" %>
<%@ page import="com.cs336.pkg.Ticket" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/15/2025
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Waitlist</title>
    <%UsersService service = new UsersService();
        Users currentUser = (Users) session.getAttribute("currentUser");
    out.print(service.getHeader(currentUser.getRole()));%>
</head>
<body>
<%
ArrayList<Ticket> reservations = service.getReservations(currentUser.getUsername());
%>

<table>
    <tr>
        <th>TicketID</th>
        <th>airlineID</th>
        <th>flightNum</th>
        <th>depDate</th>
    </tr>
    <%for (Ticket t : reservations){%>
    <tr>
        <td><%=t.getId()%></td>
        <td><%=t.getAirlineID()%></td>
        <td><%=t.getFlightNum()%></td>
        <td><%=t.getDepDate()%></td>
        <%if (service.canBookReservation(t.getId())){%>
        <td><a href="off-waitlist.jsp?id=<%=t.getId()%>&class=<%=t.getFlightClass()%>"><button>RESERVE</button></a></td>
        <%}%>
    </tr>
    <%}%>
</table>
</body>
</html>
