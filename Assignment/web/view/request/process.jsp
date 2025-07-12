<%-- 
    Document   : process
    Created on : Jul 3, 2025, 10:45:04 PM
    Author     : TuanBro
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layouts/header.jsp" %>

<h3>Process Request</h3>

<c:if test="${not empty rfl}">
    <form action="process" method="post">
        <input type="hidden" name="id" value="${rfl.id}" />
        <input type="hidden" name="decision" value="${decision}" />

        <div class="mb-3">
            <label class="form-label">Title</label>
            <input type="text" class="form-control" value="${rfl.title}" disabled>
        </div>

        <div class="mb-3">
            <label class="form-label">Reason</label>
            <textarea class="form-control" rows="3" disabled>${rfl.reason}</textarea>
        </div>

        <div class="row mb-3">
            <div class="col">
                <label class="form-label">From</label>
                <input type="text" class="form-control" value="${rfl.from}" disabled>
            </div>
            <div class="col">
                <label class="form-label">To</label>
                <input type="text" class="form-control" value="${rfl.to}" disabled>
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">Note</label>
            <textarea name="note" class="form-control" placeholder="Enter approval note..." required></textarea>
        </div>

        <div class="d-flex justify-content-between">
            <button type="submit" class="btn ${decision == 1 ? 'btn-success' : 'btn-danger'}">
                ${decision == 1 ? 'Approve' : 'Reject'}
            </button>
            <a href="list" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</c:if>

<%@ include file="../layouts/footer.jsp" %>
