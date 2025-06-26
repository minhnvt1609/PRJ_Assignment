<%-- 
    Document   : login
    Created on : Jun 26, 2025, 9:57:51 PM
    Author     : TuanBro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form action="login" method="POST">
            Username:<input type="text" name="username"/><br/>
            Password:<input type="password" name="password"/> <br/>
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>
