<%-- 
    Document   : process
    Created on : Jul 3, 2025, 10:45:04 PM
    Author     : TuanBro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Process Request</title>
    </head>
    <body>
        <h3>${param.decision == '1' ? "Approve" : "Reject"} Request #${param.id}</h3>

        <form action="process" method="post">
            <input type="hidden" name="id" value="${id}" />
            <input type="hidden" name="decision" value="${decision}" />
            <label>Note:</label><br>
            <textarea name="note" rows="4" cols="50"></textarea><br><br>
            <input type="submit" value="Confirm" />
        </form>
    </body>
</html>