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
import java.sql.Date;
import model.Account;
import model.RequestForLeave;

/**
 *
 * @author TuanBro
 */
public class Create extends BaseRBACController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        RequestForLeave rfl = new RequestForLeave();
        rfl.setTitle(req.getParameter("title"));
        rfl.setReason(req.getParameter("reason"));
        rfl.setFrom(Date.valueOf(req.getParameter("from")));
        rfl.setTo(Date.valueOf(req.getParameter("to")));
        rfl.setCreatedby(account);

        RequestForLeaveDBContext db = new RequestForLeaveDBContext();
        db.insert(rfl);
        resp.getWriter().println("inserted!");
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
