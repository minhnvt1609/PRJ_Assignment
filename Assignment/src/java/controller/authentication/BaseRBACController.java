/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.authentication;

import dal.RoleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.accesscontrol.Feature;
import model.accesscontrol.Role;

/**
 *
 * @author TuanBro
 */
public abstract class BaseRBACController extends BaseRequiredAuthenticationController{
    private boolean isGrantedAccessControl(
            HttpServletRequest req,
            Account account
    ) {
        String current_access_entrypoint = req.getServletPath();
        if (account.getRoles().size() == 0) {
            RoleDBContext db = new RoleDBContext();
            ArrayList<Role> roles = db.getByAccount(account.getId());
            account.setRoles(roles);
            req.getSession().setAttribute("account", account);
        }
        for (Role role : account.getRoles()) {
            for (Feature feature : role.getFeatures()) {
                if (feature.getEntrypoint().equals(current_access_entrypoint)) {
                    return true;
                }
            }
        }
        return false;
    }

    protected abstract void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException;
    protected abstract void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        if (isGrantedAccessControl(req, account)) {
            processPost(req, resp, account);
        } else {
            req.getRequestDispatcher("../view/authentication/unauthorized.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        if (isGrantedAccessControl(req, account)) {
            processGet(req, resp, account);
        } else {
            req.getRequestDispatcher("../view/authentication/unauthorized.jsp").forward(req, resp);
        }
    }
}
