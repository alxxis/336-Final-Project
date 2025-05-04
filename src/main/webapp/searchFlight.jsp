<%@ page import="com.cs336.pkg.Airport" %>
<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Load all airport options
    UsersService service = new UsersService();
    List<Airport> airports = service.getAirports();

    // Get selected value from form submission
    String selected = request.getParameter("aircraft");
    Airport selectedAirport = null;

    if ("POST".equalsIgnoreCase(request.getMethod()) && selected != null) {
        for (Airport a : airports) {
            if (a.getName().equals(selected)) {
                selectedAirport = a;
                break;
            }
        }
    }
%>

<html>
<head>
    <title>Search for Flights</title>
</head>
<body>

<form method="post">
    <label for="aircraft">Select Airport:</label>
    <select name="aircraft" id="aircraft">
        <% for (Airport a : airports) { %>
        <option value="<%= a.getName() %>" <%= a.getName().equals(selected) ? "selected" : "" %>>
            <%= a.getName() %>
        </option>
        <% } %>
    </select>
    <button type="submit">Submit</button>
</form>

<%
    if (selectedAirport != null) {
%>
<h2>Selected Airport Details</h2>
<p>ID: <%= selectedAirport.getAirportID() %></p>
<p>Name: <%= selectedAirport.getName() %></p>
<%
    }
%>

</body>
</html>
