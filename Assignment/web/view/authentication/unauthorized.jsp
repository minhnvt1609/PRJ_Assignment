<%-- 
    Document   : unauthorized
    Created on : Jul 21, 2025, 1:22:43 PM
    Author     : TuanBro
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Not allow</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container text-center mt-5">
        <h1 class="text-danger">🚫Not allow</h1>
        <p>You do not have permission to access this feature.</p>
        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary mt-3">⬅️Return</a>
    </div>
</body>
</html>