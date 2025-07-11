/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.RequestForLeave;

/**
 *
 * @author TuanBro
 */
public class RequestForLeaveDBContext extends DBContext<RequestForLeave> {

    public ArrayList<RequestForLeave> listByCreator(int aid) {
        ArrayList<RequestForLeave> rfls = new ArrayList<>();
        try {
            String sql = "SELECT r.rid, r.title, r.reason, r.[from], r.[to], r.status, "
                    + "r.note, r.createdby, c.username as createduser, "
                    + "r.processedby, p.username as processeduser "
                    + "FROM RequestForLeave r "
                    + "JOIN Account c ON r.createdby = c.aid "
                    + "LEFT JOIN Account p ON r.processedby = p.aid "
                    + "WHERE r.createdby = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RequestForLeave r = new RequestForLeave();
                r.setId(rs.getInt("rid"));
                r.setTitle(rs.getString("title"));
                r.setReason(rs.getString("reason"));
                r.setFrom(rs.getDate("from"));
                r.setTo(rs.getDate("to"));
                r.setStatus(rs.getInt("status"));
                r.setNote(rs.getString("note"));

                Account createdby = new Account();
                createdby.setId(rs.getInt("createdby"));
                createdby.setUsername(rs.getString("createduser"));
                r.setCreatedby(createdby);

                int processedbyId = rs.getInt("processedby");
                if (!rs.wasNull()) {
                    Account processedby = new Account();
                    processedby.setId(processedbyId);
                    processedby.setUsername(rs.getString("processeduser"));
                    r.setProcessby(processedby);
                }

                rfls.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestForLeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rfls;
    }

    public void updateStatusWithNote(int rid, int status, int processedby, String note) {
        try {
            String sql = "UPDATE RequestForLeave SET status = ?, processedby = ?, note = ? WHERE rid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, processedby);
            stm.setString(3, note);
            stm.setInt(4, rid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RequestForLeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (!connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(RequestForLeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void insert(RequestForLeave model) {
        try {
            String sql = "INSERT INTO [dbo].[RequestForLeave]\n"
                    + "           ([title]\n"
                    + "           ,[reason]\n"
                    + "           ,[from]\n"
                    + "           ,[to]\n"
                    + "           ,[createdby]\n"
                    + "           ,[processedby]\n"
                    + "           ,[note]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,null\n"
                    + "           ,null\n"
                    + "           ,0)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getTitle());
            stm.setString(2, model.getReason());
            stm.setDate(3, model.getFrom());
            stm.setDate(4, model.getTo());
            stm.setInt(5, model.getCreatedby().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RequestForLeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (!connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(RequestForLeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<RequestForLeave> list(int aid) {
        ArrayList<RequestForLeave> rfls = new ArrayList<>();
        try {
            String sql = "WITH EmployeeHierarchy AS (\n"
                    + "    SELECT e.eid, e.ename, e.managerid\n"
                    + "    FROM Employee e\n"
                    + "	     INNER JOIN Account_Employee ae ON ae.eid = e.eid\n"
                    + "		 INNER JOIN Account c ON c.aid = ae.aid\n"
                    + "    WHERE c.aid = ? \n"
                    + "\n"
                    + "    UNION ALL\n"
                    + "\n"
                    + "    SELECT e.eid, e.ename, e.managerid\n"
                    + "    FROM dbo.Employee e\n"
                    + "    INNER JOIN EmployeeHierarchy eh ON e.managerid = eh.eid\n"
                    + ")\n"
                    + "SELECT rfl.rid,rfl.title,rfl.reason,rfl.[from], rfl.[to],rfl.[status],rfl.createdby,\n"
                    + "c.username as createduser,rfl.processedby,p.username as processeduser,rfl.note\n"
                    + "FROM EmployeeHierarchy e\n"
                    + "	 INNER JOIN Account_Employee ae ON ae.eid = e.eid\n"
                    + "	 INNER JOIN Account c ON c.aid = ae.aid\n"
                    + "	 INNER JOIN RequestForLeave rfl ON rfl.createdby = c.aid\n"
                    + "	 LEFT JOIN Account p ON p.aid = rfl.processedby\n"
                    + "\n"
                    + "WHERE c.aid != ?; ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            stm.setInt(2, aid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RequestForLeave r = new RequestForLeave();
                //rfl.rid,rfl.title,rfl.reason,rfl.[from], 
                //rfl.[to],rfl.[status],rfl.createdby,
                //c.username as createduser,rfl.prcoessedby,
                //p.username as processeduser,rfl.note
                r.setId(rs.getInt("rid"));
                r.setTitle(rs.getString("title"));
                r.setReason(rs.getString("reason"));
                r.setFrom(rs.getDate("from"));
                r.setTo(rs.getDate("to"));
                r.setStatus(rs.getInt("status"));
                Account createdby = new Account();
                createdby.setId(rs.getInt("createdby"));
                createdby.setUsername(rs.getString("createduser"));
                r.setCreatedby(createdby);

                int processedbyid = rs.getInt("processedby");
                if (processedbyid > 0) {
                    Account processedby = new Account();
                    processedby.setId(rs.getInt("processedby"));
                    processedby.setUsername(rs.getString("processeduser"));
                    r.setProcessby(processedby);
                    r.setNote(rs.getString("note"));
                }
                rfls.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestForLeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (!connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(RequestForLeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return rfls;
    }

    @Override
    public ArrayList<RequestForLeave> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public RequestForLeave get(int id) {
        RequestForLeave r = null;
        try {
            String sql = "SELECT r.rid, r.title, r.reason, r.[from], r.[to], r.status, r.note, "
                    + "r.createdby, c.username as createduser, "
                    + "r.processedby, p.username as processeduser "
                    + "FROM RequestForLeave r "
                    + "INNER JOIN Account c ON r.createdby = c.aid "
                    + "LEFT JOIN Account p ON r.processedby = p.aid "
                    + "WHERE r.rid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                r = new RequestForLeave();
                r.setId(rs.getInt("rid"));
                r.setTitle(rs.getString("title"));
                r.setReason(rs.getString("reason"));
                r.setFrom(rs.getDate("from"));
                r.setTo(rs.getDate("to"));
                r.setStatus(rs.getInt("status"));
                r.setNote(rs.getString("note"));

                Account created = new Account();
                created.setId(rs.getInt("createdby"));
                created.setUsername(rs.getString("createduser"));
                r.setCreatedby(created);

                int processedId = rs.getInt("processedby");
                if (!rs.wasNull()) {
                    Account processed = new Account();
                    processed.setId(processedId);
                    processed.setUsername(rs.getString("processeduser"));
                    r.setProcessby(processed);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestForLeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (!connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(RequestForLeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return r;
    }

    @Override
    public void update(RequestForLeave model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
