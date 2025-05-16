<%@ page import="com.cs336.pkg.Airline" %>
<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="com.cs336.pkg.Ticket" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs336.pkg.Users" %>
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
    <title>View Revenue</title>
    <%
        Users curUser = (Users)session.getAttribute("currentUser");
        UsersService service = new UsersService();
        out.print(service.getHeader(curUser.getRole()));%>
</head>
<body>
    <%
    ArrayList<Users> users = service.getProfitableUser();
    ArrayList<Ticket> tickets = service.getProfitableTickets();
%>
    <p>Most Profitable Customer:</p>
    <%for(Users user : users){%>
    <p><%=user.getUsername()%></p>
    <%}%>
    <p>Most active Flights:</p>
    <table>
        <%for(Ticket t : tickets){%>
        <tr>
            <td><%=t.getAirlineID()%></td>
            <td><%=t.getFlightNum()%></td>
        </tr>
            <%}%>
    </table>




    <%
        String air = request.getParameter("airlineID");
        String username = request.getParameter("username");



        List<Airline> airline = null;

        if (request.getMethod().equalsIgnoreCase("get")) {
            airline = service.getAirlines();
            request.setAttribute("airline", airline);
        }





    %>





    <form method="get">
        <label for="airlineID">Airline ID: </label>
        <select name="airlineID" id="airlineID" required>
            <% if (airline!= null) for (Airline a : airline) { %>
            <option value="<%=a.getAirlineID()%>">
                <%=a.getName()%>
            </option>
            <% } %>
        </select>
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

    <form method="get">
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
