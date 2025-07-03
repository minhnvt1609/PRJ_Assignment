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
import model.Account;

/**
 *
 * @author TuanBro
 */
public class Process extends BaseRBACController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            int decision = Integer.parseInt(req.getParameter("decision")); // 1=approve, 0=reject
            String note = req.getParameter("note");

            RequestForLeaveDBContext db = new RequestForLeaveDBContext();
            db.updateStatusWithNote(id, decision == 1 ? 1 : 2, account.getId(), note);

            resp.sendRedirect("list");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(400, "Bad request");
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int decision = Integer.parseInt(req.getParameter("decision"));
        req.setAttribute("id", id);
        req.setAttribute("decision", decision);
        req.getRequestDispatcher("/view/request/process.jsp").forward(req, resp);
    }

}
