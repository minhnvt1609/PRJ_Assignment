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
<%@ include file="layouts/header.jsp" %>

<h3 class="mb-4">Welcome, <strong><%= acc.getDisplayname() %></strong>!</h3>

<div class="list-group">
    <a href="rfl/create" class="list-group-item list-group-item-action">➕ Create Request</a>
    <a href="rfl/own" class="list-group-item list-group-item-action">🗂 My Requests</a>
    <a href="rfl/list" class="list-group-item list-group-item-action">📋 Manage Requests</a>
    <a href="rfl/agenda" class="list-group-item list-group-item-action">🗓 Agenda</a>
    <a href="logout" class="list-group-item list-group-item-action text-danger">🚪 Logout</a>
</div>

<%@ include file="layouts/footer.jsp" %>
