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
</head>
<body>
    <%
    UsersService service = new UsersService();
    ArrayList<Users> users = service.getProfitableUser();
%>
    <p>Most Profitable Customer:</p>
    <%for(Users user : users){%>
    <p><%=user.getUsername()%></p>
    <%}%>
    <p>Most active Flights:</p>
</body>
</html>
