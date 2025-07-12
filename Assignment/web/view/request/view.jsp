<%-- 
    Document   : view
    Created on : Jul 12, 2025, 11:05:04 PM
    Author     : TuanBro
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layouts/header.jsp" %>

<h3>Request Detail</h3>

<c:if test="${not empty rfl}">
    <table class="table table-bordered">
        <tr>
            <th>Title</th>
            <td>${rfl.title}</td>
        </tr>
        <tr>
            <th>Reason</th>
            <td>${rfl.reason}</td>
        </tr>
        <tr>
            <th>From</th>
            <td>${rfl.from}</td>
        </tr>
        <tr>
            <th>To</th>
            <td>${rfl.to}</td>
        </tr>
        <tr>
            <th>Status</th>
            <td>
                <c:choose>
                    <c:when test="${rfl.status == 0}">Processing</c:when>
                    <c:when test="${rfl.status == 1}">Approved</c:when>
                    <c:otherwise>Rejected</c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <th>Created By</th>
            <td>${rfl.createdby.username}</td>
        </tr>
        <tr>
            <th>Processed By</th>
            <td>
                <c:out value="${rfl.processby != null ? rfl.processby.username : '-'}" />
            </td>
        </tr>
        <tr>
            <th>Note</th>
            <td>${rfl.note}</td>
        </tr>
    </table>
    <a href="javascript:history.back()" class="btn btn-secondary"> Back </a>
</c:if>

<%@ include file="../layouts/footer.jsp" %>
