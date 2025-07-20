<%-- 
    Document   : success
    Created on : Jun 30, 2025, 2:13:53 PM
    Author     : TuanBro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="../layouts/header.jsp" %>

<div class="container mt-5 text-center">
    <div class="alert alert-success" role="alert">
        <h4 class="alert-heading">Request Created Successfully!</h4>
        <p>Your leave request has been submitted successfully.</p>
        <hr>
        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Return to Home</a>
    </div>
</div>

<%@ include file="../layouts/footer.jsp" %>