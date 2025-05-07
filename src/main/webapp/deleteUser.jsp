<%@ page import="com.cs336.pkg.UsersService" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/5/2025
  Time: 6:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UsersService service = new UsersService();
    String username = request.getParameter("username");
//    System.out.println("Deleting user " + username);
    service.deleteUser(username);
    response.sendRedirect("viewUsers.jsp");

%>
<html>
<head>
    <title>Title</title>
</head>
<body>



</body>
</html>
