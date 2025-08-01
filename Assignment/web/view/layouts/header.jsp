<%-- 
    Document   : header
    Created on : Jul 12, 2025, 10:21:39 PM
    Author     : TuanBro
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Leave Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home">Leave System</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <c:if test="${not empty sessionScope.account}">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/rfl/create">Create Request</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/rfl/own">My Requests</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/rfl/list">Manage Requests</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/rfl/agenda">Agenda</a></li>
                    <li class="nav-item"><a class="nav-link text-danger" href="${pageContext.request.contextPath}/logout">Logout</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
<div class="container mt-4">