<%-- 
    Document   : mylist
    Created on : Jul 3, 2025, 11:03:15 PM
    Author     : TuanBro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View your requests</title>
    </head>
    <body>
        <table border="1px">
            <tr>
                <td>Id</td>
                <td>Title</td>
                <td>Reason</td>
                <td>From</td>
                <td>To</td>
                <td>Status</td>
                <td>Processed By</td>
                <td>Note </td>
                <td></td>
            </tr>
            <c:forEach items="${rfls}" var="r">
                <tr>
                    <td>${r.id}</td>
                    <td>${r.title}</td>
                    <td>${r.reason}</td>
                    <td>${r.from}</td>
                    <td>${r.to}</td>
                    <td>
                <c:choose>
                    <c:when test="${r.status == 0}">Processing</c:when>
                    <c:when test="${r.status == 1}">Approved</c:when>
                    <c:otherwise>Rejected</c:otherwise>
                </c:choose>
                </td>
                <td>${r.processby != null ? r.processby.username : '-'}</td>
                <td>${r.note}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
