<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="com.cs336.pkg.Ticket" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs336.pkg.Users" %><%--
  Created by IntelliJ IDEA.
  User: apger
  Date: 5/15/2025
  Time: 4:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sales Report</title>
    <%
        Users curUser = (Users)session.getAttribute("currentUser");
        UsersService service = new UsersService();
        out.print(service.getHeader(curUser.getRole()));%>
</head>

<%
    String selectedMonth = request.getParameter("month");
    List<Ticket> tickets = new ArrayList<>(); // Declare a list to store tickets.

    if (selectedMonth != null && !selectedMonth.isEmpty()) {
        tickets = service.getTickets(selectedMonth);  // Fetch tickets for the selected month
    }
%>
<body>
    <form method="get">
        <label for="month">Select Month:</label>
        <select name="month" id="month" required>
            <option value="January">January</option>
            <option value="February">February</option>
            <option value="March">March</option>
            <option value="April">April</option>
            <option value="May">May</option>
            <option value="June">June</option>
            <option value="July">July</option>
            <option value="August">August</option>
            <option value="September">September</option>
            <option value="October">October</option>
            <option value="November">November</option>
            <option value="December">December</option>
        </select>
        <button type="submit">Submit</button>
    </form>
    <table>
        <tr>
            <td>Username</td>
            <td>Ticket ID</td>
            <td>Price</td>
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
