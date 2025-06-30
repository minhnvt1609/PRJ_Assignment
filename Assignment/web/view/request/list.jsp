<%-- 
    Document   : list
    Created on : Jun 30, 2025, 2:46:46 PM
    Author     : TuanBro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Requests of your Employees</title>
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
                <td>Created By</td>
                <td>Processed By</td>
                <td>Note </td>
                <td></td>
            </tr>
            <c:forEach items="${requestScope.rfls}" var="r">
                <tr>
                    <td>${r.rid}</td>
                    <td>${r.title}</td>
                    <td>${r.reason}</td>
                    <td>${r.from}</td>
                    <td>${r.to}</td>
                    <td>${r.status eq 0?"PROCESSING":r.status eq 1?"Approved":"Rejected"}</td>
                    <td>${r.createdby.username}</td>
                    <td>${r.processby.username}</td>
                    <td>${r.note} </td>
                    <td>
                        <a href="process?id=${r.rid}&decision=1">Approve</a>
                        <a href="process?id=${r.rid}&decision=0">Reject</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>