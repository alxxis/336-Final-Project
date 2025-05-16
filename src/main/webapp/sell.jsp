<%@ page import="com.cs336.pkg.Users" %>
<%@ page import="com.cs336.pkg.UsersService" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/15/2025
  Time: 8:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String class_name = request.getParameter("class");
  int id = Integer.parseInt(request.getParameter("id"));
  UsersService service = new UsersService();

  if ("post".equalsIgnoreCase(request.getMethod())) {
      service.deleteTicket(id);
      response.sendRedirect("tickets.jsp");
  }



%>
<html>
<head>
    <title>Selling Flight</title>
</head>
<body>
<% if (class_name.equalsIgnoreCase("economy")){
  out.print("<h1> Cancellation Fee Mandatory </h1>\n <p> Fee required: $35.00</p>");
} else{
  out.print("<h1>No Fee Required!</h1>");
}%>

<form method="post">
  <button type="submit"><%=class_name.equalsIgnoreCase("economy") ? "Pay" : "Sell"%></button>
</form>
</body>
</html>
