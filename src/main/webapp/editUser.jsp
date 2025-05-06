<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="com.cs336.pkg.Users" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/5/2025
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    UsersService service = new UsersService();
    Users user = service.getUser(request.getParameter("username"));


    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String usernameOriginal = user.getUsername();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        System.out.println("request parameter is: " + lastName);

//        UsersService service_2 = new UsersService();
        service.updateUser(usernameOriginal,username,password,firstName,lastName,email,role);
        System.out.println("finished");
        response.sendRedirect("viewUsers.jsp");
    }




%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" value= <%=user.getUsername()%> maxlength="50" required>
    <label for="password">Password:</label>
    <input type="text" id="password" name="password"  value= <%=user.getPassword()%> maxlength="50" required>
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName"  value= <%=user.getFirstName()%> maxlength="50" required>
    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" value= <%=user.getLastName()%> maxlength="50" required>
    <label for="email">Email:</label>
    <input type="text" id="email" name="email"  value= <%=user.getEmail()%> maxlength="70" required>
    <input type="radio" id="customer" name="role"   value="customer" required <%=(user.getRole().equals("customer")?"checked":"") %>>
    <label for="customer">Customer</label>
    <input type="radio" id="customer_rep" name="role" value="customer_rep" <%=(user.getRole().equals("customer_rep")?"checked":"") %>>
    <label for="customer_rep">Customer Rep</label>
    <button type="submit">Update User</button>
    <button type="reset">Reset Values</button>

</form>
<a href = 'viewUsers.jsp'>Cancel</a>

</body>
</html>
