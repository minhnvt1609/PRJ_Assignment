/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author TuanBro
 */
public class Employee {

    private String name;
    private Account account;
    private Employee manager;
    private ArrayList<Employee> employees = new ArrayList<>();
    private ArrayList<RequestForLeave> requests = new ArrayList<>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Employee getManager() {
        return manager;
    }

    public void setManager(Employee manager) {
        this.manager = manager;
    }

    public ArrayList<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(ArrayList<Employee> employees) {
        this.employees = employees;
    }

    public ArrayList<RequestForLeave> getRequests() {
        return requests;
    }

    public void setRequests(ArrayList<RequestForLeave> requests) {
        this.requests = requests;
    }

}
