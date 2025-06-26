/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author TuanBro
 */
public class RequestForLeave extends BaseModel {

    private String title;
    private String reason;
    private Date from;
    private Date to;
    private Account createdby;
    private Account processby;
    private String note;
    private int status;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getFrom() {
        return from;
    }

    public void setFrom(Date from) {
        this.from = from;
    }

    public Date getTo() {
        return to;
    }

    public void setTo(Date to) {
        this.to = to;
    }

    public Account getCreatedby() {
        return createdby;
    }

    public void setCreatedby(Account createdby) {
        this.createdby = createdby;
    }

    public Account getProcessby() {
        return processby;
    }

    public void setProcessby(Account processby) {
        this.processby = processby;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
