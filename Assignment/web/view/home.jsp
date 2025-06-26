<%-- 
    Document   : home
    Created on : Jun 26, 2025, 9:59:10 PM
    Author     : TuanBro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<%
    Account acc = (Account) session.getAttribute("account");
    if (acc == null) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
</head>
<body>
    <div class="container mt-5">
        <h3>Welcome, <%= acc.getDisplayname() %>!</h3>
        <p>Select:</p>
        <ul>
            <li><a href="request/create">Create request</a></li>
            <li><a href="request/list">List request</a></li>
            <li><a href="agenda">List agenda</a></li>
            <li><a href="logout">Logout</a></li>
        </ul>
    </div>
</body>
</html>
