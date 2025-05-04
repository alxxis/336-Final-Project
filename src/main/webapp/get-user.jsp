<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%--<%@ page import="com.cs336.pkg.ApplicationDB" %>--%>
<%@ page import="com.cs336.pkg.*" %>
<%--<%@ page import="main.java.com.cs336.pkg.ApplicationDB" %>--%>

<html>
<head>
    <title>Student Record</title>
</head>
<body>
<%
    if (request.getAttribute("user") != null) {
        Users user  = (Users) request.getAttribute("user");
        System.out.println("USER" + user);
%>

<h1>Student Record</h1>
<div>ID: <%= user.getUsername()%></div>
<div>First Name: <%= user.getFirstName()%></div>
<div>Last Name: <%= user.getLastName()%></div>

<%
} else {
%>

<h1>No student record found.</h1>

<% } %>
</body>
</html>