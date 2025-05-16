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
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Confirm Flight</title>
</head>
<body>
    <%
        UsersService service = new UsersService();
        ArrayList<Flight> flights = (ArrayList<Flight>) session.getAttribute("flightList") ;
        String departure = (String) session.getAttribute("departure");
        String arrival = (String) session.getAttribute("arrival");
        Double price = 0.0;
        boolean needsReservation = false;

        for (Flight f : flights){
            price += f.getPrice();
            needsReservation = !service.hasEnoughSeats(f);
        }
        Users currentUser = (Users) session.getAttribute("currentUser");
    %>
    <p>Departure Airport: <%=departure%></p>
    <p>Arrival Airport: <%=arrival%></p>
    <p>Price: <%=price%></p>
    <label for="class">Class:</label>


<%--    <form action="add-to-waitlist.jsp" method="post">--%>
<%--        <button type="submit">waitlist</button>--%>
<%--    </form>--%>
    <form action=<%=needsReservation == false ? "add-ticket.jsp" : "add-to-waitlist.jsp"%> method="post">
        <select name="class" id="class" required>
            <option value="economy">Economy</option>
            <option value="business">Business</option>
            <option value="first">First</option>
        </select>
        <input type="<%= currentUser.getRole().equalsIgnoreCase("customer_rep") ? "text" : "hidden" %>" name="user" value="<%=currentUser.getUsername()%>" />
<%--        <input type="hidden" name="class" value="<%=airClass%>">--%>
        <button type="submit"><%=needsReservation == false ? "Buy" : "Reserve"%></button>
    </form>
    <form action="clear-flight.jsp" method="get">
        <button type="submit">Cancel</button>
    </form>
</body>
</html>
