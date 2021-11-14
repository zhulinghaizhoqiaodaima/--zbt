package com.ly.model;

public class Repairs {
     private int Rid;
     private String Eqname;
     private String state;
     private String Department;
     private String Issue;
     private String Btime;
     private String Wtime;
     private String Wname;
     private int Eqid;

    public int getRid() {
        return Rid;
    }

    public void setRid(int rid) {
        Rid = rid;
    }

    public String getEqname() {
        return Eqname;
    }

    public void setEqname(String eqname) {
        Eqname = eqname;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getDepartment() {
        return Department;
    }

    public void setDepartment(String department) {
        Department = department;
    }

    public String getIssue() {
        return Issue;
    }

    public void setIssue(String issue) {
        Issue = issue;
    }

    public String getBtime() {
        return Btime;
    }

    public void setBtime(String btime) {
        Btime = btime;
    }

    public String getWtime() {
        return Wtime;
    }

    public void setWtime(String wtime) {
        Wtime = wtime;
    }

    public String getWname() {
        return Wname;
    }

    public void setWname(String wname) {
        Wname = wname;
    }

    public int getEqid() {
        return Eqid;
    }

    public void setEqid(int eqid) {
        Eqid = eqid;
    }
}
