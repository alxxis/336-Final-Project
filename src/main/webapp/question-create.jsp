<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.cs336.pkg.UsersService" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/5/2025
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    UsersService service = new UsersService();
    String username = (String)session.getAttribute("username");
    String question = request.getParameter("question");

    if ("POST".equalsIgnoreCase(request.getMethod()) && question!= null) {
        String timeStamp = new SimpleDateFormat("yyyy:MM:dd:HH:mm:ss").format(new java.util.Date());
        service.addQuestion(username, question,timeStamp);
        response.sendRedirect("questions.jsp");
    }
%>
<html>
<head>
    <title>Title</title>

</head>
<body>

<form method="post">
    <label for="question">Enter Question:</label>
    <input name="question" id="question" maxlength="200" required>
    <button type="submit">Post</button>
</form>
<a href='questions.jsp'><button>Cancel</button></a>

</body>
</html>
