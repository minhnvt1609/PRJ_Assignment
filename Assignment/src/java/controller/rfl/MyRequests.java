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
import java.util.ArrayList;
import model.Account;
import model.RequestForLeave;

/**
 *
 * @author TuanBro
 */
public class MyRequests extends BaseRBACController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        processGet(req, resp, account);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        RequestForLeaveDBContext db = new RequestForLeaveDBContext();
        ArrayList<RequestForLeave> myRFLs = db.listByCreator(account.getId());
        req.setAttribute("rfls", myRFLs);
        req.getRequestDispatcher("/view/request/mylist.jsp").forward(req, resp);
    }

}
