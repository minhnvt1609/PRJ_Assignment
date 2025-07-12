<%-- 
    Document   : mylist
    Created on : Jul 3, 2025, 11:03:15 PM
    Author     : TuanBro
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layouts/header.jsp" %>

<h3>View your requests</h3>

<table class="table table-bordered table-hover">
    <thead class="table-light">
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Reason</th>
            <th>From</th>
            <th>To</th>
            <th>Status</th>
            <th>Processed By</th>
            <th>Note</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${requestScope.rfls}" var="r">
            <tr>
                <td>${r.id}</td>
                <td>${r.title}</td>
                <td>${r.reason}</td>
                <td>${r.from}</td>
                <td>${r.to}</td>
                <td>
                    <c:choose>
                        <c:when test="${r.status == 0}"><span class="badge bg-warning text-dark">Processing</span></c:when>
                        <c:when test="${r.status == 1}"><span class="badge bg-success">Approved</span></c:when>
                        <c:otherwise><span class="badge bg-danger">Rejected</span></c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:out value="${r.processby != null ? r.processby.username : '-'}"/>
                </td>
                <td>${r.note}</td>
                <td>
                    <a href="view?id=${r.id}" class="btn btn-info btn-sm">View</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<%@ include file="../layouts/footer.jsp" %>
