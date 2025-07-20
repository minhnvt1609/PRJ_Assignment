/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.rfl;

import controller.authentication.BaseRBACController;
import dal.RequestForLeaveDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import model.Account;
import model.Employee;

/**
 *
 * @author TuanBro
 */
public class Agenda extends BaseRBACController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        processGet(req, resp, account);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        String raw_from = req.getParameter("from");
        String raw_to = req.getParameter("to");

        LocalDate from = raw_from == null ? LocalDate.now() : LocalDate.parse(raw_from);
        LocalDate to = raw_to == null ? from.plusDays(6) : LocalDate.parse(raw_to); // mặc định 7 ngày

        RequestForLeaveDBContext db = new RequestForLeaveDBContext();
        ArrayList<Employee> emps = db.getAllEmployees(); // Truy xuất toàn bộ nhân sự
        HashMap<Integer, ArrayList<LocalDate>> mapDaysOff = db.getLeaveDatesInRange(from, to);

        req.setAttribute("from", from);
        req.setAttribute("to", to);
        req.setAttribute("emps", emps);
        req.setAttribute("mapDaysOff", mapDaysOff);

        req.getRequestDispatcher("/view/request/agenda.jsp").forward(req, resp);
    }

}
