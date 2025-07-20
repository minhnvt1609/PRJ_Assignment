<%-- 
    Document   : agenda
    Created on : Jul 21, 2025, 1:54:40 AM
    Author     : TuanBro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDate, java.util.*, model.Employee"%>
<%@ include file="../layouts/header.jsp" %>

<h3>🗓 Agenda View</h3>

<form method="get" action="agenda" class="mb-3">
    From: <input type="date" name="from" value="${from}" required>
    To: <input type="date" name="to" value="${to}" required>
    <button type="submit">View</button>
</form>

<table border="1" class="table table-bordered">
    <thead>
        <tr>
            <th>Nhân sự</th>
            <%
                LocalDate fromDate = (LocalDate) request.getAttribute("from");
                LocalDate toDate = (LocalDate) request.getAttribute("to");
                LocalDate d = fromDate;
                while (!d.isAfter(toDate)) {
            %>
                <th><%= d.getDayOfMonth() %>/<%= d.getMonthValue() %></th>
            <%
                    d = d.plusDays(1);
                }
            %>
        </tr>
    </thead>
    <tbody>
        <%
            List<Employee> emps = (List<Employee>) request.getAttribute("emps");
            HashMap<Integer, ArrayList<LocalDate>> map = (HashMap<Integer, ArrayList<LocalDate>>) request.getAttribute("mapDaysOff");

            for (Employee e : emps) {
        %>
        <tr>
            <td><%= e.getName() %></td>
            <%
                d = fromDate;
                ArrayList<LocalDate> daysOff = map.getOrDefault(e.getEid(), new ArrayList<>());
                while (!d.isAfter(toDate)) {
                    boolean isOff = daysOff.contains(d);
            %>
                <td style="background-color: <%= isOff ? "#ff4d4d" : "#9ef79e" %>;"></td>
            <%
                    d = d.plusDays(1);
                }
            %>
        </tr>
        <% } %>
    </tbody>
</table>

<%@ include file="../layouts/footer.jsp" %>
