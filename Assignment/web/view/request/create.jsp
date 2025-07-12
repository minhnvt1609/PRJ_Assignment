<%-- 
    Document   : create
    Created on : Jun 30, 2025, 1:55:27 PM
    Author     : TuanBro
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="../layouts/header.jsp" %>

<h3>Create Leave Request</h3>

<form action="create" method="post">
    <div class="mb-3">
        <label class="form-label">Title</label>
        <input type="text" name="title" class="form-control" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Reason</label>
        <textarea name="reason" class="form-control" rows="3" required></textarea>
    </div>

    <div class="row">
        <div class="col">
            <label class="form-label">From</label>
            <input type="date" name="from" class="form-control" required>
        </div>
        <div class="col">
            <label class="form-label">To</label>
            <input type="date" name="to" class="form-control" required>
        </div>
    </div>

    <br>
    <div class="d-flex justify-content-between">
        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="../home" class="btn btn-secondary">Cancel</a>
    </div>
</form>

<%@ include file="../layouts/footer.jsp" %>