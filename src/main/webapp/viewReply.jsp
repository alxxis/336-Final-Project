<%@ page import="com.cs336.pkg.UsersService" %>
<%@ page import="com.cs336.pkg.Replies" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.cs336.pkg.Users" %><%--
  Created by IntelliJ IDEA.
  User: Akshay
  Date: 5/5/2025
  Time: 9:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%UsersService service = new UsersService();
System.out.println("QID IS : " + request.getParameter("qID"));
  int qID = Integer.parseInt(request.getParameter("qID"));
  List<Replies> replies = service.getReplies(qID);
  String username = (String) session.getAttribute("username");

  String reply = request.getParameter("reply");
  if ("POST".equalsIgnoreCase(request.getMethod()) && reply!= null) {
    String timeStamp = new SimpleDateFormat("yyyy:MM:dd:HH:mm:ss").format(new java.util.Date());
    service.addReply(username, qID, reply,timeStamp);
    response.sendRedirect("viewReply.jsp?qID="+qID);
  }

%>
<html>
<head>
    <title>Replies</title>
  <style>
    table,
    th,
    td {
      border: 1px solid black;
    }


  </style>
</head>
<body>

<a href='questions.jsp'><button>Go Back</button></a>

<h1><%=service.getQuestion(qID)%></h1>
<table >
  <tr>
    <th>Username</th>
    <th>Message</th>
  </tr>
  <%for (Replies r: replies){%>
    <tr>
      <td ><%=r.getAuthor()%></td>
      <td style="word-wrap: break-word"><%=r.getMessageContent()%></td>
    </tr>
  <%}%>
</table>
<%Users curUser = (Users) session.getAttribute("currentUser");
  if (curUser.getRole().equals("customer_rep")){%>
<form method="post">
  <label for="reply">Enter reply:</label>
  <textarea  name="reply" id="reply" maxlength="200" required></textarea>
  <button type="submit">Post</button>
</form>
<%}%>
</body>
</html>
