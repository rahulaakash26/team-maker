<%--
  Created by IntelliJ IDEA.
  User: Rahul
  Date: 04-04-2018
  Time: 08:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout Page</title>
</head>
<%
    session.removeAttribute("login_session");
    session.invalidate();
    response.sendRedirect("index.jsp");
%>

<body>

</body>
</html>
