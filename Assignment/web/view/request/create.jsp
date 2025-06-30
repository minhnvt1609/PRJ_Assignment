<%-- 
    Document   : create
    Created on : Jun 30, 2025, 1:55:27 PM
    Author     : TuanBro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form action="create" method="POST">
            <label for="title">Title:</label><br>
            <input type="text" id="title" name="title" required><br><br>

            <label for="reason">Reason:</label><br>
            <input type="text" id="reason" name="reason" required><br><br>

            <label for="from">From:</label><br>
            <input type="date" id="from" name="from" required><br><br>

            <label for="to">To:</label><br>
            <input type="date" id="to" name="to" required><br><br>

            <button type="submit">Submit</button>
    </body>
</html>
