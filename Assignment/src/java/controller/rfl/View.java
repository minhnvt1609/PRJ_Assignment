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
import model.RequestForLeave;

/**
 *
 * @author TuanBro
 */
public class View extends BaseRBACController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        processGet(req, resp, account);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        RequestForLeaveDBContext db = new RequestForLeaveDBContext();
        RequestForLeave rfl = db.get(id);
        req.setAttribute("rfl", rfl);
        req.getRequestDispatcher("/view/request/view.jsp").forward(req, resp);
    }

}
