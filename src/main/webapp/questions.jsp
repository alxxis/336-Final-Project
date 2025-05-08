<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="com.cs336.pkg.Questions" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs336.pkg.Users" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/5/2025
  Time: 7:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    UsersService service = new UsersService();
    List<Questions> questions = service.getAllQuestions();
    String search = request.getParameter("search");
    Users curUser = (Users) session.getAttribute("currentUser");

    if ("POST".equalsIgnoreCase(request.getMethod()) && search!= null) {
        questions = service.getAllQuestions(search);
    }
%>
<html>
<head>
    <title>Questions</title>
    <%out.print(service.getHeader(curUser.getRole()));%>
    <style>
        table,
        th,
        td {
            border: 1px solid black;
        }

    </style>
</head>
<body>
<form method="post">
    <label for="search">Search keywords in Question or Answer:</label>
    <input name="search" id = "search" type="text" maxlength="100">
    <button type="submit">Search</button>
</form>

<%if(curUser.getRole().equalsIgnoreCase("customer")){%>
    <a href='question-create.jsp'><button>Post New Question</button></a>
<%}%>
<%if (questions!= null){%>
    <table>
        <tr>
            <th>question</th>
        </tr>
        <tr><%for(Questions q: questions){%>
            <td><%=q.getMessageContent()%></td>
            <td><a href='viewReply.jsp?qID=<%=q.getqID()%>'><button>View Replies</button></a></td>
        </tr>
        <%}%>
    </table>
<%}%>
</body>
</html>
