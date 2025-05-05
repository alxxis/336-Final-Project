<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="com.cs336.pkg.Users" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/5/2025
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    UsersService service = new UsersService();
    List<Users> users = service.getAllCustomersAndReps();


%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form method="post" action = "edit-helper.jsp">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" maxlength="50" required>
    <label for="password">Password:</label>
    <input type="text" id="password" name="password" maxlength="50"required>
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" maxlength="50" required>
    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" maxlength="50" required>
    <label for="email">Email:</label>
    <input type="text" id="email" name="email" maxlength="70" required>
    <input type="radio" id="customer" name="role" value="customer" required>
    <label for="customer">Customer</label>
    <input type="radio" id="customer_rep" name="role" value="customer_rep">
    <label for="customer_rep">Customer Rep</label>
    <button type="submit">Add User</button>
</form>


<table>
    <tr>
        <th>username</th>
        <th>password</th>
        <th>first name</th>
        <th>last name</th>
        <th>email</th>
        <th>role</th>
    </tr>
    <% for(Users user : users){ %>
    <tr>
        <th><%=user.getUsername()%></th>
        <th><%=user.getPassword()%></th>
        <th><%=user.getFirstName()%></th>
        <th><%=user.getLastName()%></th>
        <th><%=user.getEmail()%></th>
        <th><%=user.getRole()%></th>
    </tr>
    <%}%>

</table>



</body>
</html>
