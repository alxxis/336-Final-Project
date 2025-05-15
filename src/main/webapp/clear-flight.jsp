<%@ page import="com.cs336.pkg.Flight" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/15/2025
  Time: 2:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
  ArrayList<Flight> flights = (ArrayList<Flight>) session.getAttribute("flightList");
  if (flights != null)  flights.clear();
  session.setAttribute("departure",null);
  session.setAttribute("arrival",null);
  response.sendRedirect("searchFlight.jsp");
%>


</body>
</html>
