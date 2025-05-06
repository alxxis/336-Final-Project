<%@ page import="com.cs336.pkg.UsersService" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/5/2025
  Time: 10:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%

String username = request.getParameter("username");
String password = request.getParameter("password");
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String email = request.getParameter("email");
String role = request.getParameter("role");

  UsersService service = new UsersService();
  service.addUser(username,password,firstName,lastName,email,role);
  response.sendRedirect("viewUsers.jsp");
%>

</body>
</html>
