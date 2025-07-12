<%-- 
    Document   : list
    Created on : Jun 30, 2025, 2:46:46 PM
    Author     : TuanBro
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layouts/header.jsp" %>

<h3>Manage Requests</h3>

<table class="table table-bordered table-hover">
    <thead class="table-light">
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Reason</th>
            <th>From</th>
            <th>To</th>
            <th>Status</th>
            <th>Created By</th>
            <th>Processed By</th>
            <th>Note</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${rfls}" var="r">
            <tr>
                <td>${r.id}</td>
                <td>${r.title}</td>
                <td>${r.reason}</td>
                <td>${r.from}</td>
                <td>${r.to}</td>
                <td>
                    <c:choose>
                        <c:when test="${r.status == 0}">
                            <span class="badge bg-warning text-dark">processing</span>
                        </c:when>
                        <c:when test="${r.status == 1}">
                            <span class="badge bg-success">approved</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-danger">rejected</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${r.createdby.username}</td>
                <td>
                    <c:out value="${r.processby != null ? r.processby.username : '-'}" />
                </td>
                <td>${r.note}</td>
                <td>
                    <a href="view?id=${r.id}" class="btn btn-info btn-sm">View</a>
                    <c:if test="${r.status == 0}">
                        <form action="process" method="get" style="display:inline-block;">
                            <input type="hidden" name="id" value="${r.id}" />
                            <input type="hidden" name="decision" value="1" />
                            <button class="btn btn-success btn-sm">Approve</button>
                        </form>
                        <form action="process" method="get" style="display:inline-block;">
                            <input type="hidden" name="id" value="${r.id}" />
                            <input type="hidden" name="decision" value="0" />
                            <button class="btn btn-danger btn-sm">Reject</button>
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<%@ include file="../layouts/footer.jsp" %>
