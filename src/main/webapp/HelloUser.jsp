<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Dashboard</title>

    <%UsersService service = new UsersService();
    Users curUser = (Users)session.getAttribute("currentUser");
    out.print(service.getHeader(curUser.getRole()));%>
</head>

<body>


<!-- the usual HTML way -->
<%String username = (String) session.getAttribute("username");
out.print("Hello " + username);%>

<form action="logout.jsp" method="post">
    <button name="logout" value="logout">Logout</button>
</form>

</html>