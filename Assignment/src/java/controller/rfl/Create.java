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
        try {
            // Lấy dữ liệu từ form
            String title = req.getParameter("title");
            String reason = req.getParameter("reason");
            Date from = Date.valueOf(req.getParameter("from"));
            Date to = Date.valueOf(req.getParameter("to"));

            // Tạo đối tượng request
            RequestForLeave rfl = new RequestForLeave();
            rfl.setTitle(title);
            rfl.setReason(reason);
            rfl.setFrom(from);
            rfl.setTo(to);
            rfl.setCreatedby(account);
            rfl.setStatus(0); // 0 = Processing

            // Lưu vào DB
            RequestForLeaveDBContext db = new RequestForLeaveDBContext();
            db.insert(rfl);

            // Chuyển sang trang thành công
            req.getRequestDispatcher("/view/request/success.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Đã có lỗi xảy ra: " + e.getMessage());
            req.getRequestDispatcher("/view/request/create.jsp").forward(req, resp);
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        req.getRequestDispatcher("/view/request/create.jsp").forward(req, resp);
    }

}
